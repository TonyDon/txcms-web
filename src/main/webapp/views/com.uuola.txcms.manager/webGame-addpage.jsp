<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>WebGame 新增</title>
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
						<h4 class="page-header">WebGame/新增</h4>
						<form id="gameAddFrm" method="post">
							<div class="easyui-tabs" style="width:100%; height: auto;">
								<div title="信息分类选择" style="padding: 10px">
									<p id="siteCat_tip" class="bg-warning">提示：请选择叶子分类发布信息.</p>
									<div class="form-group">
										<label id="siteCat_tit">选择子分类：<span id="selectedCat"></span></label>
										<input type="hidden" id="catId" name="catId" value="" />
										<ul id="siteCat" class="easyui-tree"></ul>
									</div>
								</div>
								<div title="游戏包上传" style="padding: 10px">
									<iframe id="gameUploadIframe" src="about:blank;" style="width:100%;border:0;height:200px;" allowtransparency="true"></iframe>
								</div>
								<div title="基本信息输入" style="padding: 50px">
									<div class="form-group">
										<label id="title_tit">资讯标题:</label> <input
											class="easyui-validatebox form-control w650 texta"
											type="text" name="title" data-options="required:true">
									</div>
									<div class="form-group">
										<label id="summary_tit">资讯摘要:</label>
										<textarea class="w650 h50 form-control texta" type="text" name="summary"></textarea>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-4">
												<label id="infoType_tit">信息类型:</label>
												<select id="infoType" name="infoType" class="form-control input-sm" style="width: 100px;"></select>
											</div>
											<div class="col-md-4">
												<label id="hasPic_tit">有图文:</label>
												<select class="form-control input-sm" name="hasPic" style="width: 100px;">
													<option value="">--</option>
													<option value="0">否</option>
													<option value="1" selected="selected">是</option>
												</select>
											</div>
											<div class="col-md-4">
												<label id="hasVideo_tit">有视频:</label>
												<select class="form-control input-sm" name="hasVideo" style="width: 100px;">
													<option value="">--</option>
													<option value="0" selected="selected">否</option>
													<option value="1">是</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-4">
												<label id="infoType_tit">查看次数:</label>
												<input name="viewNum" type="text"  value="0" class="form-control" style="width: 100px;"/>
											</div>
											<div class="col-md-4">
												<label id="infoType_tit">点赞次数:</label>
												<input name="loveNum" type="text"  value="0" class="form-control" style="width: 100px;"/>
											</div>
											<div class="col-md-4">
												<label id="infoType_tit">点踩次数:</label>
												<input name="hateNum" type="text"  value="0" class="form-control" style="width: 100px;"/>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label id="picUrl_tit">主图地址:</label>
										<div class="row">
										<div class="col-md-6">
										<input class="w650 form-control texta" type="text" name="picUrl">
										</div>
										<div class="col-md-6">
										<button id="upload_main_pic" type="button"  class="btn btn-info btn-sm">上传图片</button>
										</div>
										</div>
									</div>
									<div class="form-group">
										<label id="siteUrl_tit">Site地址:</label>
										<input class="w650 form-control texta" type="text" name="siteUrl">
									</div>
									<div class="form-group">
										<label id="videoUrl_tit">视频地址:</label>
										<input class="w650 form-control texta" type="text" name="videoUrl">
									</div>
								</div>
								<div id="gameAddPanle" title="游戏内容"
									style="height: auto; margin: auto; padding: 9px; text-align: left;">
									<div class="form-group">
										<label id="content_tit">文章内容:</label>
										<div style="width: 95%; height: 500px; margin: auto; display: block; text-align: left;">
											<textarea id="editor" name="content" style="width: 100%; height: 400px; visibility: hidden;">
									        </textarea>
										</div>
									</div>
								</div>
							</div>
							<div style="text-align: center; padding: 10px; clear: both; display: block;">
								<a href="javascript:void(0)" class="btn btn-primary" role="button" onclick="GAME.submitAddForm();">提 交</a> 
								<a href="javascript:void(0)" class="btn btn-danger" role="button" onclick="GAME.clearAddForm();">清 空</a>
							</div>
						</form>
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
<script src="${ut:getCtxPath()}/static/keditor/kindeditor-min.js"></script>
<script src="${ut:getCtxPath()}/static/keditor/lang/zh_CN.js"></script>

	<script>
		initJQuery();
		var h5gameTopCid = 30 ;
		// 配置编辑器上传功能
		var editor;
		KindEditor.ready(function(K) {
			editor = K.create('textarea[name="content"]', {
				allowFileManager : true,
				uploadJson : window.ctx + '/uploader/store.json',
				filePostName : 'mpfile',
				extraFileUploadParams : {
					'needThumb' : true
				}
			});
		});

		var GAME = {};
		GAME.JQ_ADD_FORM = $('#gameAddFrm');
		GAME.submitAddForm = function() {
			this.JQ_ADD_FORM.form('submit', {
				ajax : true,
				queryParams : {
					r : ut.r()
				},
				url : window.ctx + '/manager/app/cmsinfo/post.json',
				onSubmit : function(params) {
					$('#editor').val(editor.html());
					return $(this).form('enableValidation').form('validate');
				},
				success : function(data) {
					var res = jQuery.parseJSON(data)
					if (res.exception || res.validErrors
							&& res.validErrors.length > 0) {
						var msg = [];
						var errs = res.validErrors;
						for ( var k in errs) {
							var err = errs[k].split('@');
							if (err.length == 2) {
								msg.push($('#' + err[1] + '_tit').text()
										+ err[0]);
							} else {
								msg.push(err[0]);
							}
						}
						if (res.exception) {
							msg.push(res.exception.replace(/\r|\n/, '<br/>'));
						}
						TxWebWin.alertWarn('添加失败，失败原因：<br/>'
								+ msg.join('<br/>'));
					} else {
						alert('添加成功！');
						GAME.clearAddForm();
					}
				}
			});
		};
		GAME.clearAddForm = function() {
			this.JQ_ADD_FORM.form('clear');
			editor.html('');
		};

		function initSiteCatTree() {
			var siteCat = $('#siteCat');
			siteCat.tree({
						method : 'get',
						url : window.ctx + '/manager/app/sitecat/treelist.json',
						sortName : 'id',
						sortOrder : 'asc',
						pageSize : 50,
						records : 0,
						loader : function(param, succCall, err) {
							var opts = siteCat.tree("options");
							var rid = param.id || h5gameTopCid;
							var params = $.extend({
								rid : rid,
								crow : 0,
								listSize : opts.pageSize,
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
											var ds = model.pageDTO.datas;
											for ( var k in ds) {
												var rid = ds[k].rid;
												var nodeNum = ds[k].nodeNum;
												ds[k]._parentId = rid; //这里必须用_parentId关联父ID
												ds[k].text = ds[k].name;
												ds[k].attributes = {
													'nodeNum' : nodeNum
												};
												if (nodeNum > 0) {
													ds[k].state = 'closed';
												} else {
													ds[k].state = 'open';
												}
											}
											var d = $.extend(ds, {});
											siteCat.tree("options").records = model.pageDTO.total;
											succCall(d);
										},
										error : function(xhr, ts) {
											err();
										}
									});
						},
						onClick : function(node) {
							if (node.attributes['nodeNum'] === 0) {
								$('#catId').val(node.id);
								$('#selectedCat').text(node.text);
								$('#siteCat_tip').hide();
							} else {
								$('#siteCat_tip').show();
							}
						}
					});
		};

		// 上传后结果回调
		GAME.uploadResultHandle = function(url, err, mess){
			if('0' == err && url){
				$('input[name="siteUrl"]').val(url);
			}else{
				$('input[name="siteUrl"]').val('');
			}
		};
		
		// 主图上传后回调
		GAME.uploadMainPicResultHandle=function(url, err, mess){
			if('0' == err && url){
				$('input[name="picUrl"]').val(url);
			}else{
				$('input[name="picUrl"]').val('');
			}
		};
		
		GAME.randomSetNum = function(){
			$('input[name="viewNum"]').val(ut.rndint(10,30));
			$('input[name="loveNum"]').val(ut.rndint(5,10));
			$('input[name="hateNum"]').val(ut.rndint(2,5));
		};
		
		$(function() {
			$('#infoType').txwebInitSelect({
				'url' : window.ctx + '/manager/app/dictconfig/jsonp',
				'params' : {
					'dictCode' : 'INFO_TYPE'
				},
				'selectedIndex' : 0,
				'callfunc' : function(data, val) {
					console.log(val);
				},
				'valueName' : 'dictValue',
				'textName' : 'name',
				'defaultText' : '--'
			});

			initSiteCatTree();
			
			$('#gameUploadIframe').attr('src', window.ctx + '/manager/app/webgame/initupload?jscallback=GAME.uploadResultHandle');
			
			$('#upload_main_pic').click(function(){
				layer.open({
			        type: 2,
			        title: '上传主图',
			        maxmin: true,
			        shadeClose: true, //点击遮罩关闭层
			        area : ['80%' , '15em'],
			        content: window.ctx + '/uploader?jscallback=GAME.uploadMainPicResultHandle&dir=image'
			    });
			});
			
			GAME.randomSetNum();
		});
	</script>
</body>
</html>