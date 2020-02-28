package com.hzdl.car.carmgr.sqlprovider;

import com.hzdl.car.carmgr.util.Common;
import com.hzdl.car.carmgr.vo.MenuVo;
import org.apache.ibatis.jdbc.SQL;

/**
 * @author 伴你时光尽头
 * @create 2020-02-28 14:10
 */
public class MenuSqlProvider {
    public String findMenu(MenuVo menuVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_menu");
            if(!Common.chkStringEmpty(menuVo.getName())){
                WHERE(" name like concat('%',#{name},'%')");
            }
            if(menuVo.getAvailable()!=null){
                WHERE("available = #{available}");
            }

        }}.toString();
    }
}
