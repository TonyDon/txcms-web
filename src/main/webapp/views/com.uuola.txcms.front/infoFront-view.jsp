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
  /* Margin bottom by footer height */
  margin-bottom: 4em;
  background:#EBEBEB;
}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
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
}
#main{
	background:#FAFAFA;
}
#main div.aside{
	width: auto;
	max-width: 40em;
	text-align: center;
}
#main div.main-pic img{
	width: auto;
	max-width: 38em;
}
#main article{
	font-size:1.2em;
	line-height:1.5em;
}
.summary{
	font-size:1.2em;
}
.info-meta{
	padding:0 0 0.5em 0;
	color:#35A6D1;
}
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<header class="navbar navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <a class="navbar-brand" href="#"><img src="${ut:getCtxPath()}/static/style/986001-logo-1.png"/></a> </div>
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
  <div id="main" class="container">
		<div class="page-header">
			<h3>${infoDTO.infoBase.title}</h3>
		</div>
		<div class="info-meta">
			<span class="time">${ut:formatTimeMillis(infoDTO.infoBase.createTime, "yyyy-MM-dd")}</span>
			<span class="author">${infoDTO.infoBase.authorId} 噢啦生活</span>
		</div>
		<blockquote class="summary">
			&nbsp;&nbsp;&nbsp;&nbsp;${infoDTO.infoBase.summary}
		</blockquote>
		<div class="main-pic">
			<p>
				<img src="${infoDTO.infoBase.picUrl}" />
			</p>
		</div>
		<article>
			${infoDTO.infoContent.content}
		</article>
  		<div class="aside"> <img src="static/p1.png" /> </div>
  </div>
</main>
<footer class="footer"> 
	 <div class="container">
	 	<p class="text-muted">
	 		Copyright 2005-2015 mahua.com 版权所有 京ICP备13039142号-1 京ICP证130395号
	 	</p>
	 </div>
</footer>

<c:if test="${not empty validErrors}">
		<c:forEach var="verr" items="${validErrors}">
			<b>${verr}</b>
		</c:forEach>
</c:if>
	
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script> 
<script src="${ut:getCtxPath()}/static/bootstrap/js/bootstrap.min.js"></script> 
</body>
</html>