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
<link href="${ut:getCtxPath()}/static/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${ut:getCtxPath()}/static/manager/css/metisMenu.css" rel="stylesheet" type="text/css">
<link href="${ut:getCtxPath()}/static/manager/css/sb-admin-2.css" rel="stylesheet" type="text/css">
<link href="${ut:getCtxPath()}/static/manager/css/font-awesome.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
        <script src="${ut:getCtxPath()}/static/js/html5shiv.js"></script>
        <script src="${ut:getCtxPath()}/static/js/respond.min.js"></script>
<![endif]-->
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
                	<span style="color:#ACACAC">当前登录帐号：</span><span>${admin.name }</span>
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
                            <a href="#!/console/dashboard"><i class="fa fa-dashboard fa-fw"></i> 控制面板</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="panels-wells.html">Panels and Wells</a>
                                </li>
                                <li>
                                    <a href="buttons.html">Buttons</a>
                                </li>
                                <li>
                                    <a href="notifications.html">Notifications</a>
                                </li>
                                <li>
                                    <a href="typography.html">Typography</a>
                                </li>
                                <li>
                                    <a href="icons.html"> Icons</a>
                                </li>
                                <li>
                                    <a href="grid.html">Grid</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Second Level Item</a>
                                </li>
                                <li>
                                    <a href="#">Third Level <span class="fa arrow"></span></a>
                                    <ul class="nav nav-third-level">
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                        <li>
                                            <a href="#">Third Level Item</a>
                                        </li>
                                    </ul>
                                    <!-- /.nav-third-level -->
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li class="active">
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="active" href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
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
    	 <div>
    	 	系统版本：txcms version 1.0.0-20150721170112938
    	 </div>
    </footer>
<script src="${ut:getCtxPath()}/static/js/jquery-2.1.4.min.js"></script>
<script src="${ut:getCtxPath()}/static/bootstrap/js/bootstrap.min.js"></script>
<script src="${ut:getCtxPath()}/static/manager/js/metisMenu.js"></script>
<script src="${ut:getCtxPath()}/static/manager/js/sb-admin-2.js"></script>
<script src="${ut:getCtxPath()}/static/js/common.js"></script>
<script src="${ut:getCtxPath()}/static/js/jq.md5.js"></script>
<script src="${ut:getCtxPath()}/static/js/jq.sha1.js"></script>
<script src="${ut:getCtxPath()}/static/js/jq.cookie.js"></script>
<script src="${ut:getCtxPath()}/static/jqvalidate/jquery.validate.js"></script>
<script src="${ut:getCtxPath()}/static/jqvalidate/messages_zh.js"></script>
<script>
var PAGE_DEF ={
		logoutUrl : window.ctx + '/manager/console/logout',
		console_logout : $('#console_logout')
};

$(function(){
	
	PAGE_DEF.console_logout.click(function(){
		ut.reload(PAGE_DEF.logoutUrl+"?t="+ut.r());
	});
	
});
</script>
</body>
</html>