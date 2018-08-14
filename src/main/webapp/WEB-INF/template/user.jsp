<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8"/>
 <base href="<%=basePath %>"/>
<title>个人中心-合众饰品专卖</title>
<meta name="keywords"  content="KEYWORDS..." />
<meta name="description" content="DESCRIPTION..." />
<meta name="author" content="HZIT" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name='apple-touch-fullscreen' content='yes'>
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="address=no">
<link rel="icon" href="../../images/icon/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon-precomposed" sizes="57x57" href="../../images/icon/apple-touch-icon-57x57-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="120x120" href="../../images/icon/apple-touch-icon-120x120-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="196x196" href="../../images/icon/apple-touch-icon-196x196-precomposed.png">
<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
<link rel="stylesheet" type="text/css" href="../../css/style.css" />
<script src="../../js/jquery.js"></script>
</head>
<body>
<!--header-->
<header>
 <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
 <h1>个人中心</h1>
 <a href="user_set" class="iconfont setIcon">&#42;</a>
</header>
<div class="userInfor">
 <a class="userIcon"><img src="../../images/icon/DefaultAvatar.jpg"/></a>
 <h2 id="tel">176029****2</h2>
</div>
<ul class="userList">
 <li><a href="order_list" class="orderListIcon">订单</a></li>
 <li><a href="favorite" class="collectionIcon">喜欢</a></li>
 <li><a href="profile" class="profileIcon">资料</a></li>
</ul>
<div class="user_designs">
 <a href="upload_file">发布作品</a>
 <a href="product_list">我的作品</a>
</div>
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
    $(document).ready(function () {
        $.get("user/information", function (data) {
            $(".userInfor #tel").html(data.telphone);
            if (data.headimg == null || "" == data.headimg) {
                $(".userInfor .userIcon img").attr("src", "../../images/icon/DefaultAvatar.jpg");
            } else {
                $(".userInfor .userIcon img").attr("src", data.headimg);
            }
        });
    });


</script>