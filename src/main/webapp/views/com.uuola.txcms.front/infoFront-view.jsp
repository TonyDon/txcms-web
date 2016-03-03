<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ut:getCtxPath()}/static/style/v1/info.css" rel="stylesheet" type="text/css"/>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="${ut:getCtxPath()}/"  title="986001.com 开心驿站">
      	<img alt="986001.com" title="986001.com 开心驿站" class="img-responsive" src="${ut:getCtxPath()}/static/image/nav-logo.png"/>
      </a>
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${ut:getCtxPath()}/all/latest">最新</a></li>
        <li><a href="${ut:getCtxPath()}/qiqu">O_o奇趣</a></li>
        <li><a href="${ut:getCtxPath()}/gaosiao">∩_∩搞笑</a></li>
        <li><a href="${ut:getCtxPath()}/xiaoyouxi">≧▽≦小游戏</a></li>
      </ul>
    </div>
  </div>
</header>
<main>
  <div id="main" class="container">
		<div class="page-header">
			<h3 class="title"></h3>
		</div>
		<div class="info-meta container-fluid">
			<div class="row">
				<div class="col-xs-6">
					<span class="time"></span>
				</div>
				<div class="col-xs-6">
					<span class="share">分享到： 微信 QQ空间 微博 </span>
				</div>
			</div>
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
				<div  class="col-xs-8">
					<span class="author"></span>
					<span class="share">分享到： 微信 QQ空间 微博 </span>
				</div>
			</div>
		</div>
  		<div class="aside">
  			<img  class="img-responsive"  src="https://img.alicdn.com/imgextra/i1/152137799/TB2I7zLkVXXXXX5XXXXXXXXXXXX-152137799.png" />
  		</div>
  </div>
</main>

<aside class="float-box">
	<div class="float-zone">
		<div class="float-qr-wx" target="_blank">
			<img  class="img-responsive" src="http://tool.oschina.net/action/qrcode/generate?size=4"/>
		</div>
		<div class="float-gotop">
			<a href="#">返回顶部</a>
		</div>
	</div>
</aside>

<footer class="footer"> 
	 <div class="container">
	 	<p class="text-muted">
	 		986001.COM 手机娱乐 开心驿站
	 	</p>
	 </div>
</footer>
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
	PAGE_DATA.jqObj.artAuthor.text('[编辑:'+this.infoDat.infoBase.authorId+']');
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