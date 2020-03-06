package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.vo.UserVo;

import java.util.List;
import java.util.Map;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:51
 */
public interface UserService {
    User login(UserVo userVo);

    //查询所有用户信息
    PageInfo<User> findUser(UserVo userVo);
    //根据条件查询用户信息
    PageInfo<User> findUserWhere(UserVo userVo);
    //添加用户信息
    int add(UserVo userVo);
    //删除用户信息
    int delById(Integer id);
    //更新用户信息
    int update(UserVo userVo);
    //批量删除用户信息
    void delBatch(Integer[] roleIds);
    //分配角色显示内容
    List<Map<String,Object>> findRoleByUser(UserVo userVo);
    //
    void saveRoleUser(UserVo userVo);
}
