package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Customer;
import com.hzdl.car.carmgr.vo.CustomerVo;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:51
 */
public interface CustomerService {
    //查询所有客户信息
    PageInfo<Customer> findCustomer(CustomerVo customerVo);
    //根据条件查询客户信息
    PageInfo<Customer> findCustomerWhere(CustomerVo customerVo);
    //添加客户信息
    int add(CustomerVo customerVo);
    //删除客户信息
    int delById(String identity);
    //更新客户信息
    int update(CustomerVo customerVo);
    //批量删除客户信息
    void delBatch(String[] ids);
}
