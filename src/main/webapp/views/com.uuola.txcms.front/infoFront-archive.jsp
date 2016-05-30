<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true" session="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="inc-comm.jspf" %>
<!DOCTYPE HTML>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="format-detection" content="telephone=no"/>
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title>归档列表-第 ${infoQuery.pageNo}页-986001手机娱乐网-m.986001.com</title>
<meta name="description" content="手机娱乐,手机游戏,娱乐生活,奇趣搞笑,运动健身,型男肌肉男,运动饮食" />
<%@include file="inc-css.jspf" %>
<script>window.ctx = '<%=ctp%>';</script>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
<div id="main" class="container">
		<div class="container-fluid">
		<h2>归档列表</h2>
		</div>
		<div class="container-fluid info-list" title="归档列表">
		<c:if test="${not empty pageDTO.datas}">
		<c:forEach var="item" items="${pageDTO.datas}">   
	    <div class="row info-box">
		<c:choose>
		   <c:when test="${item.catId>=30 && item.catId<=34 }">
		      		<h3><a href="<%=ctp%>/h5g/show?id=${item.id}?ref=archive-list" target="_blank" title="小游戏-${item.title }">[小游戏] ${item.title }</a></h3>
		   </c:when>
		   <c:otherwise>
		      <c:choose>
		      		<c:when test="${item.hasVideo==1}">
		      		<h3><a href="<%=ctp%>/info/${item.id}?ref=archive-list" target="_blank" title="${item.title }(视频)">[视频] ${item.title }</a></h3>
		      		</c:when>
		      		<c:when test="${item.hasPic==1}">
		      		<h3><a href="<%=ctp%>/info/${item.id}?ref=archive-list" target="_blank" title="${item.title }(图)">[图] ${item.title }</a></h3>
		      		</c:when>
		      		<c:otherwise>
		      		<h3><a href="<%=ctp%>/info/${item.id}?ref=archive-list" target="_blank" title="${item.title }">${item.title }</a></h3>
		      		</c:otherwise>
		      </c:choose>
		   </c:otherwise>
		</c:choose>
		</div> 
		</c:forEach> 
		</c:if>
		</div>
		<div class="container-fluid">
		<c:if test="${infoQuery.pageNo>1}">
		<div class="row next-page">
			<a class="btn btn-default btn-lg nav-next" href="<%=ctp %>/info/archive?pageNo=${infoQuery.pageNo-1}&listSize=32" title="第 ${infoQuery.pageNo-1}页-归档列表-986001手机娱乐网-m.986001.com">上一页</a>
		</div>
		</c:if>
		<div class="row text-center"><p>当前第 ${infoQuery.pageNo}页</p></div>
		<c:if test="${not empty pageDTO.datas}">
		<div class="row next-page">
			<a class="btn btn-default btn-lg nav-next" href="<%=ctp %>/info/archive?pageNo=${infoQuery.pageNo+1}&listSize=32" title="第 ${infoQuery.pageNo+1}页-归档列表-986001手机娱乐网-m.986001.com">下一页</a>
		</div>
		</c:if>
		</div>
</div>
</main>
<%@include file="inc-footer.jspf" %>
<%@include file="inc-js.jspf" %>
<%@include file="inc-trace.jspf" %>
<script>
jQuery(function(){SITE_MAIN.showQRcode();});
</script>
</body>
</html>