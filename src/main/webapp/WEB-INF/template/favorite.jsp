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
    <title>我喜欢-合众饰品专卖</title>
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
        //定义起始显示页数
        var currentPage = 1;
        var preData = [];
        $(document).ready(function () {
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
            //监听加载更多按钮
            $(".more_btn").click(function () {
                //加载更多评论
                getCollection();
            });
            getCollection();
        });
        //从数据库加载我的收藏商品
        function getCollection() {
            $.post("collection/getCollection", {"page": currentPage}, function (data) {
                if (data != "") {
                    if (preData.length < data.total) {
                        currentPage = currentPage + 1;
                    } else {
                        prompt("已全部加载完毕");
                    }
                    //调用显示商品的方法
                    showGoodsList(data.list);
                } else {
                    prompt("请先登录");
                }
            });
        }
        //刷新商品信息界面
        function showGoodsList(data) {
            pushData(data);
            var list = $(".productList ul");
            list.html("");
            if (preData.length != 0) {
                $.each(preData, function (index, item) {
                    var template = $("#template").clone();
                    template.removeAttr("hidden");
                    template.find(".goodsPic").attr("href", "product?goodsId=" + item.goodsid);
                    if (item.img != null) {
                        template.find(".goodsPic img").attr("src", "../../upload/" + item.img);
                    }
                    template.find(".goodsInfor .name").attr("href", "product?goodsId=" + item.goodsid);
                    template.find(".goodsInfor .name").html(item.goodsname);
                    template.find(".goodsInfor del").html(item.originalprice / 100.0);
                    template.find(".goodsInfor strong").html(item.sellingprice / 100.0);
                    template.find(".addToCart").attr("onclick", "pushCart(" + item.goodsid + ",this)");
                    list.append(template);
                });
                $(".more_btn").html("加载更多");
            } else {
                list.append("<p style='text-align: center;margin-top:30px;'>暂无收藏的商品，快去添加吧</p>");
                $(".more_btn").html("");
            }

        }
        //弹框显示，自动消失
        function prompt(text) {
            $('#pro p').html(text);
            $('#pro').show().delay(2000).fadeOut();
        }
        //将之前的数据于现在查找的数据合起来
        function pushData(data) {
            for (var i = 0; i < data.length; i++) {
                preData.push(data[i]);
            }
        }

        function pushCart(goodsid, obj) {
            var cart = {}
            cart.goodsId = goodsid;
            cart.number = 1;
            $.get("user/pushcart", cart, function (result) {
                if (result.code > 0) {
                    $.get("user/cart", function (data) {
                        animation(obj);
                        $(".hoverCart a").html(Object.keys(data).length);
                    });
                }
            });
        }

        //飞入特效
        function animation(obj) {
            obj = $(obj);
            // $(".hoverCart a").html(parseInt($(".hoverCart a").html())+1);测试+1
            var shopOffset = $(".hoverCart").offset();
            var cloneDiv = obj.parent().siblings(".goodsPic").clone();
            var proOffset = obj.parent().siblings(".goodsPic").offset();
            console.log(proOffset);
            cloneDiv.css({"position": "absolute", "top": proOffset.top, "left": proOffset.left});
            obj.parent().siblings(".goodsPic").parent().append(cloneDiv);
            cloneDiv.animate({
                width: 0,
                height: 0,
                left: shopOffset.left,
                top: shopOffset.top,
                opacity: 1
            }, "slow", function () {
                $(this).remove();
            });
        }
    </script>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>我喜欢</h1>
</header>
<section class="productList">
    <li id="template" hidden="hidden">
        <a href="product" class="goodsPic">
            <img src="../../upload/goods001.jpg"/>
        </a>

        <div class="goodsInfor">
            <h2>
                <a href="product" class="name">新鲜生菜两斤装特惠</a>
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
    <ul></ul>
    <a class="more_btn"></a>
</section>
<!--floatCart-->
<div class="hoverCart">
    <a href="cart">0</a>
</div>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro"
     style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>
</body>
</html>
