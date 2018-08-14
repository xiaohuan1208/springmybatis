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
    <title>我的地址-合众饰品专卖</title>
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
            //测试返回页面，程序对接删除即可
            $(".userForm input[type='button']").click(function () {
                alert("地址修改成功！");
                location.href = "user_set";
            });
        });
    </script>
</head>
<body>
<!--header-->
<header>
    <a href="javascript:history.go(-1);" class="iconfont backIcon">&#60;</a>
    <h1>我的地址</h1>
</header>
<ul class="userForm">
    <li>
        <input type="text" value="HZIT"/>
    </li>
    <li>
        <select id="select-first">
            <c:forEach items="${list}" var="item" >
                <option value="${item.areaid}">${item.areaname}</option>
            </c:forEach>
        </select>
    </li>
    <li>
        <select id="select-second">

        </select>
    </li>
    <li>
        <select id="select-third">

        </select>
    </li>
    <li>
        <textarea>三八东路德州市体育中心</textarea>
    </li>
    <li>
        <input type="button" value="修改地址" class="formLastBtn"/>
    </li>
</ul>
</body>
</html>
<script>
    $(function(){
        getCity("select-second",1,"address/getCity");
    })
    var flag = 2;
    function getCity(id,value,targetUrl){
        $.ajax({
            type:'get',
            url:targetUrl,
            data:{
                parentId:value
            },
            cache:false,
            dataType:'json',
            success:function(data){
                //遍历回传的数据添加到二级select
                $.each(data, function(index,item) {
                    if(index == 0 && targetUrl== "address/getCity"){
                        flag = item.areaid;
                    }
                    var option = '<option value="'+item.areaid+'">'+item.areaname+'</option>'
                    $("#"+id).append(option);
                })
                if(targetUrl=="address/getCity"){
                    $("#select-third").empty();
                    getCity("select-third",flag,"address/getDistrict");
                }
            },
            error:function(){
                alert("请求失败")
            }
        });

    }
    //级联select:一级select的值发生改变，触发二级的选项改变
    $("#select-first").change(function(){
        //清空二级和三级select的旧选项
        $("#select-second").empty();
        $("#select-third").empty();
        //获得一级select的值
        var firstValue = $(this).val();
        //根据一级select的值，异步获取数据更新二级的选项
        getCity("select-second",firstValue,"address/getCity");
    });

    //级联select:二级select值改变，触发三级select变化
    $("#select-second").change(function(){
        //清空三级slect的旧选项
        $("#select-third").empty();
        //二级select的值
        var secondValue = $(this).val();
        //根据二级select的值，异步获取数据更新三级的选项
        getCity("select-third",secondValue,"address/getDistrict");
    });

</script>
