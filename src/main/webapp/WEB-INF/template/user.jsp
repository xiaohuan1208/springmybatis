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
<title>个人中心-合众饰品专卖</title>
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
 <h1>个人中心</h1>
 <a href="user_set" class="iconfont setIcon">&#42;</a>
</header>
<div class="userInfor">
    <label class="userIcon">
        <input type="file" name="file" id="file" style="display:none;"/>
        <img src="../../images/icon/DefaultAvatar.jpg"/>
    </label>
    <%--<a class="userIcon">
         <input type="file" name="file" id="file" hidden="hidden">
         <img src="../../images/icon/DefaultAvatar.jpg"/>
     </a>--%>
    <h2 id="tel">未登录</h2>
</div>
<ul class="userList">
 <li><a href="order_list" class="orderListIcon">订单</a></li>
 <li><a href="favorite" class="collectionIcon">喜欢</a></li>
 <li><a href="profile" class="profileIcon">资料</a></li>
</ul>
<div class="user_designs">
 <a href="upload_file">发布作品</a>
 <a href="product_list">我的作品</a>
</div>
<!--fixedNav:footer-->
<div style="height:1.2rem;"></div>
<nav>
 <a href="page_index" class="homeIcon">首页</a>
 <a href="category" class="categoryIcon">分类</a>
 <a href="cart" class="cartIcon">购物车</a>
 <a href="user" class="userIcon">我的</a>
</nav>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro" style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>
</body>
</html>
<script>
    $(document).ready(function () {
        $.get("user/information", function (data) {
            if(data==null||data==""){
                alert("您尚未登录请先登录！");
                location.href = "login"
            }else{
                $(".userInfor #tel").html(data.telphone);
                if (data.headimg == null || "" == data.headimg) {
                    $(".userInfor .userIcon img").attr("src", "../../images/icon/DefaultAvatar.jpg");
                } else {
                    $(".userInfor .userIcon img").attr("src", data.headimg);
                }
            }
        });

        var showImg = document.querySelector(".userIcon");
        var getImg = document.querySelector("input[type='file']");
        if (typeof FileReader === 'undefined') {
            showImg.innerHTML = "抱歉，你的浏览器不支持!";
            getImg.setAttribute('disabled', 'disabled');
        } else {
            getImg.addEventListener('change', readFile, false);
        }
        function readFile() {
            var file = this.files[0];
            if (!/image\/\w+/.test(file.type)) {
                alert("请上传图片！");
                return false;
            }
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = function (e) {
               // showImg.innerHTML = '<img src="' + this.result + '"/>';
                $(".userIcon img").attr("src",this.result);
                uploadAvatar("file",getImg.files[0]);

            }
        }

    });
    //name:后台接受文件名，file:文件数据
    function uploadAvatar(name,file){
        //上传图片
        var data = new FormData();
        data.append(name, file);
        $.ajax({
            type: 'POST',
            url: "file/upload",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (ret) {
                if(ret.code>0){
                    //当头像上传第三方oss成功
                    // 更新用户头像信息
                    updateImg(ret.message);
                }
            }
        });
    }

    //
    function updateImg(imgUrl){
        var user = {}
        user.headimg = imgUrl
        user.telphone = $("#tel").html();
        $.post("user/img",user,function(data){
            //提示信息
            prompt(data.message);
        });
    }
    //弹框显示，自动消失
    function prompt(text){
        $('#pro p').html(text);
        $('#pro').show ().delay (3000).fadeOut ();
    }
</script>