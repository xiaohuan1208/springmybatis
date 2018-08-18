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
            show();
        });
        function show(){
            //获取用户session
            $.get("user/information",function(data){
                //获取商品数据
                $.get("goods/usergoods?nickname="+data.nickname,function(data){
                    showGoodsList(data);
                })
            });
        }
        //刷新商品信息界面
        function showGoodsList(data){
            var list = $(".productList ul");
            $.each(data,function(index,item){
                var template = $("#template").clone();
                template.removeAttr("hidden");
                template.find(".goodsPic").attr("href","product?goodsId="+item.goodsid);
                if(item.img != null){
                    template.find(".goodsPic img").attr("src","../../upload/"+item.img);
                }
                template.find(".goodsInfor .name").attr("href","product?goodsId="+item.goodsid);
                template.find(".goodsInfor .name").html(item.goodsname);
                template.find(".goodsInfor del").html(item.originalprice/100.00);
                template.find(".goodsInfor strong").html(item.sellingprice/100.00);
                list.append(template);
            });
        }
    </script>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>我的作品</h1>
</header>

<li id="template" hidden="hidden">
    <a href="product" class="goodsPic">
        <img src="upload/goods001.jpg"/>
    </a>

    <div class="goodsInfor">
        <h2>
            <a class="name" href="product">水晶骷髅头 工艺品</a>
        </h2>

        <p>
            <del>5.90</del>
        </p>
        <p>
            <strong class="price">3.90</strong>
        </p>
    </div>
</li>
<!--productList-->
<section class="productList">
    <ul>

    </ul>
    <a class="more_btn">加载更多</a>
</section>
</body>
</html>