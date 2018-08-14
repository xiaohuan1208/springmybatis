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
    <title>位置-合众饰品专卖</title>
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
    <script type="text/javascript" src="../../js/getCurrLocation.js"></script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>

    <h1>我的位置</h1>
</header>
<div class="location_auto">定位城市：<span onclick="chooseCity(this)">自动定位...</span></div>
<dl class="cityLi" id="template" hidden="hidden">
    <dt></dt>
</dl>
<ul id="cityList"></ul>

<script type="text/javascript">
    $(function () {
        //自动定位
        writeAddress($(".location_auto span"));
        //查询所有的地点
        getArea();
        //查询热门城市
        getHotCity();
    });
    //获取地区信息
    function getArea() {
        $.get("area/getAll", function (data) {
            fecthData(data);
        })
    }
    function getHotCity(){
        $.get("area/getHotCity", function (data) {
            showHotCity(data);
        })
    }
    //根据首字母提取出相应的数据
    function fecthData(data) {
        for (var i = 0; i < 26; i++) {
            var array = [];
            var hotCity = [];
            var c = String.fromCharCode((65 + i));
            $.each(data, function (index, item) {
                if (item.pinyin == c) {
                    array.push(item.areaname);
                }
            })
            showArea(c,array);
        }
    }
    //分类显示基本城市数据
    function showArea(c,data) {
        if(data.length!=0){
            var template = $("#template").clone();
            template.removeAttr("hidden");
            template.find("dt").html(c);
            for(var i=0;i<data.length;i++){
                if(data[i].length>6){
                    data[i] = data[i].slice(0,6);
                }
                var dd = "<dd><a onclick='chooseCity(this)'>"+data[i]+"</a></dd>";
                template.append(dd);
            }
            $("#cityList").append(template);
        }
    }
    //显示热门城市
    function showHotCity(data){
        var template = $("#template").clone();
        template.removeAttr("hidden");
        template.find("dt").html("热门城市");
        if(data.length==0){
            var dd = "<dd>暂无热门城市<dd>"
        }else{
            for(var i=0;i<data.length;i++){
                if(data[i].areaname.length>6){
                    data[i].areaname = data[i].areaname.slice(0,6);
                }
                var dd = "<dd><a onclick='chooseCity(this)'>"+data[i].areaname+"</a></dd>";
                template.append(dd);
            }
        }
        $("#cityList").append(template);
    }
    //点击城市名跳转
    function chooseCity(obj){
        var cityName = obj.innerHTML;
        location.href="index?cityName="+cityName;
    }
</script>
</body>
</html>
