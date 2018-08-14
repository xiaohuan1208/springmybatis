package cn.jxufe.controller;

import cn.jxufe.entity.Type;
import cn.jxufe.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 29596 on 2018/8/10.
 */
@Controller
@RequestMapping("type")
public class TypeController {
    @Autowired
    private TypeService typeService;

    @RequestMapping("getTypeList")
    @ResponseBody
    public List<Type> getTypeList(){
        return typeService.getTypeList();
    }
}
