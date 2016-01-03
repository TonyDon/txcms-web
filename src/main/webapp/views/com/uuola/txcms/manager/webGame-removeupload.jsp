<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload remove</title>
<style>
body{font-size:12px;}
</style>
</head>
<body>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<script>
(function(){
	alert('删除成功!');
	location.href= window.ctx + '/manager/app/webgame/initupload?jscallback=${jscallback}&t=' + Math.random()
})();
</script>
</body>
</html>