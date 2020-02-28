package com.hzdl.car.carmgr.controller;

import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.service.UserService;
import com.hzdl.car.carmgr.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:45
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;
    @RequestMapping("toLogin")
    public String toLogin(){
        return "system/main/login";
    }
    @RequestMapping("login")
    public String login(UserVo userVo , Model model, HttpSession session){
        System.out.println("userVo = " + userVo);
        User u = userService.login(userVo);
        if(u == null){
            model.addAttribute("loginError","您输入的账号或密码错误");
            return "system/main/login";

        }else{
            session.setAttribute("user",u);
            return "system/main/index";
        }
    }
}

