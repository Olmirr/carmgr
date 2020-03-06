package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.News;
import com.hzdl.car.carmgr.vo.NewsVo;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:42
 */
public interface NewsService {
    //查询所有
    PageInfo<News> findNews(NewsVo newsVo);
    //根据条件查询
    PageInfo<News> findNewsWhere(NewsVo newsVo);
    //删除
    int delById(Integer id);
    //批量删除
    void delBatch(Integer[] ids);
    //添加公告
    int add(NewsVo newsVo);
    //更改公告
    int update(NewsVo newsVo);
    //首页获取公告
    List<News> findNewsLatest();
}
