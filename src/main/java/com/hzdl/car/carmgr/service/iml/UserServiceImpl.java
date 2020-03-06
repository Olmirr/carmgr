package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Role;
import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.mapper.RoleMapper;
import com.hzdl.car.carmgr.mapper.UserMapper;
import com.hzdl.car.carmgr.service.UserService;
import com.hzdl.car.carmgr.util.SysConstast;
import com.hzdl.car.carmgr.vo.RoleVo;
import com.hzdl.car.carmgr.vo.UserVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 伴你时光尽头
 * @create 2020-02-25 16:52
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Resource
    private RoleMapper roleMapper;

    @Override
    public User login(UserVo userVo) {
        return userMapper.login(userVo);
    }

    @Override
    public PageInfo<User> findUser(UserVo userVo) {
        PageHelper.startPage(userVo.getPage(),userVo.getLimit());
        List<User> list= userMapper.findUser(userVo);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<User> findUserWhere(UserVo userVo) {
        PageHelper.startPage(userVo.getPage(),userVo.getLimit());
        List<User> list= userMapper.findUserWhere(userVo);
        PageInfo<User> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int add(UserVo userVo) {
        return userMapper.add(userVo);
    }

    @Override
    public int delById(Integer id) {
        return userMapper.del(id);
    }

    @Override
    public int update(UserVo userVo) {
        return userMapper.update(userVo);
    }

    @Override
    public void delBatch(Integer[] userIds) {
        for(Integer integer: userIds){
            delById(integer);
        }
    }

    @Override
    public List<Map<String, Object>> findRoleByUser(UserVo userVo) {
        // 查询所有的角色
        RoleVo roleVo = new RoleVo();
        roleVo.setAvailable(SysConstast.AVAILABLE_TRUE);
        List<Role> allRole =  roleMapper.findRole(roleVo);
        // 查询当前用户的角色
        List<Role> userRole = roleMapper.findRoleByUser(userVo.getUserid());
        // LAY_CHECKED  属性  可以设置数据表格中 checkbox的选中状态
        List<Map<String,Object>> roleUsers = new ArrayList<>();
        for(Role r1 : allRole ){
            Boolean  LAY_CHECKED = false;
            for(Role r2 : userRole){
                if(r1.getRoleId()  == r2.getRoleId()){
                    // 该用户有此角色
                    LAY_CHECKED = true;
                    break;
                }
            }
            Map<String,Object> map = new HashMap<>();
            map.put("roleId",r1.getRoleId());
            map.put("roleName",r1.getRoleName());
            map.put("roleDesc",r1.getRoleDesc());
            map.put("LAY_CHECKED",LAY_CHECKED);
            roleUsers.add(map);
        }
        return roleUsers;
    }

    @Override
    public void saveRoleUser(UserVo userVo) {
        // 根据userid删除sys_role_user表数据
        userMapper.deleteRoleByUser(userVo.getUserid());
        // 添加数据
        for (Integer id :userVo.getIds()){
            userMapper.addRoleUser(userVo.getUserid(),id);
        }
    }
}
