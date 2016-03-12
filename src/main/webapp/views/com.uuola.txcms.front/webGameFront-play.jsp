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
<%@include file="inc-css.jspf" %>
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
#h5gIframe {width:100%;min-height: 40em;border: 0; margin: 0; padding: 0;z-index: -100;}
.container{max-width:100%;}
</style>
</head>
<body>
<%@include file="inc-nav.jspf" %>
<main>
	<div id="main" class="container">
		<div class="text-center">
			<iframe src="about:blank;" id="h5gIframe" allowtransparency="true"></iframe>
		</div>
		<div class="aside">
			<img class="img-responsive" src="https://img.alicdn.com/imgextra/i1/152137799/TB2I7zLkVXXXXX5XXXXXXXXXXXX-152137799.png" />
		</div>
	</div>
</main>

<%@include file="inc-footer.jspf" %>

<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script>
<script src="${ut:getCtxPath()}/static/bootstrap/js/bootstrap.min.js"></script> 
<script src="${ut:getCtxPath()}/static/js/common.min.js"></script>
<script>
var PAGE_DATA = {};
PAGE_DATA.infoDat = ${ut:toJSON(infoDTO)};
PAGE_DATA.verrors = ${ut:toJSON(validErrors)};
PAGE_DATA.frwahash = '${frwahash}';
</script>
<script src="${ut:getCtxPath()}/static/js/site-min.js"></script>
<script>
jQuery(function(){
	PAGE_DATA.H5G_PLAY.doInit();
	PAGE_DATA.H5G_PLAY.doRender();
});
</script>
</body>
</html>