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
    <title>个人资料-合众饰品专卖</title>
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
    <script src="../../js/jquery.js"></script>
</head>
<body>
<!--header-->
<header>
    <a href="user" class="iconfont backIcon">&#60;</a>

    <h1>个人资料</h1>
</header>
<ul class="inforList">
    <li>
        <a href="change_name" class="isNext">
            <span>用户昵称</span>
            <span id="nickName">未设置</span>
        </a>
    </li>
    <li>
        <a href="change_tel" class="isNext">
            <span>手机号码</span>
            <span id="telPhone">18309****73</span>
        </a>
    </li>
</ul>
</body>
</html>
<script>
    $(document).ready(function () {
        $.get("user/information", function (data) {
            var telPhone = data.telphone;
            var reg = /1(\d{2})\d{4}(\d{4})/g;
            telPhone = telPhone.replace(reg,"1$1****$2");
            $("#telPhone").html(telPhone);
            if (data.nickname == null || data.nickname == "") {
                $("#nickName").html("未设置");
            } else {
                $("#nickName").html(data.nickname);
            }
        });
    });
</script>
