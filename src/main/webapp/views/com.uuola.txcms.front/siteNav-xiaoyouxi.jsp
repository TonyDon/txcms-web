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
<title>小游戏-开心驿站-m.986001.com</title>
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
.container{padding: 0 0.25em;}
.thumbnail{
	background-color: #FFFFFF;
    border: 1px solid #DDDDDD;
    border-radius: 4px 4px 4px 4px;
    display: block;
    line-height: 1.42857;
    margin-bottom: 0.5em;
    padding: 0.25em;
    transition: all 0.2s ease-in-out 0s;
}
.item{padding-left:0.15em; padding-right:0.15em;}
.intro>p{
	margin-top:0.5em;
}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="container-fluid">
			<div class="row masonry-container info-list"></div>
		</div>
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
{% for(var i=0; i<datas.length; i++){ var d = datas[i]; var href = GetNavUrl(d.siteUrl, d.id);%}
			<div class="col-sm-6 item">
					<div class="thumbnail">
					<a href="{%=href%}">
						<img class="img-rounded" src="{%=GetUrl(GetThumb(d.picUrl))%}"/>
					</a>
					<div class="intro">
						<h4><a href="{%=href%}">{%=d.title%}</a></h4>
						<span>{%=GetCatNav(d.catId)%}</span>
						<div class="text-info">{%=d.summary%}</div>
						<p>
							<a href="javascript:;" class="btn btn-info btn-sm" onclick="SITE_MAIN.NAV.LATEST.h5gPlayClick(this);" data-id="{%=d.id%}">现在玩</a>
							<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="{%=d.id%}"><span>♥</span> <span class="zan-count">{%=d.loveNum%}</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="{%=d.id%}"><span>φ</span> <span class="cai-count">{%=d.hateNum%}</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm" onclick="SITE_MAIN.NAV.LATEST.talkClick(this);" data-id="{%=d.id%}" data-su="{%=d.siteUrl%}">吐槽 </a>
							<b class="pull-right"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> {%=d.viewNum%}</b>
						</p>
					</div>
					</div>
			</div>
{% } %}
</script>
<script>
template.helper('GetUrl', function(s){return SITE_MAIN.getUrl(s);});
template.helper('GetNavUrl', function(su,id){return SITE_MAIN.getNavUrl(su,id);});
template.helper('GetCatNav', function(c){return SITE_MAIN.getCatNav(c);});
template.helper('GetThumb', function(u){return ut.fmtImageThumb(u,'w120');});
jQuery(function(){
	var $container = $('.masonry-container');
    SITE_MAIN.NAV.CAT.doInit(${topCid}, function(){
    	$container.imagesLoaded( function () {
            $container.masonry({
                columnWidth: '.item',
                itemSelector: '.item'
            });
        });
    });
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>