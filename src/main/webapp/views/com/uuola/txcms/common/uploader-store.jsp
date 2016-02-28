<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<%
    String url = (String)request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传结果 </title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script>
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
		<div class="alert bg-success"><p>上传成功！当前存储路径： </p><h5>${url}</h5> </div>
		<div class="row">
			<div class="col-sm-2">
			<button type="button" onclick="deleteUploadFile('${param.jscallback}','${url}');" class="btn btn-warning btn-sm">删除文件</button>
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
		$.post(window.ctx + '/uploader/remove?url='+url , "_method=delete", function(x){
			if(x){
				window.parent.window.${param.jscallback }('', '', '');
				location.href= window.ctx + '/uploader?jscallback='+ callback +'&t=' + Math.random();
			}else{
				alert(x + '删除遇到错误!');
				backToUpload(callback);
			}
		});
	};
	
	function backToUpload(callback){
		location.href= window.ctx + '/uploader?jscallback='+ callback +'&t=' + Math.random();
	};
</script>
</body>
</html>