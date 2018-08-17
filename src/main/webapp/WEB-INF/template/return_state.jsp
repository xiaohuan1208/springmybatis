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
    <title>订单状态返回-合众饰品专卖</title>
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
    <script type="text/javascript" src="../../js/jquery.js"></script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>订单状态</h1>
</header>
<section class="return_state">
    <!--订单状态图标：0为成功；1为失败-->
    <h2 class="state_0">订单提交成功！</h2>

    <p>订单编号：201512121140</p>

    <p>订单金额：<strong>0.00</strong></p>

    <p>支付时间：
        <time>2015-12-12 11:41:38</time>
    </p>
    <p>
        <a href="order_list">查看订单</a>
        <a href="page_index">返回首页</a>
    </p>
</section>
<script type="text/javascript">
    $(function () {
        getData();
    })
    function getData(){
        var href = window.document.location.href;
        var param = href.split("?")[1];
        var totalPrice = param.split("&")[0].split("=")[1];
        var orderId = param.split("&")[1].split("=")[1];
        $(".return_state p").eq(0).html("订单编号："+orderId);
        $(".return_state p").eq(1).children("strong").html(totalPrice);
        $(".return_state p").eq(2).children("time").html(getCurrDate());
        console.log(totalPrice);
        console.log(orderId);
        console.log(getCurrDate());
    }
    //获取当前时间
    function getCurrDate(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        var s=myDate.getSeconds();
        return (year+'-'+p(month)+"-"+p(date)+" "+p(h)+':'+p(m)+":"+p(s));
    }
    function p(s) {
        return s < 10 ? '0' + s: s;
    }
</script>
</body>
</html>
