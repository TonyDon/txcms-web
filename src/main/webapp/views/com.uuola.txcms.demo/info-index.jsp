<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title></title>
<meta content="" name="keywords">
<meta content="" name="description">
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
body {
	background:#EBEBEB;
}
ul, li {
	list-style:none;
}
div, ul, li, h3, h4 {
	padding:0;
	margin:0;
}
#main div.last-info {
	background:#fff
}
ul.btitle {
	background:#F6F6F6;
}
ul.btitle li {
	padding: 5px 0 5px 0;
}
ul.btitle li h4 {
	margin-left:5px;
}
#main ul.section {
	padding:0;
	margin:5px;
}
#main ul.section li {
	height:26px;
	border-bottom:1px #F5F5F5 dashed;
	overflow:hidden;
	font-size:16px;
}
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<header class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#">986001</a> </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">最新</a></li>
        <li><a href="#">奇趣</a></li>
        <li><a href="#">搞笑</a></li>
        <li><a href="#">游戏</a></li>
      </ul>
    </div>
  </div>
</header>
<main>
  <div id="main">
    <div class="last-info">
      <ul class="btitle">
        <li>
          <h4>最新</h4>
        </li>
      </ul>
      <ul class="section">
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
      </ul>
      <ul class="btitle">
        <li>
          <h4>奇趣</h4>
        </li>
      </ul>
      <ul class="section">
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
      </ul>
      <ul class="btitle">
        <li>
          <h4>搞笑</h4>
        </li>
      </ul>
      <ul class="section">
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
      </ul>
      <div class="aside"> <img src="${ut:getCtxPath()}/static/p1.png" /> </div>
      <ul class="btitle">
        <li>
          <h4>小游戏</h4>
        </li>
      </ul>
      <ul class="section">
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
      </ul>
      <ul class="btitle">
        <li>
          <h4>小测试</h4>
        </li>
      </ul>
      <ul class="section">
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
        <li>动物也是抢镜王！盘点动物意外的抢镜瞬间</li>
        <li>五一黄金周最火爆神曲：雷军新单《Are You OK》</li>
        <li>[囧图] 造物主简直毫无逻辑可言。。</li>
        <li>精选段子：这样闹洞房闹的是哪一出啊？</li>
        <li>唐唐神吐槽：最疯骚的青春片</li>
      </ul>
    </div>
  </div>
  <div class="aside"> <img src="${ut:getCtxPath()}/static/p1.png" /> </div>
</main>
<footer> Copyright 2005-2015 mahua.com 版权所有 京ICP备13039142号-1 京ICP证130395号<br/>
</footer>
<script src="${ut:getCtxPath()}/static/js/jquery-1.11.1.min.js"></script> 
<script src="${ut:getCtxPath()}/static/bootstrap/js/bootstrap.min.js"></script> 
<script>

</script>
</body>
</html>