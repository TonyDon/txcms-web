<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="format-detection" content="telephone=no" />
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="full-screen" content="yes"/>
<meta name="x5-fullscreen" content="true"/>
<meta name="360-fullscreen" content="true"/>
<title>${infoDTO.infoBase.title}-开心驿站-m.986001.com</title>
<meta name="description" content="${infoDTO.infoBase.summary}" />
<c:if test="${infoDTO.infoBase.hasPic==1}">
<meta property="og:image" content="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}" />
<link rel="shortcut icon" href="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}"/>
<link rel="icon" href="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}"/>
</c:if>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
#h5gIframe {width:100%;min-height: 40em;border: 0; margin: 0; padding: 0;z-index: -100;}
.container{max-width:100%;}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="text-center">
			<iframe src="about:blank;" id="h5gIframe" allowtransparency="true"></iframe>
		</div>
		<blockquote class="summary"></blockquote>
		<div class="container-fluid">
			<%@include file="inc-moon.jspf" %>
			<%@include file="inc-share.jspf" %>
		</div>
		<div class="aside"></div>
		<div class="aside">
  			<div id="uyan_frame"></div>
  		</div>
	</div>
</main>

<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<script>
var PAGE_DATA = {};
PAGE_DATA.infoDat = ${ut:toJSON(infoDTO)};
PAGE_DATA.verrors = ${ut:toJSON(validErrors)};
jQuery(function(){
	SITE_MAIN.loadPage(PAGE_DATA, function(s){
		s.frwahash = '${frwahash}';
	});
	SITE_MAIN.H5G_PLAY.doInit();
	SITE_MAIN.H5G_PLAY.doRender();
	SITE_MAIN.BDSHARE.doInit();
	SITE_MAIN.UYAN.doInit(SITE_MAIN.pageId);
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>