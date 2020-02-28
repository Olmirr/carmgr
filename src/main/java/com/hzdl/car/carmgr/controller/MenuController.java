package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Menu;
import com.hzdl.car.carmgr.service.MenuService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.util.TreeNode;
import com.hzdl.car.carmgr.vo.MenuVo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 伴你时光尽头
 * @create 2020-02-26 10:01
 */
@RestController
@RequestMapping("menu")
public class MenuController {

    @Resource
    private MenuService menuService;

    @RequestMapping("findAllMenu")
    public Map<String, Object> findAllMenu(MenuVo menuVo){
        menuVo.setAvailable(1);
        // 查询数据库
        List<Menu> menuList =  menuService.findAllMenu(menuVo);

        List<TreeNode> treeNodes = new ArrayList<>();
        // 把menuList 转换成treeNodes 类型
        for(Menu m1: menuList){
            TreeNode treeNode = new TreeNode(m1.getId(),m1.getPid(),m1.getName(),m1.getIcon(),m1.getHref(),m1.getOpen()==1?true:false,m1.getTarget());
            treeNodes.add(treeNode);
        }
        // 所有的菜单数据都转换成了TreeNode

        List<TreeNode> treeNodes2 = new ArrayList<>();
        // 把数转换成有层级关系的数据
        getTreeNodeMenu(treeNodes,1,treeNodes2);

        Map<String ,Object> map = new HashMap<>();
        map.put("contentManagement",treeNodes2);

        return map;
    }

    @RequestMapping("menuLeftTreeJson")
    public HzdlResultJson menuLeftTreeJson(){
        MenuVo menuVo = new MenuVo();
        menuVo.setAvailable(1);
        // 查询数据库
        List<Menu> menuList =  menuService.findAllMenu(menuVo);

        List<TreeNode> treeNodes = new ArrayList<>();

        // 把menuList 转换成treeNodes 类型
        for(Menu m1: menuList){
            TreeNode treeNode = new TreeNode(m1.getId(),m1.getPid(),m1.getName(),m1.getIcon(),m1.getHref(),m1.getOpen()==1?true:false,m1.getTarget());
            treeNodes.add(treeNode);
        }
        // 所有的菜单数据都转换成了TreeNode

        List<TreeNode> treeNodes2 = new ArrayList<>();
        Integer id =1;
        getTreeNodeMenu(treeNodes,id,treeNodes2);

        return HzdlResultJson.ok(treeNodes2);
    }

    @RequestMapping("findMenuRight")
    public HzdlResultJson findMenuRight(MenuVo menuVo){
        menuVo.setAvailable(1);
        PageInfo<Menu> pageInfo = menuService.findMenu(menuVo);

        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("addMenu")
    public ResultObj addMenu(MenuVo menuVo){
        try{
            menuService.add(menuVo);
            return  ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateMenu")
    public ResultObj updateMenu(MenuVo menuVo){
        try{
            menuService.update(menuVo);
            return  ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }

    @RequestMapping("exitsChildren")
    public HzdlResultJson exitsChildren(MenuVo menuVo){
        try{
            int row = menuService.exitsChildren(menuVo.getId());
            return  HzdlResultJson.ok(row);
        }catch (Exception e){
            return HzdlResultJson.error(-1,e.getMessage());
        }
    }

    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(MenuVo menuVo){
        try{
            // 没有子菜单才可以删除
            menuService.delById(menuVo.getId());
            return  ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    private void getTreeNodeMenu(List<TreeNode> treeNodes, Integer id ,  List<TreeNode> treeNodes2) {
        // 把数转换成有层级关系的数据
        for (TreeNode t1 : treeNodes) {
            if (t1.getPid() == id) { // 判断是一级菜单
                treeNodes2.add(t1);
            }
            for (TreeNode t2 : treeNodes) {
                // 查询子菜单
                if (t1.getId() == t2.getPid()) {
                    t1.getChildren().add(t2);
                }
            }
        }
    }

}
