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
    <title>搜索-合众饰品专卖</title>
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
    <script>
        /*$(document).ready(function () {
            //测试返回页面，程序对接删除即可
            $(".userForm input[type='button']").click(function () {
                alert("密码修改成功！");
                location.href = "user_set";
            });
        });*/
    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>修改密码</h1>
</header>
<ul class="userForm">
    <li>
        <label class="formName">旧密码：</label>
        <input type="password" required placeholder="旧密码..." name="oldPassword" id="oldPassword"/>
    </li>
    <li>
        <label class="formName">新密码：</label>
        <input type="password" required placeholder="新密码..." name="newPassword" id="newPassword"/>
    </li>
    <li>
        <label class="formName">确认新密码：</label>
        <input type="password" required placeholder="确认新密码..." name="confirmPassword" id="confirmPassword"/>
    </li>
    <li><input type="button" value="确认修改密码" class="formLastBtn"/></li>
</ul>
<mark></mark>
<!--fixedNav:footer-->
<div style="height:1.2rem;"></div>
<nav>
    <a href="page_index" class="homeIcon">首页</a>
    <a href="category" class="categoryIcon">分类</a>
    <a href="cart" class="cartIcon">购物车</a>
    <a href="user" class="userIcon">我的</a>
</nav>
</body>
</html>
<script>
    $(".formLastBtn").on("click", function () {
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();
        if(newPassword!=confirmPassword){
            console.log("两次密码不一致!");
            $("mark").html("两次密码不一致!请重新输入！");
        }else{
            $.ajax({
                type: "POST",
                url: "user/change_pwd",
                data: {oldPassword:oldPassword,newPassword:newPassword},
                dataType: "json",
                success: function (result) {
                    if (result.code == 1) {
                        setInterval(go, 1000);
                        var x = 3;
                        function go() {
                            x--;
                            if (x > 0) {
                                $("mark").html(result.message + x + "秒后跳转回设置页面");
                            } else {
                                location.href = 'user_set';
                            }
                        }
                    } else {
                        $("mark").html(result.message);
                    }
                }
            });
        }
    })
</script>
