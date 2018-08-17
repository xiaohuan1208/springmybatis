package cn.jxufe.controller;

import cn.jxufe.entity.Address;
import cn.jxufe.entity.User;
import cn.jxufe.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/16.
 */
@Controller
public class AddressController {
    @Autowired
    private AddressService addressService;

    @RequestMapping("getDefaultAddress")
    @ResponseBody
    public Address getDefaultAddress(HttpSession session){
        User user = (User)session.getAttribute("user");
        System.out.println(user.getTelphone());
        return addressService.selectByTelphone(session);
    }
}
