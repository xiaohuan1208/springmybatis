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
    <title>搜索-合众饰品专卖</title>
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
            $(".searchHistory dd:last a").click(function () {
                var clear = confirm("确定清除搜索记录吗?");
                if (clear == true) {
                    $(this).parents(".searchHistory").find("dd").remove();
                    clearSearchHistory();
                }
            });
        });
        function clearSearchHistory(){
            $.post("searchTable/deleteSearch", function (e) {
                alert(e.message);
            })
        }
    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>搜索</h1>
</header>
<aside class="searchArea">
    <input type="text" placeholder="查找玻璃品..." id="content"/>
    <input type="button" value="&#63;" class="searchBtn" id="findBtn"/>
</aside>
<dl class="searchHistory">
    <dt>历史搜索</dt>
    <dd>
        <ul id="searchHistory">
            <c:forEach items="${searchList}" var="item">
                <li><a>${item.content}</a></li>
            </c:forEach>
        </ul>
    </dd>
    <dd>
        <a>清空历史记录</a>
    </dd>
</dl>
<dl class="tab_proList">
    <dd>
        <li id="goods-template" hidden="hidden">
            <div class="productArea">
                <a href="product" class="goodsPic">
                    <img src="goods001.jpg"/>
                </a>
                <div class="goodsInfor">
                    <h2>
                        <a class="name" href="product">水晶骷髅头 截取字符串...</a>
                    </h2>
                    <p>
                        <del>5.90</del>
                    </p>
                    <p>
                        <strong class="price">3.90</strong>
                    </p>
                    <a class="addToCart">&#126;</a>
                </div>
            </div>
            <aside>
                <a class="like_icon">580</a>
                <a class="comment_icon">260</a>
                <a class="deal_icon">355</a>
            </aside>
        </li>
        <ul id="ul_proList">

        </ul>
    </dd>
</dl>
<script type="text/javascript">
    $("#findBtn").click(function () {
        //将之前的搜索内容置空
        $("#ul_proList").empty();
        var searchContent = $("#content").val();
        if(searchContent==""){
            alert("请输入搜索内容");
        }else{
            //将搜索内容添加到搜索记录表中
            addSearch(searchContent);
            //通过搜索内容从后台获取相应的商品信息
            findGoods(searchContent);
        }
    });
    $("#searchHistory li").click(function(){
        var searchContent = $(this).children("a").html();
        //通过搜索内容从后台获取相应的商品信息
        findGoods(searchContent);
    });
    function addSearch(searchContent){
        $.post("searchTable/addSearch_"+searchContent, function (e) {
            //测试用
            //alert(e.message);
        });
    }
    function findGoods(searchContent){
        $.post("goods/search_" + searchContent, function (data) {
            $(".searchHistory").hide();
            $("#content").val("");
            if(data.length != 0){
                //将数据放到界面显示
                showGoodsList(data);
            }else{
                var searchResult = "<p>暂时无法获取与<a>"+searchContent+"</a>相关的商品</p>";
                $("#ul_proList").append(searchResult);
            }
        });
    }
    //刷新商品信息界面
    function showGoodsList(data){
        var list = $(".tab_proList ul");
        list.html("");
        $.each(data,function(index,item){
            console.log(item.img);
            var template = $("#goods-template").clone();
            template.removeAttr("hidden");
            template.find(".goodsPic").attr("href","product?goodsId="+item.goodsid);
            template.find(".goodsPic img").attr("src",item.img);
            template.find(".goodsInfor .name").attr("href","product?goodsId="+item.goodsid);
            template.find(".goodsInfor .name").html(item.goodsname);
            template.find(".goodsInfor del").html(item.originalprice/100.0);
            template.find(".goodsInfor strong").html(item.sellingprice/100.0);
            template.find("aside .like_icon").html(item.likenumber);
            template.find("aside .comment_icon").html(item.commentnum);
            template.find("aside .deal_icon").html(item.transactionnum);
            list.append(template);
        });
    }
</script>
</body>
</html>
