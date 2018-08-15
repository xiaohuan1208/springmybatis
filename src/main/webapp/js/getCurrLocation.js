document.write("<script type='text/javascript' src='http://developer.baidu.com/map/jsdemo/demo/convertor.js'></script>");
document.write("<script type='text/javascript' src='http://api.map.baidu.com/api?v=2.0&ak=RMoRx1mWeFMw45u6hR2woY8ZqEtovfzE'></script>");
function writeAddress(obj) {
    //ajax获取用户所在经纬度
    $.ajax({
        url: "http://api.map.baidu.com/location/ip?ak=RMoRx1mWeFMw45u6hR2woY8ZqEtovfzE&coor=bd09ll",
        type: "POST",
        dataType: "jsonp",
        success: function (data) {
            latlon = data.content.point.y + "," + data.content.point.x;
            //ajax根据经纬度获取省市区
            $.ajax({
                type: "POST",
                dataType: "jsonp",
                url: 'http://api.map.baidu.com/geocoder/v2/?ak=RMoRx1mWeFMw45u6hR2woY8ZqEtovfzE&callback=renderReverse&location=' + latlon + '&output=json&pois=0',
                success: function (json) {
                    if (json.status == 0) {
                        console.log(json.result.addressComponent.province + "-" + json.result.addressComponent.city + "-" + json.result.addressComponent.district);
                        obj.html(json.result.addressComponent.city);
                    }
                }
            });
        }
    });
}