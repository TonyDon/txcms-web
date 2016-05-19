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
<meta name="apple-mobile-web-app-capable" content="yes"/>
<title>${catNamepath}-内容列表-手机娱乐-开心驿站-m.986001.com</title>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '<%=ctp%>';</script>
<style>
.container{padding: 0 0.5em;}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="container-fluid">
		<div class="row"><h3>${catNamepath}</h3></div>
		</div>
		<div class="container-fluid info-list"></div>
		<div class="container-fluid">
			<div class="row next-page">
				<a class="btn btn-default btn-lg nav-next">点我继续</a>
			</div>
		</div>
	</div>
</main>
<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<script id="infoBoxTpl"  type="text/html">
{% for(var i=0; i<datas.length; i++){ var d = datas[i];  var href = GetNavUrl(d.siteUrl, d.id);%}
	<div class="row info-box">
	 <h3><a href="{%=href%}">{%=d.title%}</a></h3>
	 <span></span>
     <p class="note">{%=#FmtSummary(d.summary)%}</p>
	 <div class="main-pic {%=(d.hasPic==1?'show':'hidden')%}">
	 	<a href="{%=href%}">
			<img class="img-responsive center-block" src="{%=GetUrl(d.picUrl)%}" />
		</a>
	 </div>
	 <div id="content{%=d.id%}" class="more content-box {%=(d.hasContent==1?'show':'hidden')%}">……</div>
	 <div class="user-act">
	 	<div class="pull-left">
	 		{% if(IsH5G(d.catId)){ %}
	  		<a class="btn btn-info btn-sm" onclick="SITE_MAIN.NAV.LATEST.h5gPlayClick(this);" data-id="{%=d.id%}">现在玩</a>
	 		{% } %}
	 		{% if(d.hasContent==1){ %}
	  		<a class="btn btn-success btn-sm" onclick="SITE_MAIN.NAV.LATEST.viewAllClick(this);" data-id="{%=d.id%}">看全文</a>
	 		{% } %}
	  		<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="{%=d.id%}">赞 <span>&#9829;</span> <span class="zan-count">{%=d.loveNum%}</span></a>
	  		<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="{%=d.id%}">踩 <span>&#966;</span> <span class="cai-count">{%=d.hateNum%}</span></a>
	  		<a href="javascript:;" class="btn btn-default btn-sm" onclick="SITE_MAIN.NAV.LATEST.talkClick(this);" data-id="{%=d.id%}" data-su="{%=d.siteUrl%}">吐槽 <span>&#945;</span></a>
	  	</div>	  
	  	<div class="pull-right">
      		<a href="{%=href%}"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> {%=d.viewNum%}</a>
	  	</div>
	 </div>
	</div>
{% } %}
</script>
<script>
template.helper('GetUrl', function(s){return SITE_MAIN.getUrl(s);});
template.helper('GetNavUrl', function(su,id){return SITE_MAIN.getNavUrl(su,id);});
template.helper('IsH5G', function(i){return SITE_MAIN.isH5G(i);});
template.helper('FmtSummary', function(s){return SITE_MAIN.fmtSummary(s);});
jQuery(function(){
	SITE_MAIN.NAV.CAT.doInit('${cid}');
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>