package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Car;
import com.hzdl.car.carmgr.sqlprovider.SqlProvider;
import com.hzdl.car.carmgr.vo.CarVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface CarMapper {
    @Select("select * from bus_car")
    List<Car> findCar(CarVo carVo);

    @SelectProvider(type = SqlProvider.class, method = "findCarWhere")
    List<Car> findCarWhere(CarVo carVo);

    @Insert("insert into bus_car(carnumber,cartype,color,price,rentprice,deposit,isrenting,description,carimg,createtime) values(#{carNumber}, #{carType}, #{color}, #{price}, #{rentPrice}, #{deposit}, #{isRenting},#{description},#{carImg},now())")
    int add(CarVo carVo);

    @Delete("delete from bus_car where carnumber = #{carNumber}")
    int del(String id);

    @Update("update bus_car set cartype = #{carType}, color = #{color}, price = #{price}, rentprice = #{rentPrice}, deposit = #{deposit}, isrenting = #{isRenting}, description = #{description}, carimg = #{carImg}, createtime = now() where carnumber = #{carNumber}")
    int update(CarVo carVo);

}
