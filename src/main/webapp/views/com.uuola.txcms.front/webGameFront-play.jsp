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
<title>${infoDTO.infoBase.title}</title>
<meta content="" name="keywords">
<meta content="" name="description">
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
#h5gIframe {
	width:100%;
	min-height: 40em;
	border: 0; 
	margin: 0; 
	padding: 0;
	z-index: -100;
}
.container{
	max-width:90%;
}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="page-header">
			<h3 class="title"></h3>
		</div>
		<div class="text-center">
			<iframe src="about:blank;" id="h5gIframe" allowtransparency="true"></iframe>
		</div>
		<div class="aside">
			<img class="img-responsive"
				src="https://img.alicdn.com/imgextra/i1/152137799/TB2I7zLkVXXXXX5XXXXXXXXXXXX-152137799.png" />
		</div>
	</div>
</main>

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
PAGE_DATA.frwahash = '${frwahash}';
PAGE_DATA.doInit = function(){
	PAGE_DATA.jqObj = {
			artTitle : $("h3.title"),
			outSiteHref : $("a.site-url"),
			h5gIframe : $('#h5gIframe')
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
PAGE_DATA.doRender = function(){
	if(PAGE_DATA.existError())return ;
	PAGE_DATA.jqObj.artTitle.text(this.infoDat.infoBase.title);
	if(this.infoDat.infoBase.siteUrl && this.infoDat.infoBase.siteUrl.length>5){
		var siteurl = this.getUrl(this.infoDat.infoBase.siteUrl);
		if(siteurl!=''){
			var height = $(window).height() + $(window).scrollTop();
			PAGE_DATA.jqObj.h5gIframe.css({'height' : (parseInt(height/16)+1.5)+'em'});
			PAGE_DATA.jqObj.h5gIframe.load(function(){
				var thisheight = $(this).contents().find("body").height()+30;
				$(this).height(thisheight < 500 ? 500 : thisheight);
			});
			PAGE_DATA.jqObj.h5gIframe.attr('src', siteurl + 'index.html?T=' + Math.random() * 1000 + '&frwahash=' + PAGE_DATA.frwahash);
		}
	}
};
require(['bootstrap','common'], function() {
	PAGE_DATA.doInit();
	PAGE_DATA.doRender();
});
</script>
</body>
</html>