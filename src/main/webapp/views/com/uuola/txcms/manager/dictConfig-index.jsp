<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台-字典参数管理</title>
<%@include file="inc-css.jspf" %>
</head>
<body>
	<div id="wrapper">
		<%@include file="inc-nav.jspf"%>

		<!-- Page Content -->
		<div id="page-wrapper" class="easyui-style">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h4 class="page-header">系统设置/字典参数管理</h4>
						<div style="padding:0 0 0.5em 0;">
                        	<form id="queryFrm" class="form-inline">
                        		<div class="form-group">
                        		<label for="name">字典名称：</label>
                        		<input type="text" id="q_name" name="name"  class="form-control input-sm">
                        		</div>
                        		<div class="form-group">
                        		<label for="dictCode">字典编码：</label>
                        		<input type="text" id="q_dictCode" name="dictCode"  class="form-control input-sm">
                        		</div>
                        		<button id="queryBtn" type="button" class="btn btn-info btn-sm">搜索</button>
                        	</form>
                        	</div>
						<table id="user_data_table"></table>
						<div id="dictConfigAddWin" class="easyui-window" title="添加字典配置"
							data-options="modal:true,closed:true,iconCls:'icon-save'"
							style="width: 380px; height:auto; padding: 10px;">
							<div style="padding: 10px">
								<form id="dictConfigAddFrm" method="post">
									<table cellpadding="5" class="table table-striped table-bordered table-hover">
										<tr>
											<td id="name_tit">字典名称:</td>
											<td><input class="easyui-textbox" type="text"
												name="name" data-options="required:true"></td>
										</tr>
										<tr>
											<td id="dictCode_tit">字典编码:</td>
											<td><input class="easyui-textbox" type="text"
												name="dictCode" data-options="required:true"></td>
										</tr>
										<tr>
											<td id="dictValue_tit">字典值:</td>
											<td><input class="easyui-textbox" type="text"
												name="dictValue" data-options="required:true"></td>
										</tr>
										<tr>
											<td>备注:</td>
											<td><input class="easyui-textbox" type="text"
												name="remark" data-options="required:false"></td>
										</tr>
									</table>
									<div style="text-align: center; padding: 5px">
										<a href="javascript:void(0)" class="easyui-linkbutton"
											data-options="iconCls:'icon-save'"
											onclick="DICT_CONFIG.submitAddForm();">提 交</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"
											class="easyui-linkbutton" data-options="iconCls:'icon-clear'"
											onclick="DICT_CONFIG.clearAddForm();">清 空</a>
									</div>
								</form>
							</div>
						</div>
						<!-- 编辑字典参数 -->
						<div id="dictConfigEditWin" class="easyui-window" title="编辑字典参数"
							data-options="modal:true,closed:true,iconCls:'icon-save'"
							style="width: 380px; height:auto; padding: 10px;">
							<div style="padding: 10px">
								<form id="dictConfigEditFrm" method="post">
									<input type="hidden" id="dictconfigId" name="id" value="">
									<table cellpadding="5" class="table table-striped table-bordered table-hover">
										<tr>
											<td id="name_tit">字典名称:</td>
											<td><input class="easyui-textbox" type="text"
												name="name" data-options="required:true"></td>
										</tr>
										<tr>
											<td id="dictCode_tit">字典编码:</td>
											<td><input class="easyui-textbox" type="text"
												name="dictCode" data-options="required:true"></td>
										</tr>
										<tr>
											<td id="dictValue_tit">字典值:</td>
											<td><input class="easyui-textbox" type="text"
												name="dictValue" data-options="required:true"></td>
										</tr>
										<tr>
											<td>备注:</td>
											<td><input class="easyui-textbox" type="text"
												name="remark" data-options="required:false"></td>
										</tr>
									</table>
									<div style="text-align: center; padding: 5px">
										<a href="javascript:void(0)" class="btn btn-primary" onclick="DICT_CONFIG.submitEditForm();">提 交</a>
									</div>
								</form>
							</div>
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

<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<%@include file="inc-mgr-js.jspf" %>


<script>
$(document).ajaxError(globalAjaxErrorHandler);


function parseModel(model) {
	var d = {};
	d.total = model.pageDTO.total;
	d.rows = model.pageDTO.datas;
	TXWEB.tb.datagrid("options").records = d.total;
	return d;
};

var TXWEB = {};
TXWEB.tb = $('#user_data_table');

