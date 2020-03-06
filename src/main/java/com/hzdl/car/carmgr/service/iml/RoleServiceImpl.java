package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.mapper.MenuMapper;
import com.hzdl.car.carmgr.mapper.RoleMapper;
import com.hzdl.car.carmgr.service.RoleService;
import com.hzdl.car.carmgr.util.Common;
import com.hzdl.car.carmgr.util.TreeNode;
import com.hzdl.car.carmgr.vo.MenuVo;
import com.hzdl.car.carmgr.vo.RoleVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-02 0:35
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    private RoleMapper roleMapper;
    @Resource
    private MenuMapper menuMapper;

    @Override
    public PageInfo<Role> findRole(RoleVo roleVo) {
        PageHelper.startPage(roleVo.getPage(),roleVo.getLimit());
        List<Role> list= roleMapper.findRole(roleVo);
        PageInfo<Role> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Role> findRoleWhere(RoleVo roleVo) {
        PageHelper.startPage(roleVo.getPage(),roleVo.getLimit());
        List<Role> list= roleMapper.findRoleWhere(roleVo);
        PageInfo<Role> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(RoleVo roleVo) {
        return roleMapper.add(roleVo);
    }

    @Override
    public int delById(Integer id) {
        return roleMapper.delById(id);
    }

    @Override
    public int update(RoleVo roleVo) {
        return roleMapper.update(roleVo);
    }

    @Transactional
    @Override
    public void delBatch(Integer[] roleIds) {
        for(Integer integer: roleIds){
            delById(integer);
        }
    }

    @Override
    public List<TreeNode> findMenuByRole(RoleVo roleVo) {
        System.out.println("打印roleVo的ID："+ roleVo.getRoleId());
        // 获取所有的菜单
        MenuVo menuVo = new MenuVo();
        menuVo.setAvailable(1);// 可用菜单
        List<Menu> allMenu = menuMapper.findAllMenu(menuVo);

        // 获取当前角色的菜单
        List<Menu> roleMenu = menuMapper.findMenuByRole(roleVo);
        System.out.println("打印roleMenu"+ roleMenu);
        List<TreeNode> treeNodes = new ArrayList<>();
        for (Menu m1 : allMenu){
            String checkArr = "0";
            for (Menu m2 : roleMenu){
                if (m1.getId() == m2.getId()){
                    checkArr = "1";
                    break;
                }
            }
            // List<Menu> 转换为 List<TreeNode>
            treeNodes.add(new TreeNode(m1.getId(),m1.getPid(),m1.getName(),m1.getOpen()==1?true:false,checkArr));
        }

        // 转换为有层级关系的样子
        List<TreeNode> treeNodesAfter = new ArrayList<>();
        Common.getTreeNodeMenu(treeNodes,0 ,treeNodesAfter);

        return treeNodesAfter;
    }

    @Transactional
    @Override
    public void saveRoleMenu(RoleVo roleVo) {
        // 角色对应的菜单插入
        // 1. 删除sys_role_menu
        roleMapper.delMenuByRole(roleVo);
        // 2. 插入sys_role_menu
        for (Integer id : roleVo.getIds()){
            roleMapper.addRoleMenuByRole(roleVo.getRoleId(), id);
        }
    }

    @Override
    public int chkExistUserOrMenu(RoleVo roleVo) {
        int row = 0;
        row = roleMapper.selRoleByMenu(roleVo);
        row += roleMapper.selRoleByUser(roleVo);
        return row;
    }
}
