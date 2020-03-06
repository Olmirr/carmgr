package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Car;
import com.hzdl.car.carmgr.service.CarService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.CarVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:45
 */
@Controller
@RequestMapping("car")
public class CarController {
    @Resource
    private CarService carService;

    @RequestMapping("findCar")
    @ResponseBody
    public HzdlResultJson findCar(CarVo carVo) {
        PageInfo<Car> pageInfo = carService.findCar(carVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findCarWhere")
    @ResponseBody
    public HzdlResultJson findCarWhere(CarVo carVo) {
        PageInfo<Car> pageInfo = carService.findCarWhere(carVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("addCar")
    @ResponseBody
    public ResultObj addCar(CarVo carVo) {
        try {
            carService.add(carVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("deleteCar")
    @ResponseBody
    public ResultObj deleteCar(CarVo carVo){
        try{
            carService.delById(carVo.getCarNumber());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("updateCar")
    @ResponseBody
    public ResultObj updateCar(CarVo carVo){
        try{
            carService.update(carVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public ResultObj delBatch(@RequestParam(value = "ids[]") String[] ids){
        try{
            carService.delBatch(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }



}

