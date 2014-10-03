<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" 
    import="com.uuola.txweb.framework.utils.ContextUtil,com.uuola.txcms.base.service.*,com.uuola.txcms.base.service.impl.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=ContextUtil.getBean(UserRegService.class).getClass()%>
</body>
</html>