TXWEB.tb.datagrid({
	method : 'get',
	title : '字典参数列表',
	iconCls : 'icon-save',
	columns : [ [ {
		field : 'id',
		title : 'ID 编号',
		width : 50
	}, {
		field : 'name',
		title : '字典名称',
		width : 150
	}, {
		field : 'dictCode',
		title : '字典编码',
		width : 150
	}, {
		field : 'dictValue',
		title : '字典值',
		width : 50
	}, {
		field : 'remark',
		title : '备注',
		width : 200
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
	}  ] ],
	idField : 'id',
	width : '100%',
	height : 'auto',
	nowrap : false,
	striped : true,
	pagination : true,
	rownumbers : true,
	singleSelect : true,
	remoteSort : false,
	fitColumns : true,
	showFooter : true,
	sortName : 'id',
	sortOrder : 'asc',
	pageSize : 10,
	pageList : [ 5, 10, 20, 50 ],
	records : 0,
	toolbar : [ {
		text : '添加',
		iconCls : 'icon-add',
		handler : function() {
			DICT_CONFIG.initAdd();
		}
	}, '-', {
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			DICT_CONFIG.del();
		}
	}, '-', {
		id : 'edit_btn',
		text:'编辑',
		iconCls : 'icon-edit',
		handler : function(){
			DICT_CONFIG.initEdit();
		}
	}],
	onBeforeLoad : function() {
		TXWEB.tb.datagrid('clearSelections');
	},
	queryParams : {
		name : function(){
			return $('#q_name').val();
		},
		dictCode : function(){
			return $('#q_dictCode').val();
		}
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
		}, param);
		$.ajax({
			type : opts.method,
			url : window.ctx +'/manager/app/dictconfig/search.json',
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




var DICT_CONFIG = {};
DICT_CONFIG.JQ_ADD_FORM = $('#dictConfigAddFrm');
DICT_CONFIG.JQ_EDIT_FORM = $('#dictConfigEditFrm');
DICT_CONFIG.JQ_ADD_WIN = $('#dictConfigAddWin');
DICT_CONFIG.JQ_EDIT_WIN = $('#dictConfigEditWin');

DICT_CONFIG.initAdd = function() {
	DICT_CONFIG.JQ_ADD_WIN.window('open');
};

DICT_CONFIG.submitAddForm = function() {
this.JQ_ADD_FORM.form('submit', {
		ajax : true,
		queryParams : {
			r : ut.r()
		},
		url : window.ctx +'/manager/app/dictconfig/post.json',
		onSubmit : function(params) {
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
				DICT_CONFIG.clearAddForm();
				$('#dictConfigAddWin').window('close');
				TXWEB.tb.datagrid('reload');
			}
		}
	});
};

DICT_CONFIG.clearAddForm = function() {
	this.JQ_ADD_FORM.form('clear');
};

DICT_CONFIG.del = function() {
	var row = TXWEB.tb.datagrid('getSelected');
	if (!row) {
		TxWebWin.alert('请单击需要删除的记录, 然后再进行删除.');
	} else {
		TxWebWin.confirm('确认删除当前记录吗?['+row.name+']', function(){
			$.post(window.ctx +'/manager/app/dictconfig/' + row.id + '.json', '_method=delete', function(r) {
				TXWEB.tb.datagrid('reload');
			});
		});
	}
};

DICT_CONFIG.initEdit = function() {
	var row = TXWEB.tb.datagrid('getSelected');
	if (!row) {
		TxWebWin.alert('请单击需要编辑的记录.');
	} else {
		$.get(window.ctx+'/manager/app/dictconfig/' + row.id + '.json', function(data) {
			DICT_CONFIG.JQ_EDIT_FORM.form('load', data.dictConfig);
			DICT_CONFIG.JQ_EDIT_WIN.window('open');
		});
	}
};

DICT_CONFIG.submitEditForm = function() {
	var id = $('#dictconfigId').val();
	this.JQ_EDIT_FORM.form('submit', {
			ajax : true,
			queryParams : {
				r : ut.r()
			},
			url : window.ctx+'/manager/app/dictconfig/'+id+'.json?_method=put',
			onSubmit : function(params) {
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
					TxWebWin.alertWarn('编辑失败，失败原因：<br/>' + msg.join('<br/>'));
				} else {
					alert('编辑成功！');
					DICT_CONFIG.JQ_EDIT_FORM.form('clear');
					DICT_CONFIG.JQ_EDIT_WIN.window('close');
					TXWEB.tb.datagrid('reload');
				}
			}
		});
	};
	
jQuery(function(){
	
	$('#queryBtn').click(function(){
		TXWEB.tb.datagrid('reload');
	});
});
</script>
</body>
</html>