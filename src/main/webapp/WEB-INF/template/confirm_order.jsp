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
    <title>确认订单-合众饰品专卖</title>
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
    <link rel="stylesheet" type="text/css" href="../../css/jquery-confirm.css">
    <script src="../../js/jquery.js"></script>
    <script src="../../js/jquery-confirm.js"></script>
    <script>
        $(document).ready(function () {
            //payment style
            $(".payment dd label input[type='radio']").click(function () {
                $(this).parent().addClass("isTrue");
                $(this).parent().siblings().removeClass("isTrue");
            });
            //测试流程效果，程序对接可将其删除！
            $(".btmNav a:last").click(function () {
                //alert("点击提交订单后跳转支付接口，再返回支付状态！");
                //判断是否选择支付方式
                var bFlag = false;
                var payway = document.getElementsByName('pay');
                for (var i = 0; i < payway.length; i++) {
                    if (payway[i].checked) {
                        bFlag = true;
                        break;
                    }
                }
                if (bFlag == false) {
                    prompt("请选择支付方式");
                }else{
                    //location.href = "return_state";
                    $.confirm({
                        title: '确认',
                        content: '确认现在付款吗?',
                        type: 'orange',
                        icon: 'glyphicon glyphicon-question-sign',
                        buttons: {
                            ok: {
                                text: '确认',
                                btnClass: 'btn-primary',
                                action: function() {
                                    var orderInfo =  getTotalPrice();
                                    var orderremarks = $(".order_msg textarea").val();
                                    var address = $(".confirmAddr address").text();
                                    orderInfo.orderremarks = orderremarks;
                                    orderInfo.address = address;
                                    payOrder(orderInfo);
                                }
                            },
                            cancel: {
                                text: '取消',
                                btnClass: 'btn-primary'
                            }
                        }
                    });
                }
            });
            //支付订单
            function payOrder(data){
                $.ajax({
                    url: "user/payorder",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (e) {
                        prompt(e.message);
                        var orderInfo = getTotalPrice();
                        var orderId = orderInfo.orderid;
                        var totalPrice = orderInfo.totalPrice;
                        location.href = "return_state?orderId="+orderId+"&totalPrice="+totalPrice;
                    }
                });
            }

        });
        //弹框显示，自动消失
        function prompt(text) {
            $('#pro p').html(text);
            $('#pro').show().delay(2000).fadeOut();
        }

    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>确认订单</h1>
</header>
<aside class="confirmAddr">
    <p>
        <span>收货人：HZIT</span>
        <span>1830927**73</span>
    </p>
    <address>陕西省深圳市雁塔区昆明路220号</address>
    <a href="address" class="iconfont">&#60;</a>
</aside>
<dl class="payment">
    <dt>选择支付方式</dt>
    <dd>
        <label><input type="radio" name="pay"/>支付宝支付</label>
        <label><input type="radio" name="pay"/>微信支付</label>
    </dd>
</dl>
<section class="order_msg">
    <h2>我要留言</h2>
    <textarea placeholder="选填(亲可以在这里添加想说的话)"></textarea>
</section>
<!--bottom nav-->
<div style="height:1rem;"></div>
<aside class="btmNav">
    <ul>
        <li><a>合计：￥0.00</a></li>
        <li><a>立即付款</a></li>
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
    $(function(){
        $.get("getDefaultAddress",function(data){
            $(".confirmAddr").find("p span:first").html("收货人："+data.consignee);
            var tel = data.telphone;
            var reg = /1(\d{2})\d{4}(\d{4})/g;
            tel = tel.replace(reg,"1$1****$2");
            $(".confirmAddr").find("p span:last").html(tel);
            $(".confirmAddr").find("address").html(data.province+data.city+data.district+data.detail);
            $(".btmNav a:first").text("合计：￥"+getTotalPrice().totalPrice);
        })
    })
    //获取总金额
    function getTotalPrice(){
        var href = window.document.location.href;
        var param = href.split("?")[1];
        var totalPrice = param.split("&")[0].split("=")[1];
        var orderId = param.split("&")[1].split("=")[1];
        var orderInfo = {
            "totalPrice":totalPrice,
            "orderid":orderId
        };
        return orderInfo;
    }
</script>
