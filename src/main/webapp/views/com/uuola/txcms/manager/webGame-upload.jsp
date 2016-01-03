<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<%
    String url = (String)request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload page</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<style>
body{margin:0;padding:0;}
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<div class="container-fluid">
	<% if(null == url){ %>
		<div class="alert bg-warning">
			<p class="text-danger">上传失败!</p>
			<p class="text-danger">错 误 号: ${error } , 错误信息 :${message }</p>
		</div>  
		<button type="button" class="btn btn-info  btn-sm" onclick="backToUpload('${param.jscallback }');">返回重新上传</button>
	<%}else{%>
		<div class="alert bg-success"><p>上传zip游戏包解压处理成功！当前存储路径： </p><h4>${url }</h4> </div>
		<div class="row">
			<div class="col-sm-2">
			<button type="button" onclick="deleteUploadFile('${param.jscallback }','${url }');" class="btn btn-warning btn-sm">删除文件夹</button>
			</div>
			<div class="col-sm-2">
			<button type="button" class="btn btn-info  btn-sm" onclick="backToUpload('${param.jscallback }');">返回</button>
			</div>
		</div>
	<%}%>
</div>
<script>
	setTimeout(function(){
		try{
			window.parent.window.${param.jscallback }('${url }', '${error }', '${message }');
		}catch(e){
			alert(e);
		}
	}, 200);
	
	function deleteUploadFile(callback, url){
		var a = url.split('/');
		var path = (a.slice(0, a.length-2)).join('/');
		location.href= window.ctx + '/manager/app/webgame/removeupload?jscallback=' 
				+ callback +'&url=' + path + '&t=' + Math.random();
	};
	
	function backToUpload(callback){
		location.href= window.ctx + '/manager/app/webgame/initupload?jscallback=' 
				+ callback +'&t=' + Math.random();
	};
</script>
</body>
</html>