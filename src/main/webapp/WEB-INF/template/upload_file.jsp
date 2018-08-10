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
    <title>上传-合众饰品专卖</title>
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
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>上传创意作品</h1>
</header>
<div class="upload_file">
    <ul>
        <li>
            <label id="file_pic">
                <input type="file" name="file" id="file" style="display:none;"/>
                <img src="../../images/uploadImg.png"/>
            </label>
        </li>
        <li>
            <label>标题：</label>
            <input id="goodsName" type="text" placeholder="作品标题..."/>
        </li>
        <li>
            <label>内容：</label>
            <textarea placeholder="作品概要..."></textarea>
        </li>
        <li>
            <label>作者：</label>
            <input id="designer" type="text" placeholder="作者..." value="HZIT"/>
        </li>
        <li><input type="button" value="提交作品"/></li>
    </ul>
</div>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro" style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;display:inline-block;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>

<script>
    $(document).ready(function(){
        $.get("user/information", function (data) {
            $("#designer").val(data.nickname);
        });
    });
    var showImg = document.querySelector("#file_pic");
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
            showImg.innerHTML = '<img src="' + this.result + '"/>';
        }
    }


    //上传作品
    $("input[type='button']").click(function () {
        //上传图片
        var data = new FormData();
        data.append('file', getImg.files[0]);
        $.ajax({
            type: 'POST',
            url: "file/upload",
            data: data,
            cache: false,
            processData: false,
            contentType: false,
            success: function (ret) {
                if(ret.code>0){
                    //当图片上传成功执行上传商品信息函数
                    uploadGoods(ret.message);
                }
            }
        });
    });

    function uploadGoods(imgUrl){
        var goods = {};
        goods.img = imgUrl;
        goods.goodsname = $("#goodsName").val();
        goods.description = $("textarea").val();
        goods.designer = $("#designer").val();
        $.post("goods/publish",goods,function(data){
            //商品信息上传成功后的回调函数
            prompt(data.message);
        });
    }

    //弹框显示，自动消失
    function prompt(text){
        $('#pro p').html(text);
        $('#pro').show ().delay (3000).fadeOut ();
    }


</script>
</body>
</html>
