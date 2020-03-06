package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.service.RoleService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.RoleVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @author 伴你时光尽头
 * @create 2020-03-01 22:52
 */
@RestController
@RequestMapping("role")
public class RoleController {
    @Resource
    private RoleService roleService;

    @RequestMapping("findRole")
    public HzdlResultJson findRole(RoleVo roleVo) {
        PageInfo<Role> pageInfo = roleService.findRole(roleVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findRoleWhere")
    public HzdlResultJson findRoleWhere(RoleVo roleVo) {
        PageInfo<Role> pageInfo = roleService.findRoleWhere(roleVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("addRole")
    public ResultObj addMenu(RoleVo roleVo) {
        try {
            roleService.add(roleVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("deleteRole")
    public ResultObj deleteMenu(RoleVo roleVo){
        try{
            roleService.delById(roleVo.getRoleId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("updateRole")
    public ResultObj updateMenu(RoleVo roleVo){
        try{
            roleService.update(roleVo);
            return  ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    public ResultObj delBatch(@RequestParam(value = "roleIds[]") Integer[] roleIds){
        try{
            roleService.delBatch(roleIds);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("roleTreeJson")
    public HzdlResultJson roleTreeJson(RoleVo roleVo){
        try {
            return HzdlResultJson.ok(roleService.findMenuByRole(roleVo));
        } catch (Exception e){
            return HzdlResultJson.error(-1,e.getMessage());
        }
    }

    @RequestMapping("saveRoleMenu")
    public ResultObj saveRoleMenu(RoleVo roleVo){
        try {
            roleService.saveRoleMenu(roleVo);
            return ResultObj.DISPATCH_SUCCESS;
        } catch(Exception e) {
            return ResultObj.DISPATCH_ERROR;
        }
    }

    @RequestMapping("chkExistUserOrMenu")
    public HzdlResultJson chkExistUserOrMenu(RoleVo roleVo){
        try {
            int row = roleService.chkExistUserOrMenu(roleVo);
            return new HzdlResultJson(row,"");
        } catch(Exception e) {
            return new HzdlResultJson(-1,"");
        }
    }


}
