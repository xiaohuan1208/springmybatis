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
<title>点评-合众饰品专卖</title>
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
</head>
<body>
<!--header-->
<header>
 <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
 <h1>点评</h1>
</header>
<div class="comment_input">
 <textarea placeholder="输入评论内容..."></textarea>
 <input type="button" value="评论"/>
</div>
<div class="comment_cont">
 <ul>
  <li>
   <div class="user_infor">
    <span class="user_pic"><img src="../../images/icon/DefaultAvatar.jpg"/></span>
    <span class="rt_infor">
     <em>HZIT</em>
     <time>2018-05-12 16:01:38</time>
    </span>
   </div>
   <div class="comment_cont_txt">这里是用户评论的信息。。。</div>
  </li>
  <li>
   <div class="user_infor">
    <span class="user_pic"><img src="../../images/icon/DefaultAvatar.jpg"/></span>
    <span class="rt_infor">
     <em>张三</em>
     <time>2018-05-12 16:01:38</time>
    </span>
   </div>
   <div class="comment_cont_txt">这里是用户评论的这里是用户评论的信息这里是用户评论的信息这里是用户评论的信息信息。。。</div>
  </li>
 </ul>
</div>
</body>
</html>
