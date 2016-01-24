<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台-系统参数管理</title>
<%@include file="inc-css.jspf" %>
</head>
<body>
<div id="wrapper">
        <%@include file="inc-nav.jspf" %>

        <!-- Page Content -->
        <div id="page-wrapper" class="easyui-style">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h4 class="page-header">系统设置/系统参数管理</h4>
                        	<div style="padding:0 0 0.5em 0;">
                        	<form id="queryFrm" class="form-inline">
                        		<div class="form-group">
                        		<label for="name">参数名称：</label>
                        		<input type="text" id="name" name="name"  class="form-control input-sm">
                        		</div>
                        		<button id="queryBtn" type="button" class="btn btn-info btn-sm">搜索</button>
                        	</form>
                        	</div>
                        	<table id="user_data_table"></table>
						    <div id="sysConfigAddWin" class="easyui-window" title="添加参数信息"
								data-options="modal:true,closed:true,iconCls:'icon-save'"
								style="width: 380px; height:auto; padding: 10px;">
								<div style="padding:10px">
							    <form id="sysConfigAddFrm" method="post">
										<table cellpadding="5" class="table table-striped table-bordered table-hover">
											<tr>
												<td id="name_tit">参数名称:</td>
												<td><input class="easyui-textbox" type="text" name="name"
													data-options="required:true"></td>
											</tr>
											<tr>
												<td id="sysValue_tit">参数值:</td>
												<td><input class="easyui-textbox" type="text" name="sysValue"
													data-options="required:true"></td>
											</tr>
											<tr>
												<td id="sysType_tit">参数类型:</td>
												<td><select name="sysType" data-options="required:true">
														<option value="string">string</option>
														<option value="number">number</option>
														<option value="list">list</option>
														<option value="array">array</option>
														<option value="json">json</option>
												</select></td>
											</tr>
											<tr>
												<td>转换类:</td>
												<td><input class="easyui-textbox" type="text" name="generalClass"
													data-options="required:false"></td>
											</tr>
											<tr>
												<td>备 注:</td>
												<td><input class="easyui-textbox" type="text" name="remark"
													data-options="required:true"></td>
											</tr>
										</table>
										<div style="text-align: center; padding: 5px">
											<a href="javascript:void(0)" class="btn btn-primary"
												onclick="SYS_CONFIG.submitAddForm();">提 交</a>
												&nbsp;&nbsp;&nbsp;&nbsp; 
											<a href="javascript:void(0)"class="btn btn-warning"
												onclick="SYS_CONFIG.clearAddForm();">清 空</a>
										</div>
									</form>
							    </div>
							</div>
							<!-- 更新参数信息表单 -->
							<div id="sysConfigEditWin" class="easyui-window" title="编辑参数信息"
								data-options="modal:true,closed:true,iconCls:'icon-save'"
								style="width: 380px; height:auto; padding: 10px;">
								<div style="padding:10px">
							    <form id="sysConfigEditFrm" method="post">
							    	<input type="hidden" id="sysconfigFrmMethod" name="_method" value="put">
							    	<input type="hidden" id="sysconfigId" name="id" value="">
										<table cellpadding="5" class="table table-striped table-bordered table-hover">
											<tr>
												<td id="name_tit">参数名称:</td>
												<td><input class="easyui-textbox" type="text" name="name"
													data-options="required:true"></td>
											</tr>
											<tr>
												<td id="sysValue_tit">参数值:</td>
												<td><input class="easyui-textbox" type="text" name="sysValue"
													data-options="required:true"></td>
											</tr>
											<tr>
												<td id="sysType_tit">参数类型:</td>
												<td><select name="sysType" data-options="required:true">
														<option value="string">string</option>
														<option value="number">number</option>
														<option value="list">list</option>
														<option value="array">array</option>
														<option value="json">json</option>
												</select></td>
											</tr>
											<tr>
												<td>转换类:</td>
												<td><input class="easyui-textbox" type="text" name="generalClass"
													data-options="required:false"></td>
											</tr>
											<tr>
												<td>备 注:</td>
												<td><input class="easyui-textbox" type="text" name="remark"
													data-options="required:true"></td>
											</tr>
										</table>
										<div style="text-align: center; padding: 5px">
											<a href="javascript:void(0)" class="btn btn-primary"
												onclick="SYS_CONFIG.submitEditForm();">提 交</a>
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
	title : '系统参数列表',
	iconCls : 'icon-save',
	columns : [ [ {
		field : 'id',
		title : 'ID 编号',
		width : 50
	}, {
		field : 'name',
		title : '参数名称',
		width : 180
	}, {
		field : 'sysValue',
		title : '参数值',
		width : 100
	}, {
		field : 'sysType',
		title : '参数类型',
		width : 50
	}, {
		field : 'generalClass',
		title : '转换类名',
		width : 100
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
	}, {
		field : 'remark',
		title : '备注',
		width : 100
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
		id : 'add_btn',
		text : '添加',
		iconCls : 'icon-add',
		handler : function() {
			SYS_CONFIG.initAdd();
		}
	}, '-', {
		id : 'del_btn',
		text : '删除',
		iconCls : 'icon-remove',
		handler : function() {
			SYS_CONFIG.del();
		}
	}, '-', {
		id : 'edit_btn',
		text:'编辑',
		iconCls : 'icon-edit',
		handler : function(){
			SYS_CONFIG.initEdit();
		}
	}],
	onBeforeLoad : function() {
		TXWEB.tb.datagrid('clearSelections');
	},
	queryParams : {
		name : function(){
			return $('#name').val();
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
			url : window.ctx+'/manager/app/sysconfig/search.json',
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

var SYS_CONFIG = {};
SYS_CONFIG.JQ_ADD_FORM = $('#sysConfigAddFrm');
SYS_CONFIG.JQ_EDIT_FORM = $('#sysConfigEditFrm');
SYS_CONFIG.JQ_ADD_WIN = $('#sysConfigAddWin');
SYS_CONFIG.JQ_EDIT_WIN = $('#sysConfigEditWin');

SYS_CONFIG.initAdd = function() {
	SYS_CONFIG.JQ_ADD_WIN.window('open');
};
SYS_CONFIG.submitAddForm = function() {
this.JQ_ADD_FORM.form('submit', {
		ajax : true,
		queryParams : {
			r : ut.r()
		},
		url : window.ctx+'/manager/app/sysconfig/post.json',
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
				SYS_CONFIG.JQ_ADD_FORM.form('clear');
				SYS_CONFIG.JQ_ADD_WIN.window('close');
				TXWEB.tb.datagrid('reload');
			}
		}
	});
};

SYS_CONFIG.clearAddForm = function() {
	this.JQ_ADD_FORM.form('clear');
};

SYS_CONFIG.del = function() {
	var row = TXWEB.tb.datagrid('getSelected');
	if (!row) {
		TxWebWin.alert('请单击需要删除的记录, 然后再进行删除.');
	} else {
		TxWebWin.confirm('确认删除当前记录吗?['+row.name+']', function(){
			$.post(window.ctx+'/manager/app/sysconfig/' + row.id + '.json', '_method=delete', function(r) {
						TXWEB.tb.datagrid('reload');
			});
		});
	}
};

SYS_CONFIG.initEdit = function() {
	var row = TXWEB.tb.datagrid('getSelected');
	if (!row) {
		TxWebWin.alert('请单击需要编辑的记录.');
	} else {
		$.get(window.ctx+'/manager/app/sysconfig/' + row.id + '.json', function(data) {
			SYS_CONFIG.JQ_EDIT_FORM.form('load', data.sysConfig);
			SYS_CONFIG.JQ_EDIT_WIN.window('open');
		});
	}
};

SYS_CONFIG.submitEditForm = function() {
	var id = $('#sysconfigId').val();
	this.JQ_EDIT_FORM.form('submit', {
			ajax : true,
			queryParams : {
				r : ut.r()
			},
			url : window.ctx+'/manager/app/sysconfig/'+id+'.json?_method=put',
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
					SYS_CONFIG.JQ_EDIT_FORM.form('clear');
					SYS_CONFIG.JQ_EDIT_WIN.window('close');
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