package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.bean.Customer;
import com.hzdl.car.carmgr.mapper.RoleMapper;
import com.hzdl.car.carmgr.mapper.CustomerMapper;
import com.hzdl.car.carmgr.service.CustomerService;
import com.hzdl.car.carmgr.util.SysConstast;
import com.hzdl.car.carmgr.vo.RoleVo;
import com.hzdl.car.carmgr.vo.CustomerVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:52
 */
@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
    @Resource
    private CustomerMapper customerMapper;

    @Override
    public PageInfo<Customer> findCustomer(CustomerVo customerVo) {
        PageHelper.startPage(customerVo.getPage(),customerVo.getLimit());
        List<Customer> list= customerMapper.findCustomer(customerVo);
        PageInfo<Customer> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Customer> findCustomerWhere(CustomerVo customerVo) {
        PageHelper.startPage(customerVo.getPage(),customerVo.getLimit());
        List<Customer> list= customerMapper.findCustomerWhere(customerVo);
        PageInfo<Customer> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(CustomerVo customerVo) {
        return customerMapper.add(customerVo);
    }

    @Override
    public int delById(String id) {
        return customerMapper.del(id);
    }

    @Override
    public int update(CustomerVo customerVo) {
        return customerMapper.update(customerVo);
    }

    @Override
    public void delBatch(String[] ids) {
        for(String s: ids){
            delById(s);
        }
    }


}
