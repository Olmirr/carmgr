package com.hzdl.car.carmgr.service;

import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.vo.UserVo;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:51
 */
public interface UserService {
    User login(UserVo userVo);
}
