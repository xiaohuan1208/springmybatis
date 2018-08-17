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
    <title>订单列表-合众饰品专卖</title>
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

    <h1>订单列表</h1>
</header>
<!--异步处理，此处不做TAB形式,注意当前状态样式currStyle-->
<aside class="orderSift">
    <a class="currStyle">待付款</a>
    <a>待发货</a>
    <a>已完成</a>
</aside>
<!--订单列表-->
<ul class="orderList" id="orderList"></ul>
<!--订单循环li-->
<li id="template" hidden="hidden">
    <dl>
        <dt>
            <span>订单：201512130108</span>
            <span>待付款</span>
        </dt>
        <!--订单产品循环dd-->
        <dd class="goodsInfo">
            <h2>优质牛肉5kg散装</h2>
            <strong>
                <em>0.00</em>
                <span>1</span>
            </strong>
        </dd>
        <dd id="detail">
            <span>商品数量：<b>2</b></span>
            <span>实付：<b>0.00</b></span>
        </dd>
        <dd id="subBtn">
            <a class="order_delBtn">删除订单</a>
            <a class="order_payBtn">付款</a>
        </dd>
    </dl>
</li>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro" style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>
<script type="text/javascript">
    $(function () {
        getNoPayData();
    })
    //获取未支付订单信息
    function getNoPayData(){
        $.post("user/nopay",{"orderState":"0"},function(data){
            if(data.length!=0){
                var dataform = "noPayOrder";
                showOrders(data,dataform);
            }else{
                var list = $(".orderList");
                list.html("");
                list.append("<p style='text-align: center;margin-top: 50px;'>暂无订单</p>");
            }
        })
    }
    //获取已支付代发货订单信息
    function getIsPayData(){
        $.post("user/ispay",{"orderState":"1"},function(data){
            if(data.length!=0){
                var dataform = "isPayOrder";
                showOrders(data,dataform);
            }else{
                var list = $(".orderList");
                list.html("");
                list.append("<p style='text-align: center;margin-top: 50px;'>暂无订单</p>");
            }
        })
    }
    //获取已支付订单信息
    function getCompleteData(){
        $.post("user/completeorder",{"orderState":"2"},function(data){
            if(data.length!=0){
                var dataform = "completeorder";
                showOrders(data,dataform);
            }else{
                var list = $(".orderList");
                list.html("");
                list.append("<p style='text-align: center;margin-top: 50px;'>暂无订单</p>");
            }
        })
    }
    //显示订单信息
    function showOrders(data,datafrom){
        var list = $(".orderList");
        list.html("");
        $.each(data,function(index,item){
            var count = 0;
            var template = $("#template").clone();
            template.removeAttr("hidden");
            template.find("dl dt").children("span:first").html("订单："+item.orderid);
            var elem = $(".goodsInfo").clone();
            template.find(".goodsInfo").remove();
            var str = "";
            $.each(item.orderDetailMap.orderdetails,function(i,value){
                elem.find("h2").html(value.goodsname);
                elem.find("strong em").html(value.price);
                elem.find("strong span").html(value.amount);
                elem.attr("id",i);
                count += value.amount;
                str += elem.prop("outerHTML");
            });
            var doms = $.parseHTML(str);
            template.find("dl dt").after(doms);
            template.find("#detail").children("span:first").children("b").html(count);
            template.find("#detail").children("span:last").children("b").html(item.totalprice);
            template.find("#subBtn a:last").attr("onclick","goPay("+item.orderid+","+item.totalprice+")");
            template.find("#subBtn a:first").attr("onclick","deleteOrder("+item.orderid+")");
            if(datafrom=="isPayOrder"){
                //数据来源是已支付订单
                template.find("dl dt").children("span:last").html("待发货");
                template.find("#subBtn").attr("hidden","hidden");
            }else if(datafrom=="completeOrder"){
                //数据来源是已完成订单
                template.find("dl dt").children("span:last").html("已完成");
                template.find("#subBtn").attr("hidden","hidden");
            }else{
                template.find("dl dt").children("span:last").html("待付款");
            }
            list.append(template);
        });
    }
    function goPay(orderId,totalprice){
        location.href="confirm_order?totalprice="+totalprice+"&orderid="+orderId;
    }
    function deleteOrder(orderId){
        $.post("user/deleteorder",{"orderid":orderId},function(e){
            prompt(e.message);
            getNoPayData();
        })
    }
    //顶部切换
    $(".orderSift a").click(function(){
        $(".orderSift a").eq($(this).index()).attr("class","currStyle").siblings().removeAttr("class");
        if($(this).index()==0){
            getNoPayData();
        }else if($(this).index()==1){
            getIsPayData();
        }else{
            getCompleteData();
        }
    })

    //弹框显示，自动消失
    function prompt(text) {
        $('#pro p').html(text);
        $('#pro').show().delay(2000).fadeOut();
    }
</script>
</body>
</html>
