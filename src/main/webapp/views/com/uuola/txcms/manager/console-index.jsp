<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="ut" uri="/utils"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>控制台</title>
<meta content="" name="keywords">
<meta content="" name="description">
<%@include file="inc-css.jspf" %>
<style>

</style>
<script>window.ctx = '${ut:getCtxPath()}';</script>
</head>
<body>
<div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href=".">TXCMS 后台管理系统</a>
            </div>
            <!-- /.navbar-header -->
            
            <ul class="nav navbar-top-links navbar-right">
                <li>
                	<span style="color:#ACACAC">当前登录帐号：</span><span id="admin_name"></span>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户属性</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a id="console_logout" href="javascript:void();"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> <b>控制面板</b></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> CMS内容管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">类别管理</a>
                                </li>
                                <li>
                                    <a href="#">文章管理</a>
                                </li>
                                <li>
                                    <a href="#">新增文章</a>
                                </li>
                                <li>
                                    <a href="#">图片管理</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 系统设置<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">参数维护</a>
                                </li>
                                <li>
                                    <a href="#">字典维护</a>
                                </li>
                                <li>
                                    <a href="#">缓存管理</a>
                                </li>
                                <li>
                                    <a href="#">任务JOB管理</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-male fa-fw"></i> 管理员管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">管理员列表</a>
                                </li>
                                <li>
                                    <a href="#">新增管理员</a>
                                </li>
                                <li>
                                    <a href="#">权限管理</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 微信集成<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="#">公众号接入</a>
                                </li>
                                <li>
                                    <a href="#">微信用户</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 待扩展功能<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="#">功能1</a>
                                </li>
                                <li>
                                    <a href="#">功能2</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Blank</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
    <footer>
    	 <div style="padding:1em 0 1em 0; text-align:right;">
    	 	<div>当前时间：<span id="sess-curr-time"></span> </div>
    	 	<div>系统版本：txcms version 1.0.0-20150721170112938 </div>
    	 </div>
    </footer>

<%@include file="inc-js.jspf" %>
<script>
var PAGE_DEF ={
		logoutUrl : window.ctx + '/manager/console/logout',
		sessCheckUrl : window.ctx + '/manager/console/session_check',
		loginUrl : window.ctx + '/manager/verify/login',
		console_logout : $('#console_logout'),
		sess_curr_time : $('#sess-curr-time'),
		admin_name : $('#admin_name'),
		sess_check_timer : null
};



function SessCheck()
{
	$.get(PAGE_DEF.sessCheckUrl+"?t="+ut.r(), function(r){
		var t = String(r);
		if(t.indexOf('error')>-1){
			if(null != PAGE_DEF.sess_check_timer){
				clearInterval(PAGE_DEF.sess_check_timer);
			}
			ut.reload(PAGE_DEF.loginUrl+'?t='+ut.r());
		}else{
			PAGE_DEF.admin_name.text(t);
			PAGE_DEF.sess_curr_time.text(ut.parseDate((new Date()).getTime(), 16));
		}
	});
};
 
$(function(){
	
	PAGE_DEF.console_logout.click(function(){
		ut.reload(PAGE_DEF.logoutUrl+"?t="+ut.r());
	});
	SessCheck();
	PAGE_DEF.sess_check_timer = setInterval("SessCheck()",10000);
	
});
</script>
</body>
</html>