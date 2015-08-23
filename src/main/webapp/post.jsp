<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  trimDirectiveWhitespaces="true" 
    import="com.uuola.txweb.framework.utils.ContextUtil,
    com.uuola.txcms.base.service.*,
    com.uuola.txcms.base.service.impl.*,
    org.apache.commons.io.*,
    com.uuola.commons.uploader.apache.*"%>
<%
	System.out.print("----jsp: ");
/*     System.out.print(IOUtils.toString(request.getInputStream())); */
    System.out.println(request.getHeader("webinfo"));
    MutiFileUpload sfu = new MutiFileUpload();
	sfu.setEncoding("utf-8");
    //sfu.setSizeMax(516120);
    sfu.setSizeThreshold(1<<18);
	sfu.parseRequest(request);
	System.out.println("sfu: " + sfu.getParameter("aaa"));  
	System.out.println("sfu: " + sfu.getParameter("bbb")); 
	System.out.println("sfu: file " +  sfu.getFiles().size()); 
	out.println(sfu.getFiles().size());
%>
<%=sfu.getParameter("aaa")%>
