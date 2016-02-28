<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" %>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传图片、文件</title>
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script>
</head>
<body>
<div class="container-fluid">
	<form action="uploader/store?jscallback=${param.jscallback}" method="post" enctype="multipart/form-data">
	<label>上传文件：(jpg, gif, png, zip, 7z, txt, rar, doc)</label>
	<div class="row">
		<div class="col-sm-4">
			<input type="file" name="mpfile" class="btn btn-default input-sm">
		</div>
		<div class="col-sm-2">
			<select name="dir" class="form-control input-sm" onchange="uploadDirChange(this)">
				<option value="image">图片</option>
				<option value="file">文件</option>
			</select>
		</div>
		<div id="thumbRadio" class="col-sm-2">
			缩图: 
			<input type="radio" name="needThumb" value="true" checked="checked">是，
			<input type="radio" name="needThumb" value="false">否
		</div>
		<div class="col-sm-2">
			<button type="submit"  class="btn btn-info btn-sm">确定上传</button>
		</div>
	</div>
	</form>
</div>
<script>
function uploadDirChange(e){
	var tbrdo = $('#thumbRadio');
	if(e.value=='image'){
		tbrdo.show();
	}else{
		tbrdo.hide();
	}
};
</script>
</body>
</html>