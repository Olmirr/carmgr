package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.sqlprovider.MenuSqlProvider;
import com.hzdl.car.carmgr.vo.MenuVo;
import com.hzdl.car.carmgr.vo.RoleVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-02 0:30
 */
@Mapper
public interface RoleMapper {
    @Select("select * from sys_role")
    List<Role> findRole(RoleVo roleVo);

    @SelectProvider(type = MenuSqlProvider.class, method = "findRoleWhere")
    List<Role> findRoleWhere(RoleVo roleVo);

    @Insert("insert into sys_role(rolename,roledesc,available) " +
            "values(#{roleName},#{roleDesc},#{available})")
    int add(RoleVo roleVo);

    @Delete("delete from sys_role where roleid = #{id} ")
    int delById(Integer id);

    @Update("update sys_role set rolename =#{roleName}, roledesc = #{roleDesc}" +
            " ,available = #{available} where roleid = #{roleId} ")
    int update(RoleVo roleVo);

    @Select("select count(*) from sys_role_menu where rid = #{roleId}")
    int selRoleByMenu(RoleVo roleVo);

    @Select("select count(*) from sys_role_user where rid = #{roleId)")
    int selRoleByUser(RoleVo roleVo);

    @Delete("delete from sys_role_menu where rid = #{roleId}")
    int delMenuByRole(RoleVo roleVo);

    @Delete("delete from sys_role_user where rid = #{roleId}")
    int delUserByRole(RoleVo roleVo);

    @Insert("insert into sys_role_menu(rid,mid) values(#{rid},#{mid})")
    int addRoleMenuByRole(@Param("rid") Integer rid, @Param("mid") Integer mid);

    @Delete("delete from sys_role_menu where rid = #{roleId}")
    int delRoleMenuByRole(RoleVo roleVo);

    @Select("select * from sys_role r " +
            "inner join sys_role_user ru on r.roleid = ru.rid " +
            "inner join sys_user u on ru.uid = u.userid " +
            "where u.userid = #{id} ")
    List<Role> findRoleByUser(Integer id);
}
