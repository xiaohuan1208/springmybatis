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
    <title>作品列表-合众饰品专卖</title>
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
        $(document).ready(function () {
            $(".des_icon").click(function () {
                $(this).toggleClass("asc_icon");
            });
            $(".drop_icon").click(function () {
                $(".drop_list").toggle();
                $(".drop_list li a").click(function () {
                    $(this).parents(".drop_list").hide();
                });
            });
            //飞入动画，具体根据实际情况调整
            $(".addToCart").click(function () {
                $(".hoverCart a").html(parseInt($(".hoverCart a").html()) + 1);
                /*测试+1*/
                var shopOffset = $(".hoverCart").offset();
                var cloneDiv = $(this).parent().siblings(".goodsPic").clone();
                var proOffset = $(this).parent().siblings(".goodsPic").offset();
                cloneDiv.css({"position": "absolute", "top": proOffset.top, "left": proOffset.left});
                $(this).parent().siblings(".goodsPic").parent().append(cloneDiv);
                cloneDiv.animate({
                    width: 0,
                    height: 0,
                    left: shopOffset.left,
                    top: shopOffset.top,
                    opacity: 1
                }, "slow");
            });
        });
    </script>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>我的作品</h1>
</header>
<!--asc->1[升序asc_icon];des->0[降序des_icon]-->
<ul class="sift_nav">
    <li><a class="des_icon">价格</a></li>
    <li><a class="des_icon">销量优先</a></li>
    <li>
        <a class="nav_li drop_icon">筛选项目</a>
        <ul class="drop_list">
            <li><a>自定义</a></li>
            <li><a>自定义</a></li>
            <li><a>自定义</a></li>
            <li><a>自定义</a></li>
        </ul>
    </li>
</ul>
<!--productList-->
<section class="productList">
    <ul>
        <li>
            <a href="product" class="goodsPic">
                <img src="goods001.jpg"/>
            </a>

            <div class="goodsInfor">
                <h2>
                    <a href="product">水晶骷髅头 工艺品</a>
                </h2>

                <p>
                    <del>5.90</del>
                </p>
                <p>
                    <strong class="price">3.90</strong>
                </p>
                <a class="addToCart">&#126;</a>
            </div>
        </li>
        <li>
            <a href="product" class="goodsPic">
                <img src="goods002.jpg"/>
            </a>

            <div class="goodsInfor">
                <h2>
                    <a href="product">时尚烟灰缸 玻璃制品</a>
                </h2>

                <p>
                    <del>12.90</del>
                </p>
                <p>
                    <strong class="price">8.90</strong>
                </p>
                <a class="addToCart">&#126;</a>
            </div>
        </li>
        <li>
            <a href="product" class="goodsPic">
                <img src="goods003.jpg"/>
            </a>

            <div class="goodsInfor">
                <h2>
                    <a href="product">花杯 带底座</a>
                </h2>

                <p>
                    <del>9.90</del>
                </p>
                <p>
                    <strong class="price">6.90</strong>
                </p>
                <a class="addToCart">&#126;</a>
            </div>
        </li>
        <li>
            <a href="product" class="goodsPic">
                <img src=""/>
            </a>

            <div class="goodsInfor">
                <h2>
                    <a href="product">新婚天鹅 玻璃工艺品</a>
                </h2>

                <p>
                    <del>9.90</del>
                </p>
                <p>
                    <strong class="price">6.90</strong>
                </p>
                <a class="addToCart">&#126;</a>
            </div>
        </li>
        <li>
            <a href="product" class="goodsPic">
                <img src="goods004.jpg"/>
            </a>

            <div class="goodsInfor">
                <h2>
                    <a href="product">招财貔貅</a>
                </h2>

                <p>
                    <del>9.90</del>
                </p>
                <p>
                    <strong class="price">6.90</strong>
                </p>
                <a class="addToCart">&#126;</a>
            </div>
        </li>
    </ul>
    <a class="more_btn">加载更多</a>
</section>
<!--floatCart-->
<div class="hoverCart">
    <a href="cart">0</a>
</div>
</body>
</html>
