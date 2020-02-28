package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.sqlprovider.MenuSqlProvider;
import com.hzdl.car.carmgr.vo.MenuVo;
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

    @SelectProvider(type = MenuSqlProvider.class, method = "findMenu")
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

}
