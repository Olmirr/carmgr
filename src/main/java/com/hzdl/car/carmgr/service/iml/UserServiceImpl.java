package com.hzdl.car.carmgr.service.iml;

import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.mapper.UserMapper;
import com.hzdl.car.carmgr.service.UserService;
import com.hzdl.car.carmgr.vo.UserVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:52
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User login(UserVo userVo) {
        return userMapper.login(userVo);
    }
}
