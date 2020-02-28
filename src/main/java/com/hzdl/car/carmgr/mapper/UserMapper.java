package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.vo.UserVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface UserMapper {
    @Select("select * from sys_user where loginname =#{loginname} and pwd=md5(#{pwd})")
    User login(UserVo userVo);
}
