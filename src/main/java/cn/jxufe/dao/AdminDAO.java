package cn.jxufe.dao;

import cn.jxufe.entity.Admin;
import org.springframework.stereotype.Repository;

/**
 * AdminDAO继承基类
 */
@Repository
public interface AdminDAO extends MyBatisBaseDao<Admin, Integer> {
}