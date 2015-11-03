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
						<form id="infoAddFrm" method="post">
							<div class="easyui-tabs" style="width:100%; height: auto;">
								<div title="信息分类选择" style="padding: 10px">
									<p id="siteCat_tip" class="bg-warning">提示：请选择叶子分类发布信息.</p>
									<div class="form-group">
										<label id="siteCat_tit">选择子分类：<span id="selectedCat"></span></label>
										<input type="hidden" id="catId" name="catId" value="" />
										<ul id="siteCat" class="easyui-tree"></ul>
									</div>
								</div>
								<div title="标签设置" style="padding: 10px">This is the help
									content.
								</div>
								<div title="图片设置" style="padding: 10px">This is the help
									content.
								</div>
								<div title="基本信息输入" style="padding: 50px">
									<div class="form-group">
										<label id="title_tit">资讯标题:</label> <input
											class="easyui-validatebox form-control w650 texta"
											type="text" name="title" data-options="required:true">
									</div>
									<div class="form-group">
										<label id="summary_tit">资讯摘要:</label>
										<textarea class="w650 h50 form-control texta" type="text"
											name="summary"></textarea>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-md-4">
												<label id="infoType_tit">资讯类型:</label> <select id="infoType"
													name="infoType" class="form-control input-sm"
													style="width: 100px;"></select>
											</div>
											<div class="col-md-4">
												<label id="isPic_tit">有图文:</label> <select
													class="form-control input-sm" name="isPic"
													style="width: 100px;">
													<option value="">--</option>
													<option value="0">否</option>
													<option value="1">是</option>
												</select>
											</div>
											<div class="col-md-4">
												<label id="isVideo_tit">有视频:</label> <select
													class="form-control input-sm" name="isVideo"
													style="width: 100px;">
													<option value="">--</option>
													<option value="0">否</option>
													<option value="1">是</option>
												</select>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label id="picUrl_tit">主图地址:</label> <input
											class="w650 form-control texta" type="text" name="picUrl">
									</div>
								</div>
								<div id="infoAddPanle" title="信息内容输入"
									style="height: auto; margin: auto; padding: 9px; text-align: left;">
									<div class="form-group">
										<label id="content_tit">文章内容:</label>
										<div
											style="width: 95%; height: 500px; margin: auto; display: block; text-align: left;">
											<textarea id="editor" name="content"
												style="width: 100%; height: 400px; visibility: hidden;">
									请输入文本内容..
									</textarea>
										</div>
									</div>
								</div>
							</div>
							<div style="text-align: center; padding: 10px; clear: both; display: block;">
								<a href="javascript:void(0)" class="btn btn-primary"
									role="button" onclick="INFO.submitAddForm();">提 交</a> 
								<a href="javascript:void(0)" class="btn btn-danger" role="button"
									onclick="INFO.clearAddForm();">清 空</a>
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
</body>
</html>