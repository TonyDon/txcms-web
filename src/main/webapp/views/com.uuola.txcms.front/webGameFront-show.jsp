<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>${infoDTO.infoBase.title}</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<h2>${infoDTO.infoBase.title}</h2>
<div>
	${infoDTO.infoBase.summary}
</div>
<c:if test="${not empty infoDTO.infoBase.picUrl}">
	<img src="<c:url value="${infoDTO.infoBase.picUrl }"/>"/>
</c:if>
<button type="button" id="playBtn" class="btn btn-info">开始游戏</button>


<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.js"></script>
<script>
jQuery(function(){
	$('#playBtn').on('click', function(){
		location.href= window.ctx + '/h5g/play?id=' + ${infoDTO.infoBase.id} + '&t=' + Math.random() * 1000;
	});
});
</script>
</body>
</html>