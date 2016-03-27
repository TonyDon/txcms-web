<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" buffer="32kb" session="false" autoFlush="true"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="javax.naming.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body style="margin-left:50px;margin-right:50px;background:#EEF4FB;font-family: Tahoma, Verdana, Arial;line-height:24px;">
<center style="color:#FF6600;font-size:24px;font-weight:bold;">系统运行环境及虚拟机内存使用量</center>
<hr>
<center>系统根目录</center>
<%
	File[] fs = File.listRoots();
	for(int i=0;i<fs.length;i++){
%>
<%=fs[i].getCanonicalPath()%>&nbsp;
<%
	}
%>
<hr>
<center>系统参数</center>
<%
	Properties pro = System.getProperties();
	Enumeration e = pro.propertyNames();
	while(e.hasMoreElements()){
		String name = (String)e.nextElement();
		String value = pro.getProperty(name);
%>
<span style="color:#122C4C"><%=name%>&nbsp;〓&nbsp;</span><font color="red"><%=value%></font><br>
<%
	}
%>
<hr>
<center>环境变量</center>
<%
	Map env = System.getenv();
	Iterator it = env.keySet().iterator();
	while(it.hasNext()){
		String name = (String)it.next();
		String value= (String)env.get(name);
%>
<span style="color:#122C4C"><%=name%>&nbsp;〓&nbsp;</span><font color="red"><%=value%></font><br>
<%
	}
%>
<hr>
<center>Java 虚拟机内存使用</center>
内存总量：<%=Runtime.getRuntime().totalMemory()/1024/1024%>MB<br>
最大内存：<%=Runtime.getRuntime().maxMemory()/1024/1024%>MB<br>
空闲内存：<%=Runtime.getRuntime().freeMemory()/1024/1024%>MB<br>
</body>
</html>