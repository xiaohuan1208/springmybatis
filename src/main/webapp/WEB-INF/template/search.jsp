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
                }
            });
        });
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
        <ul>
            <li><a href="category.jsp">骷髅头</a></li>
            <li><a href="category.jsp">天鹅</a></li>
            <li><a href="category.jsp">玻璃工艺品</a></li>
            <li><a href="category.jsp">玻璃球</a></li>
        </ul>
    </dd>
    <dd>
        <a>清空历史记录</a>
    </dd>
</dl>
<dl class="tab_proList">
    <dd>
        <ul id="ul_proList"></ul>
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
            $.post("goods/search_" + searchContent, function (data) {
                $(".searchHistory").hide();
                $("#content").val("");
                if(data.length != 0){
                    $.each(data, function (n, goods) {
                        var searchResult = "<li>" +
                                "<div class='productArea' >" +
                                "<a href='product' class='goodsPic'>" +
                                "<img src='../../upload/"+goods.img+"'/>" +
                                "</a>" +
                                "<div class='goodsInfor'>" +
                                "<h2><a href='product'>"+goods.goodsname+"</a></h2>" +
                                "<p><del>"+(goods.originalprice/100.0)+"</del></p>" +
                                "<p><strong class='price'>"+(goods.sellingprice/100.0)+"</strong></p>" +
                                "<a class='addToCart'>&#126;</a>" +
                                "</div>" +
                                "<aside>" +
                                "<a class='like_icon'>"+goods.likenumber+"</a>" +
                                "<a class='comment_icon'>"+goods.commentnum+"</a>" +
                                "<a class='deal_icon'>"+goods.transactionnum+"</a>" +
                                "</aside>" +
                                "</div>" +
                                "</li>";
                        $("#ul_proList").append(searchResult);
                    });
                }else{
                    var searchResult = "<p>暂时无法获取与<a>"+searchContent+"</a>相关的商品</p>";
                    $("#ul_proList").append(searchResult);
                }
            });
        }
    });
</script>
</body>
</html>
