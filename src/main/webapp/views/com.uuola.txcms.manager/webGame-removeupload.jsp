<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload remove</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
body{margin:0;padding:0;}
</style>
</head>
<body>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<p class="alert bg-info"> 删除成功！1s后返回上传页面...</p>
<script>
setTimeout(function(){
	try{
		window.parent.window.${param.jscallback }('', '', '');
	}catch(e){
	}
	location.href= window.ctx + '/manager/app/webgame/initupload?jscallback=${param.jscallback}&t=' + Math.random()
}, 800);
</script>
</body>
</html>