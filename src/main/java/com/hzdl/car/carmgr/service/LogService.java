package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Log;
import com.hzdl.car.carmgr.vo.LogVo;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:42
 */
public interface LogService {
    //查询所有
    PageInfo<Log> findLog(LogVo logVo);
    //根据条件查询
    PageInfo<Log> findLogWhere(LogVo logVo);
    //删除
    int delById(Integer id);
    //批量删除
    void delBatch(Integer[] ids);
    //添加日志
    int add(LogVo logVo);
}
