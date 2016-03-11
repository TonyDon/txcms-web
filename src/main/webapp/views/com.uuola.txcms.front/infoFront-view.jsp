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
<title>${infoDTO.infoBase.title}</title>
<meta content="" name="keywords">
<meta content="" name="description">
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
		<div class="main-pic text-center">
			<p><img class="img-responsive" src="https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif"/></p>
		</div>
		<article></article>
		<div class="info-meta out-site container-fluid">
			<div class="row">
				<div class="col-xs-4">
					<span class="read-num">阅读：76253次</span>
					<a class="site-url" href="javascript:;" target="_blank">文章来源</a>
				</div>
				<div class="col-xs-4">
					<span class="time"></span>
				</div>
				<div  class="col-xs-4">
					<span class="author"></span>
				</div>
			</div>
			<%@include file="inc-share.jspf" %>
		</div>
  		<div class="aside">
  			<img class="img-responsive"  src="https://img.alicdn.com/imgextra/i1/152137799/TB2I7zLkVXXXXX5XXXXXXXXXXXX-152137799.png" />
  		</div>
  </div>
</main>

<%@include file="inc-float.jspf" %>
<%@include file="inc-footer.jspf" %>

<script src="${ut:getCtxPath()}/static/js/require-2.1.22.js"></script> 
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script> 
<script>
require.config({
    baseUrl: '${ut:getCtxPath()}/static',
    paths: {
        bootstrap : 'bootstrap/js/bootstrap.min',
        common : 'js/common'
    }
});
var PAGE_DATA = {};
PAGE_DATA.infoDat = ${ut:toJSON(infoDTO)};
PAGE_DATA.verrors = ${ut:toJSON(validErrors)};
PAGE_DATA.doInit = function(){
	PAGE_DATA.jqObj = {
			artTitle : $("h3.title"),
			artTime : $("span.time"),
			artAuthor : $("span.author"),
			artSummary : $("blockquote.summary"),
			artContent : $("div#main article"),
			artPicDir : $('div.main-pic'),
			artMainPic : $("div.main-pic img"),
			outSiteHref : $("a.site-url"),
			currSite : $('span.curr-site')
	};
};
PAGE_DATA.getUrl = function(url){
	if(!url){
		return 'https://img.alicdn.com/imgextra/i2/152137799/T2jXVgXgdOXXXXXXXX_!!152137799.gif';
	}
	if(url.indexOf('http')!==0 && url.indexOf(window.ctx)<0){
		return window.ctx + url ;
	}
	return url ;
};
PAGE_DATA.existError = function(){
	if(this.verrors && this.verrors.length>0){
		alert('读取文章出错,请稍后再试! \r\n ' + this.verrors.join('\r\n'));
		return true;
	}
	return false;
};
PAGE_DATA.fixArtImage = function(){
	$('div#main article img').addClass('img-responsive center-block');
};
PAGE_DATA.doRender = function(){
	if(PAGE_DATA.existError())return ;
	PAGE_DATA.jqObj.artTitle.text(this.infoDat.infoBase.title);
	PAGE_DATA.jqObj.artTime.text(ut.parseDate(this.infoDat.infoBase.createTime, 10));
	PAGE_DATA.jqObj.artAuthor.text('['+this.infoDat.infoBase.authorId+']');
	PAGE_DATA.jqObj.artSummary.text(this.infoDat.infoBase.summary);
	if(this.infoDat.infoBase.hasPic===1){
		var picurl = this.getUrl(this.infoDat.infoBase.picUrl);
		if(picurl!=''){
			PAGE_DATA.jqObj.artMainPic.attr('src', picurl);
			PAGE_DATA.jqObj.artPicDir.show();
		}
	}
	if(this.infoDat.infoBase.siteUrl && this.infoDat.infoBase.siteUrl.length>5){
		var siteurl = this.getUrl(this.infoDat.infoBase.siteUrl);
		if(siteurl!=''){
			PAGE_DATA.jqObj.outSiteHref.attr('href', siteurl);
			PAGE_DATA.jqObj.outSiteHref.show();
		}
	}
	PAGE_DATA.jqObj.currSite.text('986001娱乐在线');
	if(PAGE_DATA.infoDat.infoContent && PAGE_DATA.infoDat.infoContent.content){
		setTimeout(function(){
			PAGE_DATA.jqObj.artContent.html(PAGE_DATA.infoDat.infoContent.content);
			PAGE_DATA.fixArtImage();
		},ut.rndint(1000,2000));
	}
};
require(['bootstrap','common'], function() {
	PAGE_DATA.doInit();
	PAGE_DATA.doRender();
});
</script>
</body>
</html>