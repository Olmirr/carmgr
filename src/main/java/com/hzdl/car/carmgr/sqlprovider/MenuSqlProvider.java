package com.hzdl.car.carmgr.sqlprovider;

import com.hzdl.car.carmgr.util.Common;
import com.hzdl.car.carmgr.vo.*;
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

    public String findMenuById(MenuVo menuVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_menu");
            if(menuVo.getId() != null && menuVo.getId() != 1){
                WHERE(" id = #{id} OR pid = #{id} ");
            }
        }}.toString();
    }

    public String findRoleWhere(RoleVo roleVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_role");
            if(!Common.chkStringEmpty(roleVo.getRoleName())){
                WHERE(" rolename like concat('%',#{roleName},'%')");
            }
            if(!Common.chkStringEmpty(roleVo.getRoleDesc())){
                WHERE(" roledesc like concat('%',#{roleDesc},'%')");
            }
            WHERE("available = #{available}");

        }}.toString();
    }

    public String findUserWhere(UserVo userVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_user");
            if(!Common.chkStringEmpty(userVo.getIdentity())){
                WHERE(" identity = #{identity}");
            }
            if(!Common.chkStringEmpty(userVo.getLoginname())){
                WHERE(" loginname = #{loginname}");
            }
            if(!Common.chkStringEmpty(userVo.getRealname())){
                WHERE(" realname like concat('%',#{realname},'%')");
            }
            if(!Common.chkStringEmpty(userVo.getAddress())){
                WHERE(" address like concat('%',#{address},'%')");
            }
            if(!Common.chkStringEmpty(userVo.getPhone())){
                WHERE(" phone = #{phone}");
            }
            if(!Common.chkStringEmpty(userVo.getPosition())){
                WHERE(" position = #{position}");
            }
        }}.toString();
    }

    public String findLogWhere(LogVo logVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_log_login");
            if(!Common.chkStringEmpty(logVo.getLoginname())){
                WHERE(" loginname like concat('%',#{loginname},'%') ");
            }
            if(!Common.chkStringEmpty(logVo.getLoginip())){
                WHERE(" loginip = #{loginip} ");
            }
            if(!Common.chkStringEmpty(logVo.getStartTime())){
                WHERE(" logintime > #{startTime} ");
            }
            if(!Common.chkStringEmpty(logVo.getEndTime())){
                WHERE(" logintime < #{endTime} ");
            }
            ORDER_BY("logintime desc");



        }}.toString();
    }

    public String findNewsWhere(NewsVo newsVo){
        return new SQL(){{
            SELECT("*");
            FROM("sys_news");
            if(!Common.chkStringEmpty(newsVo.getTitle())){
                WHERE(" title like concat('%',#{title},'%') ");
            }
            if(!Common.chkStringEmpty(newsVo.getContent())){
                WHERE(" content like concat('%',#{content},'%') ");
            }
            if(!Common.chkStringEmpty(newsVo.getStartTime())){
                WHERE(" createtime > #{startTime} ");
            }
            if(!Common.chkStringEmpty(newsVo.getEndTime())){
                WHERE(" createtime < #{endTime} ");
            }
            ORDER_BY("createtime desc");



        }}.toString();
    }
}
