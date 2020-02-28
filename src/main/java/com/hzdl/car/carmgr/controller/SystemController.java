package com.hzdl.car.carmgr.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 14:07
 */
@Controller
@RequestMapping("sys")
public class SystemController {
    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "system/menu/menuManager";
    }

    @RequestMapping("toMenuManagerLeft")
    public String toMenuManagerLeft(){
        return "system/menu/menuLeft";
    }

    @RequestMapping("toMenuManagerRight")
    public String toMenuManagerRight(){
        return "system/menu/menuRight";
    }
}
