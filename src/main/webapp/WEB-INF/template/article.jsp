<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <base href="<%=basePath %>"/>
    <title>文章模块-合众饰品专卖</title>
    <meta name="keywords" content="KEYWORDS..."/>
    <meta name="description" content="DESCRIPTION..."/>
    <meta name="author" content="HZIT"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="icon" href="../../images/icon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" sizes="57x57"
          href="../../images/icon/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120"
          href="../../images/icon/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196"
          href="../../images/icon/apple-touch-icon-196x196-precomposed.png">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="../../css/style.css"/>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
    <h1>文章标题</h1>
</header>
<div class="article">
    <p style="text-indent:2em">2018年7月5号，江财学子来到和众艾特进行为期一个半月的专业技能培训，在老师的耐心细致的指导下，我们小组3人开发此电商app，其中还有些瑕疵有待解决和指正。</p><br>
    小组成员：魏德旺、刘煌明、肖欢<br>
    <img src="upload/myheadimg.jpg" style="width:100px;height: 100px;float: left;margin-left: 10px;"/>
    <img src="upload/Lhm.jpeg" style="width:100px;height: 100px;float: left;margin-left: 10px;"/>
    <img src="upload/xiaohuan.jpg" style="width:100px;height: 100px;float: left;margin-left: 10px;"/>
    <p style="clear: both;text-indent:2em">此APP实现了网上购物的大部分功能，与微信公众号有一定的对接</p>
</div>
</body>
</html>
