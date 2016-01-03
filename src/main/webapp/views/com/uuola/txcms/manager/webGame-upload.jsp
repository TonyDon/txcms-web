<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<%
    String callback =  request.getParameter("jscallback");
    String url = (String)request.getAttribute("url");
    Integer error = (Integer)request.getAttribute("error");
    String message = (String)request.getAttribute("message");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>game zip upload page</title>
<style>
body{font-size:12px;}
</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
	<% if(null == url){
		out.println("url: 上传失败!<br/>");
		out.println("error:" + error + "<br/>");
		out.println("错误信息：" + message + "<br/>");
	}else{%>
		当前存储路径： ${url } 
		<br/><button onclick="deleteUploadFile('<%=callback%>','<%=url%>');">删除文件夹</button>
	<%}%>
		<br/><button onclick="backToUpload('<%=callback%>');">返回重新上传</button>
<script>
	setTimeout(function(){
		try{
			window.parent.window.<%=callback%>('${url }', '${error }', '${message }');
		}catch(e){
			alert(e);
		}
	}, 200);
	
	function deleteUploadFile(callback, url){
		var a = url.split('/');
		var path = (a.slice(0, a.length-2)).join('/');
		alert(path);
		location.href= window.ctx + '/manager/app/webgame/removeupload?jscallback=' + callback +'&url=' + path + '&t=' + Math.random();
	};
	
	function backToUpload(callback){
		location.href= window.ctx + '/manager/app/webgame/initupload?jscallback=' + callback +'&t=' + Math.random();
	};
</script>
</body>
</html>