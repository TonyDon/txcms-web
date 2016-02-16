<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台-内容管理</title>
<meta content="" name="keywords">
<meta content="" name="description">
<%@include file="inc-css.jspf" %>
<style>

</style>
</head>
<body>
<div id="wrapper">
        <%@include file="inc-nav.jspf" %>

        <!-- Page Content -->
        <div id="page-wrapper" class="easyui-style">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">CMS管理/Info内容管理</h4>
						<div style="padding:0 0 0.5em 0;">
                        	<form id="queryFrm" class="form-inline">
                        		<div class="form-group">
                        		<label for="title">标题：</label>
                        		<input type="text" id="q_title" name="title"  class="form-control input-sm">
                        		</div>
                        		<div class="form-group">
                        		<label for="id">ID编号：</label>
                        		<input type="text" id="q_id" name="id"  class="form-control input-sm">
                        		</div>
                        		<div class="form-group">
                        		<label for="id">删除：</label>
							      <select id="q_is_delete" name="isDelete" class="form-control input-sm">
							      <option value="1">是</option>
							      <option value="0" selected="selected">否</option>
							      </select>
                        		</div>
                        		<div class="form-group">
                        		<label for="id">状态：</label>
							      <select id="q_info_state" name="infoState"  class="form-control input-sm"></select>
                        		</div>
                        		<button id="queryBtn" type="button" class="btn btn-info btn-sm">搜索</button>
                        	</form>
                        </div>
						<table id="data_grid"></table>
						<div style="padding:0 0 0.5em 0;"></div>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container-fluid -->
		</div>
        <!-- /#page-wrapper -->
        
        <div id="modiStateWin" class="easyui-window" title="编辑信息状态"
								data-options="modal:true,closed:true,iconCls:'icon-save'"
								style="width: 380px; height:auto; padding: 10px;">
								<div style="padding:10px">
							    <form id="modiStateFrm" method="post">
										<table cellpadding="5" class="table table-striped table-bordered table-hover">
											<tr>
												<td id="infoState_tit">信息状态:</td>
												<td>
												<select id="modiInfoState" class="form-control input-sm easyui-validatebox" style="width: 100px;" data-options="required:true"></select>
												</td>
											</tr>
										</table>
										<div style="text-align: center; padding: 5px">
											<a href="javascript:void(0)" class="btn btn-primary" onclick="CMS_INFO.doModiState();">更 新</a>
										</div>
									</form>
							    </div>
		</div>
</div>
<!-- /#wrapper -->


