<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="ut" uri="/utils"%>
<%@include file="inc-comm.jspf" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="format-detection" content="telephone=no"/>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title>${infoDTO.infoBase.title}-${catNamepath}-手机娱乐-m.986001.com</title>
<meta name="description" content="${infoDTO.infoBase.summary}" />
<c:if test="${infoDTO.infoBase.hasPic==1}">
<meta property="og:image" content="${infoDTO.infoBase.picUrl}" />
<link rel="shortcut icon" href="${infoDTO.infoBase.picUrl}"/>
<link rel="icon" href="${infoDTO.infoBase.picUrl}"/>
</c:if>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '<%=ctp%>';</script>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
<div id="main" class="container">
		<div class="page-header"><h1 class="title">${infoDTO.infoBase.title}</h1></div>
		<div class="cat-nav"></div>
		<blockquote class="summary">
			<c:if test="${not empty infoDTO.infoBase.summary}">
			${infoDTO.infoBase.summary}
			</c:if>
		</blockquote>
		<div class="main-pic">
			<c:if test="${infoDTO.infoBase.hasPic==1}">
			<img alt="${infoDTO.infoBase.title}" title="${infoDTO.infoBase.title}" class="img-responsive center-block" src="${infoDTO.infoBase.picUrl}"/>
			</c:if>
		</div>
		<div class="main-video">
			<p class="text-center"><video id="vplayer" controls="controls" preload="auto"></video></p>
			<p class="text-center"><iframe id="ifvplayer" src="about:blank"></iframe></p>
		</div>
		<article><c:if test="${not empty content}">${content}</c:if></article>
		<div class="info-meta out-site container-fluid">
			<%@include file="inc-moon.jspf" %>
			<div class="row">
				<div class="col-xs-6"><span class="read-num"></span></div>
				<div class="col-xs-6 text-right"><span class="time"></span><span class="author"></span></div>
			</div>
			<%@include file="inc-share.jspf" %>
		</div>
  		<div class="aside">
  		<%@include file="inc-mgg1.jspf" %>
  		</div>
  		<div class="aside">
  		<%@include file="inc-qrcode.jspf" %>
  		</div>
  		<div class="aside"><a name="#uyan"></a><div id="uyan_frame"></div></div>
</div>
</main>
<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<script>
var PAGE_DATA = {};
PAGE_DATA.infoDat = ${ut:toJSON(infoDTO)};
PAGE_DATA.verrors = ${ut:toJSON(validErrors)};
jQuery(function(){
	SITE_MAIN.loadPage(PAGE_DATA);
	SITE_MAIN.INFO.doInit();
	SITE_MAIN.INFO.doRender();
	SITE_MAIN.BDSHARE.doInit();
	SITE_MAIN.UYAN.doInit(SITE_MAIN.pageId);
	SITE_MAIN.showQRcode();
});
</script>
<%@include file="inc-adsense.jspf" %>
<%@include file="inc-trace.jspf" %>
</body>
</html>