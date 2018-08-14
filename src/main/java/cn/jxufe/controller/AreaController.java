package cn.jxufe.controller;

import cn.jxufe.entity.Area;
import cn.jxufe.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 29596 on 2018/8/13.
 */
@Controller
@RequestMapping("address")
public class AreaController {
    @Autowired
    private AreaService areaService;

    @RequestMapping("area")
    public String getAreaGrid(ModelMap modelMap){
        List<Area>  areas = areaService.getProvince(-1);
        modelMap.put("list",areas);
        return "address";
    }
    @RequestMapping("getDistrict")
    @ResponseBody
    public List<Area> getDistrict(int parentId){
        return areaService.getDistrict(parentId);
    }
    @RequestMapping("getCity")
    @ResponseBody
    public List<Area> getCity(int parentId){
        return areaService.getCity(parentId);
    }
}
