package com.hzdl.car.carmgr.service.iml;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Log;
import com.hzdl.car.carmgr.mapper.LogMapper;
import com.hzdl.car.carmgr.service.LogService;
import com.hzdl.car.carmgr.vo.LogVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:50
 */
@Service
public class LogServiceImpl implements LogService {
    @Resource
    private LogMapper logMapper;

    @Override
    public PageInfo<Log> findLog(LogVo logVo) {
        PageHelper.startPage(logVo.getPage(),logVo.getLimit());
        List<Log> list= logMapper.findLog(logVo);
        PageInfo<Log> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public PageInfo<Log> findLogWhere(LogVo logVo) {
        PageHelper.startPage(logVo.getPage(),logVo.getLimit());
        List<Log> list= logMapper.findLogWhere(logVo);
        PageInfo<Log> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int delById(Integer id) {
        return logMapper.del(id);
    }

    @Override
    public void delBatch(Integer[] ids) {
        for(Integer integer: ids){
            delById(integer);
        }
    }

    @Override
    public int add(LogVo logVo) {
        return logMapper.add(logVo);
    }
}
