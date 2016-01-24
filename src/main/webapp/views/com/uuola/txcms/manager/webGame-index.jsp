<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台-WebGame管理</title>
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
						<h4 class="page-header">游戏管理/WebGame查询</h4>
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
                        		<button id="queryBtn" type="button" class="btn btn-info btn-sm">搜索</button>
                        	</form>
                        	</div>
						<table id="user_data_table"></table>
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

	</script>
</body>
</html>