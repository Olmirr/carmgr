package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.News;
import com.hzdl.car.carmgr.sqlprovider.MenuSqlProvider;
import com.hzdl.car.carmgr.vo.NewsVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface NewsMapper {

    @Select("select * from sys_news order by createtime desc")
    List<News> findNews(NewsVo newsVo);

    @SelectProvider(type = MenuSqlProvider.class, method = "findNewsWhere")
    List<News> findNewsWhere(NewsVo newsVo);

    @Delete("delete from sys_news where id = #{id}")
    int del(Integer id);

    @Insert("insert into sys_news(title, content, createtime,publishername) " +
            "values(#{title},#{content},now(),#{publishername})")
    int add(NewsVo newsVo);

    @Update("update sys_news set title = #{title}, content = #{content} " +
            ",createtime = now(), publishername = #{publishername} where id = #{id} ")
    int update(NewsVo newsVo);

    @Select("select * from sys_news order by createtime desc limit 0,5")
    List<News> findNewsLatest();
}
