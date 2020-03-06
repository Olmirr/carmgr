package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.service.LogService;
import com.hzdl.car.carmgr.service.UserService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.LogVo;
import com.hzdl.car.carmgr.vo.UserVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 15:45
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    @Resource
    private LogService logService;

    @RequestMapping("toLogin")
    public String toLogin(){
        return "system/main/login";
    }

    @RequestMapping("login")
    public String login(UserVo userVo , Model model, HttpSession session, HttpServletRequest request){
        System.out.println("userVo = " + userVo);
        User u = userService.login(userVo);
        if(u == null){
            model.addAttribute("loginError","您输入的账号或密码错误");
            return "system/main/login";

        }else{
            session.setAttribute("user",u);

            LogVo logVo = new LogVo();
            logVo.setLoginname(u.getRealname()+ "-" +u.getLoginname());
            logVo.setLoginip(request.getRemoteAddr());
            logService.add(logVo);

            return "system/main/index";
        }
    }

    @RequestMapping("findUser")
    @ResponseBody
    public HzdlResultJson findUser(UserVo userVo) {
        PageInfo<User> pageInfo = userService.findUser(userVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findUserWhere")
    @ResponseBody
    public HzdlResultJson findUserWhere(UserVo userVo) {
        PageInfo<User> pageInfo = userService.findUserWhere(userVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("addUser")
    @ResponseBody
    public ResultObj addUser(UserVo userVo) {
        try {
            userService.add(userVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public ResultObj deleteUser(UserVo userVo){
        try{
            userService.delById(userVo.getUserid());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("updateUser")
    @ResponseBody
    public ResultObj updateUser(UserVo userVo){
        try{
            userService.update(userVo);
            return  ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public ResultObj delBatch(@RequestParam(value = "userids[]") Integer[] userids){
        try{
            userService.delBatch(userids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("findRoleByUser")
    @ResponseBody
    public HzdlResultJson findRoleByUser(UserVo userVo){
        try {
            return HzdlResultJson.ok(userService.findRoleByUser(userVo));
        } catch (Exception e) {
            return HzdlResultJson.error(-1,e.getMessage());
        }
    }

    @RequestMapping("saveRoleUser")
    @ResponseBody
    public ResultObj saveRoleUser(UserVo userVo){
        try {
            userService.saveRoleUser(userVo);
            return ResultObj.DISPATCH_SUCCESS;
        } catch (Exception e) {
            return ResultObj.DISPATCH_ERROR;
        }
    }

}

