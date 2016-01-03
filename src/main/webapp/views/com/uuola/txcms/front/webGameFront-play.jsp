<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0,user-scalable=no" name="viewport" id="viewport" />
<title>${infoDTO.infoBase.title}</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script>window.ctx = '${ut:getCtxPath()}';</script>
<style>
#h5gIframe {
    	height:500px;
}
@media screen and (max-device-width: 600px) {
    	#h5gIframe {
    		height:100%;
    	}
}
</style>
</head>
<body>
<c:if test="${not empty infoDTO.infoBase.siteUrl}">
	<iframe src="about:blank;" id="h5gIframe" style="width:100%;border:0;margin:0;padding:0;" allowtransparency="true"></iframe>
</c:if>
<br/>a
<br/>a
<br/>a
<br/>a
<br/>a
<br/>a
<br/>a
<br/>a
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.js"></script>
<script>
jQuery(function(){
	$('#h5gIframe').attr('src', window.ctx + '${infoDTO.infoBase.siteUrl}/index.html?T=' + Math.random() * 1000 + '&frwahash=${frwahash}');
});
</script>
</body>
</html>