<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ut:getCtxPath()}/static/style/bootstrap.css" rel="stylesheet">
<link href="${ut:getCtxPath()}/static/style/bootstrap-theme.css" rel="stylesheet">
<title>农产品供求信息展示</title>
<style>
body {
  padding-top: 80px;
  padding-bottom: 40px;
  background-color: #eee;
}
.starter-template {
  padding: 40px 15px;
  text-align: center;
}
</style>
<script>
	window.ctx = '${ut:getCtxPath()}';
</script>
</head>
<body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">噢啦网</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div> <!--/.nav-collapse -->
      </div>
    </div>
    
	<div class="container">
		<c:forEach var="supReqInfo" items="${list }">
		<div class="panel  panel-success" data-id="${supReqInfo.id}">
		    <div class="panel-heading">
              <h2 class="panel-title">${supReqInfo.title }</h2>
            </div>
            <div class="panel-body">
			<ul>
				<li><span>发布时间：</span><i>${ut:formatTimeMillis(supReqInfo.createTime,
						"yyyy-MM-dd HH:mm")}</i></li>
				<li><span>有效时间：</span><i>${ut:formatTimeMillis(supReqInfo.expireTime,
						"yyyy-MM-dd HH:mm")}</i></li>
				<li><span>信息类型：</span><i>${supReqInfo.infoType}</i></li>
				<li><span>联系电话：</span><i>${supReqInfo.contactTel}</i></li>
				<li><span>联系邮箱：</span><i>${supReqInfo.contactMail}</i></li>
				<li><span>详细地址：</span><i>${supReqInfo.contactAddr}</i></li>
				<li><span>联系QQ号：</span><i>${supReqInfo.contactQq}</i></li>
				<li><span>网 址：</span><i>${supReqInfo.contactWebsite}</i></li>
				<li><span>联 系 人：</span><i>${supReqInfo.contactName}</i></li>
				<li><span>地 区：</span><i>${supReqInfo.province}&nbsp;${supReqInfo.city}&nbsp;${supReqInfo.area}</i></li>
			</ul>
			<h4>发布人留言：</h4>
			<div>
				<p>${supReqInfo.message}</p>
			</div>

			<h4>发布人微信留言：</h4>
			<div>
				<div id="rel_weixin_sound" data-url="supReqInfo.weixinSound"></div>
			</div>

			<h4>相关视频</h4>
			<div>
				<div id="rel_video" data-url="${supReqInfo.videoUrl}"></div>
			</div>

			<h4>相关图片</h4>
			<div>
				<div class="rel_images" data-imgs="${supReqInfo.imageUrls}"></div>
			</div>

			<div>信息状态：${supReqInfo.status } , 显示顺序：${supReqInfo.dispOrder
				}, 发布者类型：${supReqInfo.publishType }</div>

			<div>组织名称：${supReqInfo.orgName } , 信息 tag：${supReqInfo.infoTag
				} , 查看次数：${supReqInfo.viewNum }</div>

			<div>用户ID：${supReqInfo.userId } , 类目ID：${supReqInfo.catId } ,
				信息ID：${supReqInfo.id }</div>
			</div>
		 </div>
		</c:forEach>
	</div>




    <script src="${ut:getCtxPath()}/static/js/sea-2.1.1.js"></script>
	<script src="${ut:getCtxPath()}/static/js/jquery-1.10.1.js"></script>
	<script>
		seajs.config({
			base : ctx + "/static/js/",
			alias : {
				"bootstrap" : "bootstrap"
			}
		});
		seajs.use(['bootstrap'], function() {
			var relImages = $('div.rel_images');
			relImages.each(function(i, e) {
				var jqImg = $(this);
				var imgs = jqImg.data('imgs').split('\|');
				var html = [];
				var t = '<img src="'+ctx+'/@img" width="300"/>'
				for ( var i in imgs) {
					html.push(t.replace(/@img/, imgs[i]));
				}
				jqImg.append(html.join('<br/>'));
			});
		});
	</script>
</body>
</html>