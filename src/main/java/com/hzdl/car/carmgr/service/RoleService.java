package com.hzdl.car.carmgr.service;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.util.TreeNode;
import com.hzdl.car.carmgr.vo.RoleVo;

import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-02 0:34
 */
public interface RoleService {
    //查询所有角色信息
    PageInfo<Role> findRole(RoleVo roleVo);
    //根据条件查询角色信息
    PageInfo<Role> findRoleWhere(RoleVo roleVo);
    //添加角色信息
    int add(RoleVo roleVo);
    //删除角色信息
    int delById(Integer id);
    //更新角色信息
    int update(RoleVo roleVo);
    //批量删除角色信息
    void delBatch(Integer[] roleIds );
    //
    List<TreeNode> findMenuByRole(RoleVo roleVo);
    //
    void saveRoleMenu(RoleVo roleVo);
    //删除前确认是否存在关联的用户或菜单信息
    int chkExistUserOrMenu(RoleVo roleVo);

}
