package com.hzdl.car.carmgr.util;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-02-28 14:15
 */
public class Common {
    public static boolean chkStringEmpty(String str){
        if(str == null || "".equals(str)){
            return true;
        }
        return false;
    }

    public static void getTreeNodeMenu(List<TreeNode> treeNodes, Integer id, List<TreeNode> treeNodes2){
        for(TreeNode t1: treeNodes){
            if(t1.getPid() == id){
                treeNodes2.add(t1);
            }
            for(TreeNode t2: treeNodes){
                if(t1.getId() == t2.getPid()){
                    t1.getChildren().add(t2);
                }
            }
        }
    }
}
