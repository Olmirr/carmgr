package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Customer;
import com.hzdl.car.carmgr.service.CustomerService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.CustomerVo;
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
@RequestMapping("customer")
public class CustomerController {
    @Resource
    private CustomerService customerService;

    @RequestMapping("findCustomer")
    @ResponseBody
    public HzdlResultJson findCustomer(CustomerVo customerVo) {
        PageInfo<Customer> pageInfo = customerService.findCustomer(customerVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findCustomerWhere")
    @ResponseBody
    public HzdlResultJson findCustomerWhere(CustomerVo customerVo) {
        PageInfo<Customer> pageInfo = customerService.findCustomerWhere(customerVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("addCustomer")
    @ResponseBody
    public ResultObj addCustomer(CustomerVo customerVo) {
        try {
            customerService.add(customerVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("deleteCustomer")
    @ResponseBody
    public ResultObj deleteCustomer(CustomerVo customerVo){
        try{
            customerService.delById(customerVo.getIdentity());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("updateCustomer")
    @ResponseBody
    public ResultObj updateCustomer(CustomerVo customerVo){
        try{
            customerService.update(customerVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public ResultObj delBatch(@RequestParam(value = "ids[]") String[] ids){
        try{
            customerService.delBatch(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }



}

