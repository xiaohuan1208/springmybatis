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
    <title>分类列表-合众饰品专卖</title>
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
    <script src="../../js/swiper.min.js"></script>
    <script>
        var curr_page = 1;
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
            var mySwiper = new Swiper('.swiper-container', {
                slidesPerView: 5,
                slidesPerGroup: 5
            });
            showCategory_list();

        });
        //展示分类列表
        function showCategory_list(){
            var list = $(".swiper-wrapper");
            list.html("");
            $.get("type/getTypeList",function(data){
                $.each(data, function (index, item) {
                    var slide = $("#slide").clone();
                    slide.removeAttr("hidden");
                    slide.removeAttr("id");
                    if(index == 0){
                        slide.find("a").attr("class","curr_link");
                        slide.find("a").attr("tittle",item.typeid);
                        slide.find("a").html(item.typename);
                    }else{
                        slide.find("a").attr("tittle",item.typeid);
                        slide.find("a").html(item.typename);
                    }
                    list.append(slide);
                })
                var swiper = new Swiper('.swiper-container', {
                    slidesPerView : 5
                });
                showGoods(curr_page);
            })
        }
        function showGoods(curr_page){
            var typeid = $(".curr_link").attr("tittle");
            var list = $(".productList ul");
            list.html("");
            console.log($(".curr_link").prop("outerHTML"));
            console.log(typeid);
            $.get("goods/getByType",{pageNo:curr_page,pageSize:5,typeId:typeid},function(data){
                $.each(data, function (index, item) {
                    var slide = $("#product").clone();
                    slide.removeAttr("hidden");
                    slide.removeAttr("id");
                    if(item.img != null){
                        slide.find(".goodsPic img").attr("src","../../upload/"+item.img);
                    }
                    slide.find(".goodsPic").attr("href","product?goodsId="+item.goodsid);
                    slide.find(".goodsInfor .name").attr("href","product?goodsId="+item.goodsid);
                    slide.find(".goodsInfor .name").html(item.goodsname);
                    slide.find(".goodsInfor del").html(item.originalprice/100.00);
                    slide.find(".goodsInfor strong").html(item.sellingprice/100.00);
                    slide.find(".addToCart").attr("onclick","pushCart("+item.goodsid+",this)");
                    list.append(slide);
                })
            })
        }
        function pushCart(goodsid,obj){
            var cart = {}
            cart.goodsId = goodsid;
            cart.number = 1;

            $.get("user/pushcart",cart,function(result){
                animation(obj);
                if(result.code>0){
                    $.get("user/cart",function(data){

                        $(".hoverCart a").html(Object.keys(data).length);
                    });
                }
            });
        }
        //飞入特效
        function animation(obj){
            obj=$(obj);
            // $(".hoverCart a").html(parseInt($(".hoverCart a").html())+1);测试+1
            var shopOffset = $(".hoverCart").offset();
            var cloneDiv = obj.parent().siblings(".goodsPic").clone();
            var proOffset = obj.parent().siblings(".goodsPic").offset();
            console.log(proOffset);
            cloneDiv.css({ "position": "absolute", "top": proOffset.top, "left": proOffset.left });
            obj.parent().siblings(".goodsPic").parent().append(cloneDiv);
            cloneDiv.animate({
                width:0,
                height:0,
                left: shopOffset.left,
                top: shopOffset.top,
                opacity:1
            },"slow",function(){
                $(this).remove();
            });
        }
        function moreGoods(){
            curr_page +=1;
            var typeid = $(".curr_link").attr("tittle");
            var list = $(".productList ul");
            $.get("goods/getByType",{pageNo:curr_page,pageSize:5,typeId:typeid},function(data){
                if(data.length==0){
                    $(".more_btn").html("没有更多数据");
                    curr_page -=1;
                }else{
                    $.each(data, function (index, item) {
                        var slide = $("#product").clone();
                        slide.removeAttr("hidden");
                        slide.removeAttr("id");
                        if(item.img != null){
                            slide.find(".goodsPic img").attr("src","../../upload/"+item.img);
                        }
                        slide.find(".goodsPic").attr("href","product?goodsId="+item.goodsid);
                        slide.find(".goodsInfor .name").attr("href","product?goodsId="+item.goodsid);
                        slide.find(".goodsInfor .name").html(item.goodsname);
                        slide.find(".goodsInfor del").html(item.originalprice/100.00);
                        slide.find(".goodsInfor strong").html(item.sellingprice/100.00);
                        slide.find(".addToCart").attr("onclick","pushCart("+item.goodsid+",this)");
                        list.append(slide);
                    })
                }
            })
        }
        function curr_type(e){
            $(".curr_link").removeAttr("class");
            $(e).attr("class","curr_link");
            curr_page = 1;
            showGoods(curr_page);
            $(".more_btn").html("加载更多");
        }
    </script>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>分类列表</h1>
</header>
<!-- category Swiper -->
<div class="swiper-container category_list">
    <ul class="swiper-wrapper">

    </ul>
    <li class="swiper-slide" id="slide"  hidden="hidden"><a onclick="curr_type(this)">当前分类</a></li>
    <!-- Add Pagination -->
    <div class="swiper-pagination"></div>
</div>
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
    <ul></ul>
    <li id="product" hidden="hidden">
        <a href="product" class="goodsPic">
            <img src="../../upload/goods001.jpg"/>
        </a>
        <div class="goodsInfor">
            <h2>
                <a href="product" class="name">水晶骷髅头 工艺品</a>
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
    <a class="more_btn" onclick="moreGoods()">加载更多</a>
</section>
<!--floatCart-->
<div class="hoverCart">
    <a href="cart">0</a>
</div>
</body>
</html>
