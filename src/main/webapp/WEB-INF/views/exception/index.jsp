<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>exception</title>
<style>
body{font-size:12px; font-family: Verdana, Arial;color:#000; background:#DFE7F5;padding:0;margin:0;overflow-x:hidden;}
#tip{color:red;font-size:13px;display:block;width:100%;padding:9px;background:#B0C4E6}
#tip a{color:#213B66;}
#exception{border:2px solid #F3E16F;width:90%;margin:9px;display:none;background:#FEFDF6;padding:9px;line-height:24px;word-wrap:break-word;word-break;break-all;}
</style>
<script>
function show(){
	document.getElementById('exception').style.display='block';
}
</script>
</head>
<body>
<b id="tip"> 系统异常!  <a href="javascript:show();"> 查看堆栈信息  </a> </b>
<div id="exception">
	<c:out value="${exception }"></c:out>
</div>
</body>
</html>