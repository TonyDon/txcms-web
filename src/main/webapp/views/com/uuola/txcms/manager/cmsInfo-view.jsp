<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta name="format-detection" content="telephone=no"/>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title></title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
	<c:if test="${infoDTO.infoBase!=null && infoDTO.infoBase.infoState==1}">
		<div class="main">
			<h1 class="title">${infoDTO.infoBase.title}</h1>
			<div class="info-meta">
				<span class="time">${ut:formatTimeMillis(infoDTO.infoBase.createTime, "yyyy-MM-dd")}</span>
				<span class="author">${infoDTO.infoBase.authorId}</span>
			</div>
			<div class="summary">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;${infoDTO.infoBase.summary}</p>
			</div>
			<div class="main-pic">
				<p>
					<img src="${infoDTO.infoBase.picUrl}" />
				</p>
			</div>
			<div class="cont">${infoDTO.infoContent.content}</div>
		</div>
	</c:if>
	<c:if test="${infoDTO.infoBase==null || infoDTO.infoBase.infoState!=1}">
		<p>信息禁止查阅！</p>
	</c:if>
</body>
</html>