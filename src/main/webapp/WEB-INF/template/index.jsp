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
  <title>合众饰品专卖</title>
  <meta name="keywords"  content="KEYWORDS..." />
  <meta name="description" content="DESCRIPTION..." />
  <meta name="author" content="HZIT" />
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name='apple-touch-fullscreen' content='yes'>
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="format-detection" content="telephone=no">
  <meta name="format-detection" content="address=no">
  <link rel="icon" href="../../images/icon/favicon.ico" type="image/x-icon">
  <link rel="apple-touch-icon-precomposed" sizes="57x57" href="../../images/icon/apple-touch-icon-57x57-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="120x120" href="../../images/icon/apple-touch-icon-120x120-precomposed.png">
  <link rel="apple-touch-icon-precomposed" sizes="196x196" href="../../images/icon/apple-touch-icon-196x196-precomposed.png">
  <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
  <link rel="stylesheet" type="text/css" href="../../css/style.css" />
  <script src="../../js/jquery.js"></script>
  <script src="../../js/swiper.min.js"></script>
  <script>
    $(document).ready(function(){
      var mySwiper = new Swiper('.slide',{
        autoplay:5000,
        visibilityFullFit : true,
        loop:true,
        pagination : '.pagination',
      });
      //飞入动画，具体根据实际情况调整
      $(".addToCart").click(function(){
        $(".hoverCart a").html(parseInt($(".hoverCart a").html())+1);/*测试+1*/
        var shopOffset = $(".hoverCart").offset();
        var cloneDiv = $(this).parent().siblings(".goodsPic").clone();
        var proOffset = $(this).parent().siblings(".goodsPic").offset();
        cloneDiv.css({ "position": "absolute", "top": proOffset.top, "left": proOffset.left });
        $(this).parent().siblings(".goodsPic").parent().append(cloneDiv);
        cloneDiv.animate({
          width:0,
          height:0,
          left: shopOffset.left,
          top: shopOffset.top,
          opacity:1
        },"slow");
      });
    });
  </script>
</head>
<body>
<!--header-->
<header>
  <a href="location" class="location">深圳市</a>
  <h1>合众饰品专卖</h1>
  <a href="search" class="rt_searchIcon">&#37;</a>
</header>
<!--slide-->
<div class="slide">
  <div class="swiper-wrapper">
      <%--循环顶部图片--%>
      <c:forEach items="${list}" var="b">
    <div class="swiper-slide">
      <a href="#">
        <img src="upload/${b.brandPic}"/>
      </a>
    </div>
      </c:forEach>

  </div>
  <div class="pagination"></div>
</div>
<!--Tab:productList-->
<dl class="tab_proList">
  <dd>
    <ul>
      <li>
        <div class="productArea">
          <a href="product" class="goodsPic">
            <img src="../../upload/goods001.jpg"/>
          </a>
          <div class="goodsInfor">
            <h2>
              <a href="product">水晶骷髅头 截取字符串...</a>
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
      <li>
        <div class="productArea">
          <a href="product" class="goodsPic">
            <img src="../../upload/goods002.jpg"/>
          </a>
          <div class="goodsInfor">
            <h2>
              <a href="product">烟灰缸 玻璃工艺品...</a>
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
          <a class="like_icon">1100</a>
          <a class="comment_icon">420</a>
          <a class="deal_icon">299</a>
        </aside>
      </li>
      <li>
        <div class="productArea">
          <a href="product" class="goodsPic">
            <img src="../../upload/goods003.jpg"/>
          </a>
          <div class="goodsInfor">
            <h2>
              <a href="product">迷你花杯 送底座</a>
            </h2>
            <p>
              <del>19.90</del>
            </p>
            <p>
              <strong class="price">12.90</strong>
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
      <li>
        <div class="productArea">
          <a href="product" class="goodsPic">
            <img src="../../upload/goods004.jpg"/>
          </a>
          <div class="goodsInfor">
            <h2>
              <a href="product">开光招财 聚财貔貅风水摆件</a>
            </h2>
            <p>
              <del>99.90</del>
            </p>
            <p>
              <strong class="price">69.90</strong>
            </p>
            <a class="addToCart">&#126;</a>
          </div>
        </div>
        <aside>
          <a class="like_icon">80</a>
          <a class="comment_icon">60</a>
          <a class="deal_icon">55</a>
        </aside>
      </li>
      <li>
        <div class="productArea">
          <a href="product" class="goodsPic">
            <img src="../../upload/goods005.jpg"/>
          </a>
          <div class="goodsInfor">
            <h2>
              <a href="product">翅琉璃对 天鹅新房摆件...</a>
            </h2>
            <p>
              <del>88.90</del>
            </p>
            <p>
              <strong class="price">59.90</strong>
            </p>
            <a class="addToCart">&#126;</a>
          </div>
        </div>
        <aside>
          <a class="like_icon">50</a>
          <a class="comment_icon">20</a>
          <a class="deal_icon">35</a>
        </aside>
      </li>
    </ul>
  </dd>
</dl>
<!--floatCart-->
<div class="hoverCart">
  <a href="cart">0</a>
</div>
<!--fixedNav:footer-->
<div style="height:1.2rem;"></div>
<nav>
  <a href="index" class="homeIcon">首页</a>
  <a href="category" class="categoryIcon">分类</a>
  <a href="cart" class="cartIcon">购物车</a>
  <a href="user" class="userIcon">我的</a>
</nav>
</body>
</html>

