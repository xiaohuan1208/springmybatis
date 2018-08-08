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
    <title>修改-合众饰品专卖</title>
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
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>手机号码</h1>
</header>
<ul class="userForm">
    <li><input type="text" value="18309****73" placeholder="修改手机号码" id="telPhone"/></li>
    <li><input type="button" value="更新保存" class="formLastBtn"/></li>
</ul>
<mark></mark>
</body>
</html>
<script>
    $(document).ready(function () {
        $.get("user/information", function (data) {
            var telPhone = data.telphone;
            var reg = /1(\d{2})\d{4}(\d{4})/g;
            telPhone = telPhone.replace(reg,"1$1****$2");
            $("#telPhone").val(telPhone);
        });
    });
    $(".formLastBtn").on("click", function () {
        var telphone = $("#telPhone").val();
        $.ajax({
            type: "POST",
            url: "user/change_tel",
            data: {telphone:telphone},
            dataType: "json",
            success: function (result) {
                if(result.code==1){
                    setInterval(go, 1000);
                    var x = 3;
                    function go() {
                        x--;
                        if (x > 0) {
                            $("mark").html(result.message + x + "秒后跳转回设置页面");
                        } else {
                            location.href = 'profile';
                        }
                    }
                }else{
                    $("mark").html(result.message);
                }
            }
        })
    })
</script>
