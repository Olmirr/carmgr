package com.hzdl.car.carmgr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 17:28
 */
@Controller
@RequestMapping("desk")
public class DeskManagerController {
    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "system/main/deskManager";
    }
}
