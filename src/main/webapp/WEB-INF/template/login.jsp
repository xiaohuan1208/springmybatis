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
    <title>登录-合众饰品专卖</title>
    <meta name="keywords" content="KEYWORDS..."/>
    <meta name="description" content="DESCRIPTION..."/>
    <meta name="author" content="HZIT"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="icon" href="images/icon/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" sizes="57x57" href="images/icon/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="120x120"
          href="images/icon/apple-touch-icon-120x120-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="196x196"
          href="images/icon/apple-touch-icon-196x196-precomposed.png">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <style>
        .btnStyle {
            width: 100%;
            height: .85rem;
            background: #f5cf9a;
            border: none;
            font-size: .32rem;
            color: white;
            border-radius: 2px;
        }
    </style>
    <script src="js/jquery.js"></script>
    <script>
        /*$(document).ready(function(){
         $(".formarea li:last input[type='button']").click(function(){
         alert("测试跳转效果，程序对接予以删除!");
         location.href="index.jsp";
         });
         });*/
    </script>
</head>
<body>
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>登录</h1>
</header>
<form id="login-form">
    <ul class="formarea">
        <li>
            <label class="lit">账号：</label>
            <input type="text" placeholder="手机号码" name="telphone" id="telphone" class="textbox"/>
        </li>
        <li>
            <label class="lit">密码：</label>
            <input type="password" placeholder="登陆密码" name="password" id="password" class="textbox"/>
        </li>
        <li class="liLink">
            <a href="register" class="fl">新用户注册</a>
            <a href="find_pwd" class="fr">忘记密码?</a>
        </li>
        <li>
            <input type="button" value="立即登录" id="login-input" class="btnStyle"/>
        </li>
    </ul>
</form>
<mark></mark>
<!--fixedNav:footer-->
<div style="height:1.2rem;"></div>
<nav>
    <a href="index" class="homeIcon">首页</a>
    <a href="category" class="categoryIcon">分类</a>
    <a href="cart" class="cartIcon">购物车</a>
    <a href="user" class="userIcon">我的</a>
</nav>
</body>
</html>
<script>


    $.ready(
            function () {

            }
    )


    //登录
    $("#login-input").on("click", function () {
        var reg = /^1[3|4|5|7|8][0-9]{9}$/;
        var user = {}
        user.telphone = $("#telphone").val();
        user.password = $("#password").val();
        var flag = reg.test(user.telphone);
        if(flag){
            //ajax方式提交表单
            $.post("user/login", user, function (result) {
                if (result.code == 1) {
                    location.href = "index";
                } else {
                    $("mark").html(result.message);
                }
            });
        }else{
            $("mark").html("请输入正确的手机号码！");
        }


    });

</script>