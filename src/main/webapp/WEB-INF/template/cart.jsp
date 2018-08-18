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
    <title>购物车-合众饰品专卖</title>
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

    <h1>购物车</h1>
</header>
<dd id="template" hidden="hidden">
    <input type="checkbox" class="onecheck"/>
    <a href="product" class="goodsPic"><img src="goods004.jpg"/></a>

    <div class="goodsInfor">
        <h2>
            <a id="name" href="product">聚财貔貅风水摆件</a>
            <span id="number">1</span>
        </h2>

        <div class="priceArea">
            <strong>0.00</strong>
            <del>0.00</del>
        </div>
        <div class="numberWidget">
            <input type="button" value="-" class="minus"/>
            <input type="text" value="1" disabled class="number"/>
            <input type="button" value="+" class="plus"/>
        </div>
    </div>
    <a class="delBtn">删除</a>
</dd>
<%--购物车列表--%>
<dl class="cart">
    <dt>
        <label><input type="checkbox" id="checkAll"/>全选</label>
        <a class="edit">编辑</a>
    </dt>
</dl>
<!--bottom nav-->
<div style="height:1rem;"></div>
<aside class="btmNav">
    <ul>
        <li><a class="cart_icon"><em>0</em></a></li>
        <li><a class="total">合计：￥0.00</a></li>
        <li><a id="subBtn">立即下单</a></li>
    </ul>
</aside>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro"
     style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>
</body>
</html>
<script>
    $(document).ready(function () {
        $.get("user/information", function (data) {nj
            if (data == null || data == "") {
                alert("您尚未登录请先登录！");
                location.href = "login"
            }
        })
        //show or hide:delBtn
        $(".edit").toggle(function () {
            $(this).parent().siblings("dd").find(".delBtn").fadeIn();
            $(this).html("完成");
            $(".numberWidget").show();
            $(".priceArea").hide();
            $('#checkAll').prop('checked', false);
            $(".cart dd .onecheck").prop('checked', false);
            $(".btmNav .cart_icon em").text(0);
            getTotal();
        }, function () {
            $(this).parent().siblings("dd").find(".delBtn").fadeOut();
            $(this).html("编辑");
            $(".numberWidget").hide();
            $(".priceArea").show();
            getCartDOM();//编辑购物车
        });

        //minus
        $(".minus").click(function () {
            var currNum = $(this).siblings(".number");
            if (currNum.val() <= 1) {
            } else {
                currNum.val(parseInt(currNum.val()) - 1);
            }
        });


        //plus
        $(".plus").click(function () {
            var currNum = $(this).siblings(".number");
            currNum.val(parseInt(currNum.val()) + 1);
        });

        //delBtn
        $(".delBtn").click(function () {
            $(this).parent().remove();
            //nullTips();
        });
        //isNull->tips
        function nullTips() {
            if ($(".cart dd").length == 0) {
                var tipsCont = "<mark style='display:block;background:none;text-align:center;color:grey;'>购物车为空！</mark>"
                $(".cart").remove();
                $("body").append(tipsCont);
            }
        }

        //list.find("dd").remove();
        show();

    });

    function show() {
        var list = $(".cart");
        list.find("dd").remove();
        $.get("user/cart", function (data) {
            //循环获取商品详情
            $.each(data, function (index, item) {
                //获取单个商品详情
                $.get("goods/one?goodsId=" + item.goodsId, function (result) {
                    //渲染界面
                    var template = $("#template").clone(true);
                    template.removeAttr("hidden");
                    template.attr("datagoodsid", result.goodsid);
                    template.find(".goodsPic").attr("href", "product?goodId=" + result.goodsid);
                    if (result.img != null) {
                        template.find("img").attr("src", result.img);
                    }
                    template.find(".goodsInfor #name").attr("href","product?goodsId="+result.goodsid);
                    template.find(".goodsInfor #name").html(result.goodsname);
                    template.find(".goodsInfor #number").html(item.number);
                    template.find(".numberWidget .number").val(item.number);
                    template.find(".priceArea strong").html(result.sellingprice / 100.00);
                    template.find(".priceArea del").html(result.originalprice / 100.00);
                    list.append(template);
                });
            })
        })
    }
    function getCartDOM() {
        var Dom = $(".cart dd");
        var cartList = [];
        $.each(Dom, function (index, item) {
            var cart = {}
            cart.goodsId = $(item).attr("datagoodsid");
            var number = $(item).find(".numberWidget .number").val();
            cart.number = number;
            cartList.push(cart);
        });
        $.ajax({
            url: "user/editcart",
            data: JSON.stringify(cartList),
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if (data.code > 0) {
                    show();

                }
            }
        });
    }
    $("#checkAll").click(function () {
        if (this.checked) {
            $(".cart dd .onecheck").prop('checked', true);
            $(".btmNav .cart_icon em").text($(".cart dd  .onecheck:checked").length);
        } else {
            $(".cart dd .onecheck").prop('checked', false);
            $(".btmNav .cart_icon em").text(0);
        }
        getTotal();
    });
    $("#template .onecheck").click(function () {
        var len = $(".cart dd .onecheck").length;
        var checkedLen = $(".cart dd .onecheck:checked").length;
        if (len == checkedLen) {
            $('#checkAll').prop('checked', true);
        } else {
            $('#checkAll').prop('checked', false);
        }
        $(".btmNav .cart_icon em").text($(".cart dd .onecheck:checked").length);
        getTotal();
    })

    function getTotal() {
        var sum = 0.00;
        var goodsList = [];//用来装选中的商品的id
        $(".cart dd  .onecheck").each(function () {
            if (this.checked == true) {
                var goodsId = $(this).parent().attr("datagoodsid");//获取选中的商品的Id
                var goodsName = $(this).parent().find(".goodsInfor #name").text();//获取商品名
                var price = $(this).parent().find(".priceArea strong").text();
                var goods = {
                    "goodsid":goodsId,
                    "goodsname":goodsName,
                    "price":price
                };
                var money = $(this).parent().find('.priceArea strong').text();
                var num = $(this).parent().find('#number').text();
                sum += Number(money) * Number(num);
                goods.totalprice = sum.toFixed(2);
                goodsList.push(goods);
            }
        })
        $(".total").text("合计：￥" + sum.toFixed(2));
        return goodsList;
    }

    $("#subBtn").click(function(){
        //获取所有选中的商品的ID
        var goodsList = getTotal();
        $.ajax({
            url: "user/suborder",
            data: JSON.stringify(goodsList),
            type: "POST",
            dataType: "json",
            contentType: "application/json",
            success: function (e) {
                prompt(e.message);
                var orderId = e.code;
                var totalprice = goodsList[goodsList.length-1].totalprice;
                location.href="confirm_order?totalprice="+totalprice+"&orderid="+orderId;
            }
        });
    })
    //弹框显示，自动消失
    function prompt(text) {
        $('#pro p').html(text);
        $('#pro').show().delay(2000).fadeOut();
    }
</script>