package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Car;
import com.hzdl.car.carmgr.mapper.CarMapper;
import com.hzdl.car.carmgr.service.CarService;
import com.hzdl.car.carmgr.vo.CarVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:52
 */
@Service
@Transactional
public class CarServiceImpl implements CarService {
    @Resource
    private CarMapper carMapper;

    @Override
    public PageInfo<Car> findCar(CarVo carVo) {
        PageHelper.startPage(carVo.getPage(),carVo.getLimit());
        List<Car> list= carMapper.findCar(carVo);
        PageInfo<Car> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Car> findCarWhere(CarVo carVo) {
        PageHelper.startPage(carVo.getPage(),carVo.getLimit());
        List<Car> list= carMapper.findCarWhere(carVo);
        PageInfo<Car> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(CarVo carVo) {
        return carMapper.add(carVo);
    }

    @Override
    public int delById(String id) {
        return carMapper.del(id);
    }

    @Override
    public int update(CarVo carVo) {
        return carMapper.update(carVo);
    }

    @Override
    public void delBatch(String[] ids) {
        for(String s: ids){
            delById(s);
        }
    }


}
