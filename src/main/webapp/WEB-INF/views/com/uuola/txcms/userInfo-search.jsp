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
<title>${supReqInfo.title}</title>
<style>

</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
\${page.datas[0].tel} 解析值为 <br/>
${page.datas[0].tel}

<c:if test='${not empty errors}'>
<p style="color:red;">
	 <c:forEach items="${errors}" var="error" >  
              ${error}<br/>
     </c:forEach>
</p>
</c:if>
</body>
</html>