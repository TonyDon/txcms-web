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
<style>
html {
	position: relative;
	min-height: 100%;
}
body {
	margin-bottom: 4em;
	background: #EBEBEB;
	padding-top:4em;
}
.navbar-brand {
	padding-top: 0.25em;
}
.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 4em;
	background-color: #f5f5f5;
}
.container {
	width: auto;
	max-width: 40em;
	padding: 0 1em;
}
.container .text-muted {
	margin: 1.2em 0;
	text-align: center;
}
#main {
	background: #F5F5F5;
}

#main div.aside {
	width: auto;
	max-width: 40em;
	text-align: center;
	margin-top: 2em;
	border-top: 0.15em #f5f5f5 solid;
	padding: 0.5em 0 0.5em 0;
}

#main div.main-pic, a.site-url {
	display: none;
}

div.out-site {
	margin-top: 3em;
}

#main div.main-pic img {
	border: 1px #DBDBDB solid;
}

#main article {
	font-size: 1.2em;
	line-height: 1.6em;
}

.title {
	font-weight: 600;
	text-shadow: 0 2px 2px #fff;
}

.summary {
	text-indent: 2em;
	font-size: 1.2em;
}

.info-meta {
	padding: 0 0 0.5em 0;
	color: #35A6D1;
}

.float-box {
	width: 6em;
	overflow: hidden;
	position: fixed;
	right: 0.5em;
	bottom: 0.5em;
	z-index: 10;
}
.float-zone {
	width: 100%;
	overflow: hidden;
}
.float-qr-wx {
	width: 6em;
	height: 6em;
}
.float-gotop {
	width: 6em;
	height: 2em;
	display:block;
	background:#F5F5F5;
}
.float-gotop a {
	display: block;
	text-align: center;
	color: #000;
	cursor: pointer;
}
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<header class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="${ut:getCtxPath()}/"  title="986001.com 娱乐星空">
      	<img alt="986001.com" title="986001.com 娱乐星空" class="img-responsive" src="${ut:getCtxPath()}/static/style/986001-1.png"/>
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
		<div class="main-pic">
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
	 		986001.COM 娱乐星空 手机娱乐在线
	 	</p>
	 </div>
</footer>
<script src="${ut:getCtxPath()}/static/js/require-2.1.22.js"></script> 
<script>
require.config({
    baseUrl: '${ut:getCtxPath()}/static',
    paths: {
        jquery : 'js/jquery-2.1.4.min',
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
	$('div#main article img').addClass('img-responsive');
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
	setTimeout(function(){
		PAGE_DATA.jqObj.artContent.html(PAGE_DATA.infoDat.infoContent.content || '-无-');
		PAGE_DATA.fixArtImage();
	},ut.rndint(1000,2000));
};
require(['jquery','bootstrap','common'], function(j) {
	var jQuery = j;
	PAGE_DATA.doInit();
	PAGE_DATA.doRender();
});
</script>
</body>
</html>