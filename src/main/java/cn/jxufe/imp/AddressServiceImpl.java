package cn.jxufe.imp;

import cn.jxufe.dao.AddressDAO;
import cn.jxufe.entity.Address;
import cn.jxufe.entity.User;
import cn.jxufe.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/16.
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDAO addressDAO;
    @Override
    public Address selectByTelphone(HttpSession session) {
        User user = (User)session.getAttribute("user");
        if(user!=null){
            System.out.println(user.getTelphone());
            Address address = addressDAO.selectByTelphone(user.getTelphone());
            if(address!=null){
                System.out.println(address.getTelphone());
                return addressDAO.selectByTelphone(user.getTelphone());
            }else{
                System.out.println("用户还没有添加地址");
            }
        }else{
            System.out.println("用户还没有登录");
        }
        return null;
    }
}
