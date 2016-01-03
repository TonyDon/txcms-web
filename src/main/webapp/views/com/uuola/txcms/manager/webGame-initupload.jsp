<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload page</title>
<style>
body{font-size:12px;}
</style>
</head>
<body>
	<form action="upload" method="post" enctype="multipart/form-data">
	<label>上传GAME ZIP包：(只能传zip文件，文件名不能有中文，zip解压的顶级目录即为游戏地址根目录)</label>
	<br/>
	<input type="hidden" name="jscallback" value="${jscallback }"/>
		<input type="file" name="zipfile"> 
		<button type="submit">提交</button>
	</form>
</body>
</html>