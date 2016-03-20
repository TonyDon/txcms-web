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
<title>开心驿站-m.986001.com</title>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
.container{padding: 0 0.5em;}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="container-fluid">
			<div class="row info-box">
				<div class="main-pic show">
					<img class="img-responsive center-block"
						src="http://image.uc.cn/s/uae/g/view/eae61cb3a24a63a9a8d2437703c21ac6" />
				</div>
				<div class="header-title">
					<h5>一元纸币退出市场，以后端个存钱罐出门。</h5>
				</div>
			</div>
		</div>
		<div class="container-fluid info-list"></div>
		<div class="container-fluid">
			<div class="row next-page">
				<a class="btn btn-default btn-lg nav-next">∞ 点我继续 :-D</a>
			</div>
		</div>
	</div>
</main>

	<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<script id="infoBoxTpl"  type="text/html">
{% for(var i=0; i<datas.length; i++){ var info = datas[i]; %}
	<div class="row info-box">
	 <h3><a href="{%=GetNavUrl(info.siteUrl, info.id)%}">{%=info.title%}</a></h3>
	 <a>【{%=info.catId%}】</a>
	 <p class="note">{%=info.summary%}</p>
	 <div class="main-pic {%=(info.hasPic==1?'show':'hidden')%}">
	 	<a href="{%=GetNavUrl(info.siteUrl, info.id)%}">
			<img class="img-responsive center-block" src="{%=GetUrl(info.picUrl)%}" />
		</a>
	 </div>
	 <div id="content{%=info.id%}" class="more content-box {%=(info.hasContent==1?'show':'hidden')%}">……</div>
	 <div class="user-act">
	 {% if(info.hasContent==1){ %}
	  <a class="btn btn-success btn-sm" onclick="SITE_MAIN.NAV.LATEST.viewAllClick(this);" data-id="{%=info.id%}">看全文 <span>&#969;</span></a>
	 {% } %}
	  <a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="{%=info.id%}">赞 <span>&#9829;</span> <span class="zan-count">{%=info.loveNum%}</span></a>
	  <a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="{%=info.id%}">踩 <span>&#966;</span> <span class="cai-count">{%=info.hateNum%}</span></a>
	  <a href="javascript:;" class="btn btn-default btn-sm" onclick="SITE_MAIN.NAV.LATEST.talkClick(this);" data-id="{%=info.id%}" data-su="{%=info.siteUrl%}">吐槽 <span>&#945;</span></a>
	 </div>
	</div>
{% } %}
</script>
<script>
template.helper('GetUrl', function(s){return SITE_MAIN.getUrl(s);});
template.helper('GetNavUrl', function(su,id){return SITE_MAIN.getNavUrl(su,id);});
jQuery(function(){
	SITE_MAIN.NAV.LATEST.doInit();
	SITE_MAIN.NAV.fetchLatest();
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>