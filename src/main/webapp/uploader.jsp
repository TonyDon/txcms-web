<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" 
    import="org.apache.commons.io.IOUtils,java.util.*,com.uuola.commons.*"%>
<%
    List<String> r = IOUtils.readLines(request.getInputStream());
	
	System.out.println(r);
	System.out.println(request.getParameterMap());
%>
