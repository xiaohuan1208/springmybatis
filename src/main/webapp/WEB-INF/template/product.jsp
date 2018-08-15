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
    <title>产品详情-合众饰品专卖</title>
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
            var goodsId = getParams();
            $.get("goods/one?goodsId=" + goodsId, function (data) {
                showGoods(data);
            })
        });
        //获取商品并展示
        function showGoods(data) {
            $("header h1").html(data.goodsname);
            $(".pro_bigImg img").attr("src",data.img);
            $(".pro_baseInfor h2").html(data.description);
            $(".pro_baseInfor strong").html(data.sellingprice / 100.00);
            $(".pro_baseInfor del").html(data.originalprice / 100.00);
            $(".pro_infor #create-time").html(data.createtime);
            $(".pro_infor #designer").html(data.designer);
            $("#comment b").html(data.comment);
            $("#sell b").html(data.transactionnum);
            $("#like b").html(data.likenumber);
            $(".pro_infor .more_link").attr("onclick", "comment(" + data.goodsid + ")");
        }
        //获取当前商品id
        function getParams() {
            var href = window.document.location.href;
            var goodsId = href.split("?")[1].split("=")[1];
            return goodsId;
        }
        //跳转至当前商品评论区
        function comment(goodsid) {
            location.href = "comment?goodsId=" + goodsid;
        }
    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>产品详情</h1>
</header>
<div class="pro_bigImg">
    <img src="goods005.jpg"/>
</div>
<!--base information-->
<section class="pro_baseInfor">
    <h2>飞翅琉璃对天鹅新房摆件家居装饰品婚房玻璃工艺品 结婚礼物 </h2>

    <p>
        <strong>88.90</strong>
        <del>129.00</del>
        <a class="add_btn">加入购物车</a>
    </p>
</section>
<!--product infor-->
<div class="pro_infor">
    <ul>
        <li>
            <span>创建时间</span>
            <span><time id="create-time">2018-05-12</time></span>
        </li>
        <li>
            <span>设计者</span>
            <span id="designer">HZIT</span>
        </li>
        <li class="more_link" onClick="location.href='comment'">
            <span>评论</span>
            <span id="comment">共计<b>398</b>人点评</span>
        </li>
        <li>
            <span>成交</span>
            <span id="sell">共计<b>632</b>笔</span>
        </li>
        <li>
            <span>点赞</span>
            <span id="like">共计<b>432</b>人</span>
        </li>
    </ul>
</div>
<!--bottom nav-->
<div style="height:1rem;"></div>
<aside class="btmNav">
    <ul>
        <li><a class="cart_icon"><em>0</em></a></li>
        <li><a>合计：￥0.00</a></li>
        <li><a href="cart">立即下单</a></li>
    </ul>
</aside>
</body>
</html>
