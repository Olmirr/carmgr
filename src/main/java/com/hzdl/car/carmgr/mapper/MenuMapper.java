package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.sqlprovider.SqlProvider;
import com.hzdl.car.carmgr.vo.MenuVo;
import com.hzdl.car.carmgr.vo.RoleVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 9:42
 */
@Mapper
public interface MenuMapper {
    @Select("select * from sys_menu where available = #{available}")
    List<Menu> findAllMenu(MenuVo menuVo);

    @SelectProvider(type = SqlProvider.class, method = "findMenu")
    List<Menu> findMenu(MenuVo menuVo);

    @Insert("insert into sys_menu(pid,name,href,open,target,icon,available) " +
            "values(#{pid},#{name},#{href},#{open},#{target},#{icon},#{available})")
    int add(MenuVo menuVo);

    @Update(" update sys_menu set pid = #{pid}, name =#{name} ,href = #{href} " +
            ",open = #{open} , target = #{target} , icon=#{icon}" +
            " ,available = #{available} where id = #{id} ")
    int update(MenuVo menuVo);

    @Select("select count(*) count from sys_menu where pid = #{id}")
    int exitsChildren(Integer id);

    @Delete("delete from sys_menu where id = #{id} ")
    int delById(Integer id);

    @SelectProvider(type = SqlProvider.class, method = "findMenuById")
    List<Menu> findMenuById(MenuVo menuVo);

    @Select("select m.* from sys_role r "+
            "inner join sys_role_menu rm on r.roleid = rm.rid " +
            "inner join sys_menu m on rm.mid = m.id " +
            "where r.roleid = #{roleId}")
    List<Menu> findMenuByRole(RoleVo roleVo);

    @Select("SELECT * FROM sys_menu m " +
            "INNER JOIN sys_role_menu rm ON m.id = rm.mid " +
            "INNER JOIN sys_role r ON r.roleid = rm.rid " +
            "INNER JOIN sys_role_user ru ON ru.rid = r.roleid " +
            "INNER JOIN sys_user u ON ru.uid = u.userid " +
            "WHERE m.available = #{available} " +
            "AND u.userid = #{userid} ")
    List<Menu> findAllMenuByUser(@Param("available") Integer available, @Param("userid") Integer userid);
}
