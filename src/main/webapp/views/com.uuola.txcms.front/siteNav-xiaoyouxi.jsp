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
.container{padding: 0 0.5em;}
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
		<div class="container-fluid info-list">
			<div class="row masonry-container">
				<div class="col-sm-6 item">
					<div class="thumbnail">
						<img class="img-rounded" src="//m.986001.com/store/image/7e0/080/0154/R34C1539406e8dc72a8.jpg"/>
					<div class="intro">
						<h4>Flappy Bird 飞翔小鸟</h4>
						<div class="text-info">用单击控制小鸟飞翔，不要让小鸟撞到障碍物，让它飞的更高更远吧！</div>
						<p>
							<a role="button" class="btn btn-info btn-sm" href="#">现在玩</a>
							<a role="button" class="btn btn-default btn-sm" href="#">分享</a>
							<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="431102894802"><span>♥</span> <span class="zan-count">7</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="431102894802"><span>φ</span> <span class="cai-count">2</span></a>
							<b class="pull-right"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 67</b>
						</p>
					</div>
					</div>
				</div>
				<div class="col-sm-6 item">
					<div class="thumbnail">
						<img class="img-rounded" src="//m.986001.com/store/image/7e0/077/0516/htIJ153850dc02a4887.jpg"/>
					<div class="intro">
						<h4>点亮星座！</h4>
						<div class="text-info">不重复路线连接星座上的所有星星，通关后愿望就能成真哦：） （本游戏加载资源大概需要2M流量，建议WIFI下玩耍）</div>
						<p>
							<a role="button" class="btn btn-info btn-sm" href="#">现在玩</a>
							<a role="button" class="btn btn-default btn-sm" href="#">分享</a>
							<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="431102894802"><span>♥</span> <span class="zan-count">7</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="431102894802"><span>φ</span> <span class="cai-count">2</span></a>
							<b class="pull-right"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 67</b>
						</p>
					</div>
					</div>
				</div>
				<div class="col-sm-6 item">
					<div class="thumbnail">
						<img class="img-rounded" src="//m.986001.com/store/image/7e0/077/0321/st4z15384dec01f52d0.jpg"/>
					<div class="intro">
						<h4>2048-金典数字消除游戏</h4>
						<div class="text-info">合并相同的数字块，将合并为一个双倍的数字块，超越2048! GO！！！</div>
						<p>
							<a role="button" class="btn btn-info btn-sm" href="#">现在玩</a>
							<a role="button" class="btn btn-default btn-sm" href="#">分享</a>
							<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="431102894802"><span>♥</span> <span class="zan-count">7</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="431102894802"><span>φ</span> <span class="cai-count">2</span></a>
							<b class="pull-right"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 67</b>
						</p>
					</div>
					</div>
				</div>
				<div class="col-sm-6 item">
					<div class="thumbnail">
						<img class="img-rounded" src="//m.986001.com/store/image/7e0/072/0342/SY62153699d49d67458.jpg"/>
					<div class="intro">
						<h4>消消看-挑战1000分</h4>
						<div class="text-info">技巧提示 ^_^：一次消除的砖块越多，得分越高；尽量把同颜色的砖块积累到一起消除；</div>
						<p>
							<a role="button" class="btn btn-info btn-sm" href="#">现在玩</a>
							<a role="button" class="btn btn-default btn-sm" href="#">分享</a>
							<a href="javascript:;" class="btn btn-warning btn-sm love" onclick="SITE_MAIN.NAV.LATEST.loveClick(this);" data-id="431102894802"><span>♥</span> <span class="zan-count">7</span></a>
							<a href="javascript:;" class="btn btn-default btn-sm hate" onclick="SITE_MAIN.NAV.LATEST.hateClick(this);" data-id="431102894802"><span>φ</span> <span class="cai-count">2</span></a>
							<b class="pull-right"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 67</b>
						</p>
					</div>
					</div>
				</div>
			</div>
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

</script>
<script>
template.helper('GetUrl', function(s){return SITE_MAIN.getUrl(s);});
template.helper('GetNavUrl', function(su,id){return SITE_MAIN.getNavUrl(su,id);});
var topCid = ${topCid};
jQuery(function(){
	var $container = $('.masonry-container');
    $container.imagesLoaded( function () {
        $container.masonry({
            columnWidth: '.item',
            itemSelector: '.item'
        });
    });
});
</script>
<%@include file="inc-trace.jspf" %>
</body>
</html>