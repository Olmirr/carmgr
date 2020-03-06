package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Car;
import com.hzdl.car.carmgr.vo.CarVo;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:51
 */
public interface CarService {
    //查询所有汽车信息
    PageInfo<Car> findCar(CarVo carVo);
    //根据条件查询汽车信息
    PageInfo<Car> findCarWhere(CarVo carVo);
    //添加汽车信息
    int add(CarVo carVo);
    //删除汽车信息
    int delById(String id);
    //更新汽车信息
    int update(CarVo carVo);
    //批量删除汽车信息
    void delBatch(String[] ids);
}
