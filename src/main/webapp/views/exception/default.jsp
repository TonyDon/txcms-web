<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title>error</title>
<style>
body{font-size:12px; font-family: Verdana, Arial;color:#000; background:#EAEAEA;padding:0;margin:0;overflow-x:hidden;}
</style>
</head>
<body>
<div style="align:center;width:100%;">
<a href="${ut:getCtxPath()}/?ref=error-page&e=${exception}">
<img style="max-width:100%;height:auto;" src="https://img.alicdn.com/imgextra/i1/152137799/TB2682LmFXXXXaZXpXXXXXXXXXX-152137799.jpg"/>
</a>
</div>
<script src="${ut:getCtxPath()}/static/js/gmtrace.js?v=1001"></script>
</body>
</html>