<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload page</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
body{margin:0;padding:0;}
</style>
</head>
<body>
<div class="container-fluid">
	<form action="upload?jscallback=${param.jscallback}" method="post" enctype="multipart/form-data">
	<label>上传GAME ZIP包：(只能传zip文件，文件名不能有中文，zip解压的顶级目录即为游戏地址根目录)</label>
	<div class="row">
		<div class="col-sm-4">
			<input type="file" name="zipfile" class="btn btn-default input-sm">
		</div>
		<div class="col-sm-2">
			<button type="submit"  class="btn btn-info btn-sm">确定上传</button>
		</div>
	</div>
	</form>
</div>
</body>
</html>