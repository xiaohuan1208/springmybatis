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
        pagination : '.pagination'
      });

    
      //获取商品数据
      goodsList();

      //初始化购物车数量
      $.get("user/cart",function(data){
        $(".hoverCart a").html(Object.keys(data).length);
      });
    });

    //获取商品数据
    function goodsList(){

      $.get("goods/list",function(data){
        showGoodsList(data);
      })
    }
    //刷新商品信息界面
    function showGoodsList(data){
      var list = $(".tab_proList ul");
      list.html("");

      $.each(data,function(index,item){
        var template = $("#goods-template").clone();
        template.removeAttr("hidden");
        template.find(".goodsPic").attr("href","product?goodsId="+item.goodsid);
        if(item.img != null){
          template.find(".goodsPic img").attr("src","../../upload/"+item.img);
        }
        template.find(".goodsInfor .name").attr("href","product?goodsId="+item.goodsid);
        template.find(".goodsInfor .name").html(item.goodsname);
        template.find(".goodsInfor del").html(item.originalprice/100.00);
        template.find(".goodsInfor strong").html(item.sellingprice/100.00);
        template.find("aside .like_icon").html(item.likenumber);
        template.find("aside .like_icon").attr("onclick","likeGoods("+item.goodsid+")");
        template.find("aside .comment_icon").html(item.commentnum);
        template.find("aside .deal_icon").html(item.transactionnum);
        template.find(".addToCart").attr("onclick","pushCart("+item.goodsid+",this)");
        list.append(template);
      });
    }
    //加入购物车
    function pushCart(goodsid,obj){
      var cart = {}
      cart.goodsId = goodsid;
      cart.number = 1;
      $.get("user/pushcart",cart,function(result){
        if(result.code>0){
          $.get("user/cart",function(data){
            animation(obj);
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

    //点赞
    function likeGoods(goodsid){
      $.post("collection/addCollection_"+goodsid, function (e) {
        console.log(e.message);
        //重新获取数据
        goodsList();
      })
    }
  </script>
</head>
<body>
<!--header-->
<header>
  <a href="location" class="location">深圳市</a>
  <h1>合众饰品专卖</h1>
  <a href="searchTable/getSearch" class="rt_searchIcon">&#37;</a>
</header>
<!--slide-->
<div class="slide">
  <div class="swiper-wrapper">
      <%--循环顶部图片--%>
      <c:forEach items="${adv}" var="item">
          <div class="swiper-slide">
            <a href="${item.linkurl}">
              <img src="upload/${item.advimg}"/>
            </a>
          </div>
      </c:forEach>
  </div>
  <div class="pagination"></div>
</div>
<!--Tab:productList-->
<dl class="tab_proList">
  <dd>
    <li id="goods-template" hidden="hidden">
      <div class="productArea">
        <a href="product" class="goodsPic">
          <img src="../../upload/goods001.jpg"/>
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
    <ul>

      
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
  <a href="page_index" class="homeIcon">首页</a>
  <a href="category" class="categoryIcon">分类</a>
  <a href="cart" class="cartIcon">购物车</a>
  <a href="user" class="userIcon">我的</a>
</nav>
</body>
</html>

