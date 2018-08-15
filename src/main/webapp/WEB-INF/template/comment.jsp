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
    <title>点评-合众饰品专卖</title>
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
    <script type="text/javascript">

        //定义起始显示页数
        var currentPage = 1;
        var preData = [];

        $(document).ready(function () {
            var goodsId = getParams();
            var url = "comment/getComment?goodsId="+goodsId;
            //加载评论
            getComment(url);
            $(".comment_input input").click(function () {
                var commentContent = $("#commentContent").val();
                sendComment(commentContent);
            });
            //监听加载更多按钮
            $(".more_btn").click(function () {
                var url = "comment/getComment?goodsId="+goodsId+"&page="+currentPage;
                //加载更多评论
                getComment(url);
            });
        });
        function sendComment(commentContent) {
            var goodsId = getParams();
            var comment = {};
            comment.goodsid = goodsId;
            comment.content = commentContent;
            $.post("comment/addComment", comment, function (e) {
                if (e.code > 0) {
                    var url = "comment/getComment?goodsId="+goodsId;
                    getComment(url);
                    preData = [];
                }
                prompt(e.message);
                if(e.code == -11){
                    location.href = "login";
                }
            })
        }
        //获取商品详情页面传过来的商品ID
        function getParams() {
            var href = window.document.location.href;
            var goodsId = href.split("?")[1].split("=")[1];
            return goodsId;
        }
        //加载评论
        function getComment(url) {
            $.get(url, function (data) {
                if(data.list.length!=0){
                    currentPage = currentPage + 1;
                    //调用提示框
                    //prompt("加载了" + data.list.length + "条评论");
                } else {
                    prompt("已全部加载完毕");
                }
                //调用显示评论的方法
                showComment(data.list);
            });
        }
        //将获取的评论显示出来
        function showComment(data) {
            pushData(data);
            var list = $(".comment_cont ul");
            list.html("");
            if (preData.length != 0) {
                $.each(preData, function (index, item) {
                    var template = $("#comment_template").clone();
                    template.removeAttr("hidden");
                    template.find(".user_pic img").attr("src",  item.headimg);
                    template.find(".rt_infor em").html(item.nickname);
                    template.find(".rt_infor time").html(item.createtime);
                    template.find(".comment_cont_txt").html(item.content);
                    list.append(template);
                });
                $(".more_btn").html("加载更多");
            } else {
                list.append("<p style='text-align: center'>暂无评论</p>");
                $(".more_btn").html("");
            }
        }
        //弹框显示，自动消失
        function prompt(text) {
            $('#pro p').html(text);
            $('#pro').show().delay(2000).fadeOut();
        }
        //将之前的数据于现在查找的数据合起来
        function pushData(data) {
            for (var i = 0; i < data.length; i++) {
                preData.push(data[i]);
            }
        }

    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>点评</h1>
</header>
<div class="comment_input">
    <textarea placeholder="输入评论内容..." id="commentContent"></textarea>
    <input type="button" value="评论"/>
</div>
<div class="comment_cont">
    <li hidden="hidden" id="comment_template">
        <div class="user_infor">
            <span class="user_pic">
                <img src="../../images/icon/DefaultAvatar.jpg"/>
            </span>
            <span class="rt_infor">
             <em>HZIT</em>
             <time>2018-05-12 16:01:38</time>
            </span>
        </div>
        <div class="comment_cont_txt">这里是用户评论的信息。。。</div>
    </li>
    <ul></ul>
    <a class="more_btn"></a>
</div>
<!--用于弹框显示的，合并代码的时候别遗漏了-->
<div id="pro"
     style="display: none; width: 100px; height: 100px; position: fixed; top: 300px; left: 40%; background-color: rgb(0, 0, 0); z-index: 5000; opacity: 0.5; background-position: initial; background-repeat: initial;border-radius:10px;">
    <p style="color:white;text-align: center;line-height: 100px;"></p>
</div>
</body>
</html>
