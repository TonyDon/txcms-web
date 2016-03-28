<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台-站点类目管理</title>
<%@include file="inc-css.jspf"%>
</head>
<body>
	<div id="wrapper">
		<%@include file="inc-nav.jspf"%>

		<!-- Page Content -->
		<div id="page-wrapper" class="easyui-style">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">CMS内容管理/类别管理</h4>
						<table id="sitecat_data_table"></table>
						<div id="sitecatAddWin" class="easyui-window" title="添加站点类目"
							data-options="modal:true,closed:true,iconCls:'icon-save'"
							style="width: 350px; height:auto; padding: 10px;">
							<div style="padding: 10px">
								<form id="sitecatAddFrm" method="post">
									<table cellpadding="5"  class="table table-striped table-bordered table-hover">
										<tr>
											<td id="name_tit">类目名:</td>
											<td><input class="easyui-textbox" type="text"
												name="name" data-options="required:true"></td>
										</tr>
										<tr>
											<td>显示顺序:</td>
											<td><input class="easyui-textbox" type="text"
												name="dispOrder" data-options="required:true"></td>
										</tr>
										<tr>
											<td>状态:</td>
											<td><input class="easyui-textbox" type="text"
												name="status" data-options="required:true"></td>
										</tr>
										<tr>
											<td>站点类型:</td>
											<td><select id="siteType" name="siteType" class="easyui-validatebox" 
												data-options="required:true"></select>
											</td>
										</tr>
									</table>
									<div style="text-align: center; padding: 5px">
										<a href="javascript:void(0)" class="btn btn-primary" onclick="SITE_CAT.submitAddForm();">提 交</a>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="javascript:void(0)" class="btn btn-warning" onclick="SITE_CAT.clearAddForm();">清 空</a>
									</div>
								</form>
							</div>
						</div>
						<div style="padding:5px 0">
							<button id="rebuidCatFileBtn" type="button" class="btn btn-info btn-sm">构建JSON文件</button>
						</div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<%@include file="inc-footer.jspf"%>
	<%@include file="inc-js.jspf"%>
	<%@include file="inc-mgr-js.jspf"%>


	<script>
		initJQuery();


		var SiteCatTree = $('#sitecat_data_table');

		function convertTreeRows(datas){
			for(var k in datas){
				var rid = datas[k].rid;
				var nodeNum = datas[k].nodeNum;
				datas[k]._parentId = rid; //这里必须用_parentId关联父ID
				if(nodeNum>0){
					datas[k].state='closed';
				}else{
					datas[k].state='open';
				}
			}
			//alert(J.toStr(datas));
			return datas;
		};

		function parseModel(model) {
			var d = {};
			d.total = model.pageDTO.total;
			d.rows = convertTreeRows(model.pageDTO.datas);
			SiteCatTree.treegrid("options").records = d.total;
			return d;
		};

		SiteCatTree.treegrid({
			method : 'get',
			title : '站点类目列表',
			iconCls : 'icon-save',
			columns : [ [
			{
				field : 'id',
				title : 'ID',
				width : 30
			}, {
				field : 'name',
				title : '类目名称',
				width : 120
			}, {
				field : 'rid',
				title : '父类ID',
				width : 30
			}, {
				field : 'catPath',
				title : '分类路径',
				width : 35
			}, {
				field : 'dispOrder',
				title : '显示顺序',
				width : 22
			}, {
				field : 'status',
				title : '状态',
				width : 22
			}, {
				field : 'nodeNum',
				title : '节点数',
				width : 22
			}, {
				field : 'siteType',
				title : '站点类型',
				width : 22
			}
			] ],
			idField : 'id',
			treeField: 'name',
			width : '100%',
			height : 500,
			animate: true,
			pagination : true,
			rownumbers : true,
			singleSelect : true,
			remoteSort : false,
			fitColumns : true,
			showFooter : true,
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 20,
			pageList : [20, 50],
			records : 0,
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					SITE_CAT.initAdd();
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					SITE_CAT.del();
				}
			}, '-', {
				text: '清除选中行',
				iconCls : 'icon-clear',
				handler: function(){
					SiteCatTree.treegrid('clearSelections');
				}
			}],
			loader : function(param, succCall, err) {
				var opts = SiteCatTree.treegrid("options");
				var pgno = param.page;
				var ls = param.rows;
				var cr = (pgno - 1) * ls;
				var rid = param.id || 0 ;
				var params = $.extend({
					rid:rid,
					crow : cr,
					listSize : ls,
					records : opts.records,
					sord : opts.sortOrder,
					sidx : opts.sortName
				}, param);
				$.ajax({
					type : opts.method,
					url : window.ctx + '/manager/app/sitecat/treelist.json',
					data : params,
					dataType : "json",
					success : function(model) {
						succCall(parseModel(model));
					},
					error : function(xhr, ts) {
						err();
					}
				});
			}
		});



		var SITE_CAT={};

		SITE_CAT.JQ_ADD_FORM = $('#sitecatAddFrm');

		SITE_CAT.initAdd = function() {
			$('#sitecatAddWin').window('open');
		};

		SITE_CAT.clearAddForm = function() {
			this.JQ_ADD_FORM.form('clear');
		};

		SITE_CAT.submitAddForm = function() {
			var row = SiteCatTree.treegrid('getSelected');
			var curr_rid = !row ? 0 : row.id ;
			this.JQ_ADD_FORM.form('submit', {
					ajax : true,
					queryParams : {
						r : ut.r()
					},
					url : window.ctx + '/manager/app/sitecat/add.json',
					onSubmit : function(params) {
						params.rid = curr_rid;
						return $(this).form('enableValidation').form('validate');
					},
					success : function(data) {
						var res = jQuery.parseJSON(data)
						if (res.exception || res.validErrors && res.validErrors.length > 0) {
							var msg = [];
							var errs = res.validErrors;
							for ( var k in errs) {
								var err = errs[k].split('@');
								if (err.length == 2) {
									msg.push($('#' + err[1] + '_tit').text() + err[0]);
								} else {
									msg.push(err[0]);
								}
							}
							if(res.exception){
								msg.push(res.exception.replace(/\r|\n/,'<br/>'));
							}
							TxWebWin.alertWarn('添加失败，失败原因：<br/>' + msg.join('<br/>'));
						} else {
							alert('添加成功！');
							SITE_CAT.clearAddForm();
							$('#sitecatAddWin').window('close');
							SiteCatTree.treegrid('reload');
						}
					}
				});
			};
			
		SITE_CAT.del = function() {
				var row = SiteCatTree.treegrid('getSelected');
				if (!row) {
					TxWebWin.alert('请单击需要删除的记录, 然后再进行删除.');
				} else {
					$.post(window.ctx + '/manager/app/sitecat/' + row.id + '.json', '_method=delete', function(r) {
								if (r.num > 0) {
									TxWebWin.alert('删除成功！');
								}
								SiteCatTree.treegrid('clearSelections');
								SiteCatTree.treegrid('reload');
							});
				}
		};
		
		$(function(){
			$('#siteType').txwebInitSelect({
				'url' : window.ctx + '/manager/app/dictconfig/jsonp',
				'params' : {'dictCode' : 'SITE_TYPE'},
				'valueName' : 'dictValue',
				'textName' : 'name',
				'defaultText' : '--'
			});
			$('#rebuidCatFileBtn').on('click', function(){
				$.get(window.ctx + '/manager/app/sitecat/rebuild.json', function(){
					$.get(window.ctx + '/manager/app/sitecatlevel/rebuild.json', function(){
						alert('构建成功');
					});
				});
				
			});
		});
	</script>
</body>
</html>