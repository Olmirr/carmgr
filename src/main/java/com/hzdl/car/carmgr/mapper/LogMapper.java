package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Log;
import com.hzdl.car.carmgr.sqlprovider.SqlProvider;
import com.hzdl.car.carmgr.vo.LogVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface LogMapper {

    @Select("select * from sys_log_login order by logintime desc")
    List<Log> findLog(LogVo logVo);

    @SelectProvider(type = SqlProvider.class, method = "findLogWhere")
    List<Log> findLogWhere(LogVo logVo);

    @Delete("delete from sys_log_login where id = #{id}")
    int del(Integer id);

    @Insert("insert into sys_log_login(loginname, loginip, logintime) " +
            "values(#{loginname},#{loginip},now())")
    int add(LogVo logVo);
}