<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<%@include file="inc-mgr-js.jspf" %>
<script src="${ut:getCtxPath()}/static/keditor/kindeditor-min.js"></script>
<script src="${ut:getCtxPath()}/static/keditor/lang/zh_CN.js"></script>

	<script>
		initJQuery();
		function parseModel(model) {
			var d = {};
			d.total = model.pageDTO.total;
			d.rows = model.pageDTO.datas;
			TXWEB.tb.datagrid("options").records = d.total;
			return d;
		};
		
		var TXWEB = {};
		TXWEB.tb = $('#data_grid');
		TXWEB.queryFrm = $('#queryFrm');
		TXWEB.infoIdNavTmpl = '<a href="./cmsinfo/view?id=@id&m=cmsInfo" target="_info_view">@id</a>';
		TXWEB.GetInfoIdNav = function(id){
			return TXWEB.infoIdNavTmpl.replace(/@id/g, id).replace(/@ctx/, window.ctx);
		};
	
		
		TXWEB.tb.datagrid({
			method : 'get',
			title : '信息列表',
			iconCls : 'icon-save',
			columns : [ [ {
				field : 'id',
				checkbox : true,
				title : '',
				width : 50
			}, {
				field : '_ID_CODE_',
				title : 'ID编号',
				width : 100,
				formatter:function(value,row,index){
					return TXWEB.GetInfoIdNav(row.id);
				}
			}, {
				field : 'catId',
				title : '分类ID',
				width : 50
			}, {
				field : 'title',
				title : '信息标题',
				width : 200
			}, {
				field : 'authorId',
				title : '发布者ID',
				width : 80
			}, {
				field : 'hasPic',
				title : '有图',
				width : 55
			},{
				field : 'hasVideo',
				title : '有视频',
				width : 55
			}, {
				field : 'infoType',
				title : '信息类型',
				width : 55
			},{
				field : 'infoState',
				title : '信息状态',
				width : 55
			},{
				field : 'isDelete',
				title : '删除标识',
				width : 55
			}, {
				field : 'updateTime',
				title : '更新时间',
				width : 150,
				formatter:function(value,row,index){
					if (row.updateTime){
						return ut.parseDate(row.updateTime);
					} else {
						return '-';
					}
				}
			},{
				field : 'createTime',
				title : '创建时间',
				width : 150,
				formatter:function(value,row,index){
					if (row.createTime){
						return ut.parseDate(row.createTime);
					} else {
						return '-';
					}
				}
			}] ],
			idField : 'id',
			width : '100%',
			height : 'auto',
			nowrap : true,
			striped : true,
			pagination : true,
			rownumbers : true,
			singleSelect : false,
			remoteSort : false,
			fitColumns : false,
			showFooter : true,
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [10, 20, 50],
			records : 0,
			toolbar : [ {
				id : 'del_btn',
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					CMS_INFO.del();
				}
			}, '-', {
				id : 'edit_btn',
				text:'编辑',
				iconCls : 'icon-edit',
				handler : function(){

				}
			}, '-', {
				id : 'edit_btn',
				text:'更新状态',
				iconCls : 'icon-edit',
				handler : function(){
					CMS_INFO.initModiState();
				}
			}],
			onBeforeLoad : function() {
				TXWEB.tb.datagrid('clearSelections');
			},
			loader : function(param, succCall, err) {
				var opts = TXWEB.tb.datagrid("options");
				var pgno = param.page;
				var ls = param.rows;
				var cr = (pgno - 1) * ls;
				var params = $.extend({
					crow : cr,
					listSize : ls,
					records : opts.records,
					sord : opts.sortOrder,
					sidx : opts.sortName
				}, param, TXWEB.queryFrm.parseFormJsonData('#queryFrm'));
				$.ajax({
					type : opts.method,
					url : window.ctx+'/manager/app/cmsinfo/search.json',
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
		
		var CMS_INFO={};
		CMS_INFO.JQ_MODISTATE_WIN = $('#modiStateWin');
		CMS_INFO.JQ_MODISTATE_FORM = $('#modiStateFrm');
		
		CMS_INFO.del=function(){
			var row = TXWEB.tb.datagrid('getChecked');
			if (!row || row.length==0) {
				TxWebWin.alert('请选择需要删除的记录, 然后再进行删除.');
			} else {
				TxWebWin.confirm('确认删除当前记录吗?[共'+row.length+'条]', function(){
					var ids = ut.dec(jQuery.param({'ids':ArrayUtil.getValueArray(row)}));
					$.post(window.ctx+'/manager/app/cmsinfo/markdelete.json', ids, function(r) {
								TXWEB.tb.datagrid('reload');
					});
				});
			}
		};
		
		CMS_INFO.initModiState=function(){
			var row = TXWEB.tb.datagrid('getChecked');
			if (!row || row.length==0) {
				TxWebWin.alert('请选择需要更新的记录, 然后再进行操作.');
			} else {
				CMS_INFO.JQ_MODISTATE_WIN.window('open');
			}
		};
		
		CMS_INFO.doModiState=function(){
			var row = TXWEB.tb.datagrid('getChecked');
			var state = $('#modiInfoState').val();
			if (CMS_INFO.JQ_MODISTATE_FORM.form('enableValidation').form('validate')) {
				TxWebWin.confirm('确认更新当前记录吗?[共' + row.length + '条]', function() {
							var params = ut.dec(jQuery.param({
								'ids' : ArrayUtil.getValueArray(row),
								'state' : state
							}));
							$.post(window.ctx + '/manager/app/cmsinfo/infostate.json', params, function(r) {
										TXWEB.tb.datagrid('reload');
										CMS_INFO.JQ_MODISTATE_WIN.window('close');
							});
				});
			}
		};

		jQuery(function() {
			$('#queryBtn').click(function() {
				TXWEB.tb.datagrid('reload');
			});
			$('#modiInfoState,#q_info_state').txwebInitSelect({
				'url' : window.ctx + '/manager/app/dictconfig/jsonp',
				'params' : {
					'dictCode' : 'INFO_STATE'
				},
				'selectedIndex' : -1,
				'callfunc' : function(data, val) {
					console.log(val);
				},
				'valueName' : 'dictValue',
				'textName' : 'name',
				'defaultText' : '--'
			});
		});
	</script>
</body>
</html>