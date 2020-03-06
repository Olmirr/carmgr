package com.hzdl.car.carmgr.mapper;

import com.hzdl.car.carmgr.bean.Customer;
import com.hzdl.car.carmgr.sqlprovider.SqlProvider;
import com.hzdl.car.carmgr.vo.CustomerVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:47
 */
@Mapper
public interface CustomerMapper {
    @Select("select * from bus_customer")
    List<Customer> findCustomer(CustomerVo customerVo);

    @SelectProvider(type = SqlProvider.class, method = "findCustomerWhere")
    List<Customer> findCustomerWhere(CustomerVo customerVo);

    @Insert("insert into bus_customer(identity,custname,sex,address,phone,career,createtime) values(#{identity}, #{custname}, #{sex}, #{address}, #{phone}, #{career}, now())")
    int add(CustomerVo customerVo);

    @Delete("delete from bus_customer where identity = #{identity}")
    int del(String id);

    @Update("update bus_customer set custname = #{custname}, sex = #{sex}, address = #{address}, phone = #{phone},career = #{career}, createtime = now() where identity = #{identity}")
    int update(CustomerVo customerVo);

}
