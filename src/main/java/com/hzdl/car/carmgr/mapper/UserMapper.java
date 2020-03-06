package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.sqlprovider.MenuSqlProvider;
import com.hzdl.car.carmgr.vo.UserVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface UserMapper {
    @Select("select * from sys_user where loginname = #{loginname} and pwd = md5(#{pwd})")
    User login(UserVo userVo);

    @Select("select * from sys_user")
    List<User> findUser(UserVo userVo);

    @SelectProvider(type = MenuSqlProvider.class, method = "findUserWhere")
    List<User> findUserWhere(UserVo userVo);

    @Insert("insert into sys_user(identity,loginname,pwd,realname,sex,address,phone,position,type,available) values(#{identity},#{loginname},md5(#{pwd}),#{realname},#{sex},#{address},#{phone},#{position},#{type},#{available})")
    int add(UserVo userVo);

    @Delete("delete from sys_user where userid = #{userid}")
    int del(Integer id);

    @Update("update sys_user set identity = #{identity},loginname = #{loginname},pwd = md5(#{pwd}), realname = #{realname},sex = #{sex},address = #{address},phone = #{phone},position = #{position},type = #{type},available = #{available} where userid = #{userid}")
    int update(UserVo userVo);

    @Delete("delete from sys_role_user where uid = #{id}")
    int deleteRoleByUser(Integer id);

    @Insert("insert into sys_role_user(uid,rid) values(#{uid},#{rid})")
    int addRoleUser(@Param("uid") Integer uid, @Param("rid") Integer rid);
}
