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
<meta name="format-detection" content="telephone=no"/>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title>${infoDTO.infoBase.title}-开心驿站-m.986001.com</title>
<meta name="description" content="${infoDTO.infoBase.summary}" />
<c:if test="${infoDTO.infoBase.hasPic==1}">
<meta property="og:image" content="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}" />
<link rel="shortcut icon" href="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}"/>
<link rel="icon" href="${ut:getCtxPath()}${ut:getThumb(infoDTO.infoBase.picUrl, 'w120')}"/>
</c:if>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
  <div id="main" class="container">
		<div class="page-header">
			<h3 class="title"></h3>
		</div>
		<blockquote class="summary"></blockquote>
		<div class="main-pic">
			<p><img class="img-responsive center-block" src="https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif"/></p>
		</div>
		<article></article>
		<div class="text-center">
			<button type="button" id="playBtn" class="btn btn-info btn-lg">开始游戏</button>
		</div>
		<div class="info-meta out-site container-fluid">
			<%@include file="inc-moon.jspf" %>
			<div class="row">
				<div class="col-xs-8">
					<span class="read-num"></span>
				</div>
				<div class="col-xs-4">
					<span class="author"></span>
				</div>
			</div>
			<%@include file="inc-share.jspf" %>
		</div>
  		<div class="aside"></div>
  		<div class="aside">
  			<a name="#uyan"></a>
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
	SITE_MAIN.loadPage(PAGE_DATA);
	SITE_MAIN.H5G.doInit();
	SITE_MAIN.H5G.doRender();
	SITE_MAIN.BDSHARE.doInit();
	SITE_MAIN.UYAN.doInit(SITE_MAIN.pageId);
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>