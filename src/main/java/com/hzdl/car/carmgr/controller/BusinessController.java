package com.hzdl.car.carmgr.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 14:07
 */
@Controller
@RequestMapping("bus")
public class BusinessController {
    @RequestMapping("toCustomerManager")
    public String toCustomerManager(){
        return "business/customer/customerManager";
    }

    @RequestMapping("toCarManager")
    public String toCarManager(){
        return "business/car/carManager";
    }

    @RequestMapping("toRentManager")
    public String toRentManager(){
        return "business/rent/rentManager";
    }

//    @RequestMapping("toLogManager")
//    public String toLogManager(){
//        return "business/log/logManager";
//    }
//
//    @RequestMapping("toNewsManager")
//    public String toNewsManager(){
//        return "business/news/newsManager";
//    }
}
