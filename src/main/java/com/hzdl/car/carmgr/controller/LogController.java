package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.Log;
import com.hzdl.car.carmgr.service.LogService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.LogVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:33
 */
@Controller
@RequestMapping("log")
public class LogController {
    @Resource
    private LogService logService;

    @RequestMapping("findLog")
    @ResponseBody
    public HzdlResultJson findLog(LogVo logVo) {
        PageInfo<Log> pageInfo = logService.findLog(logVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findLogWhere")
    @ResponseBody
    public HzdlResultJson findLogWhere(LogVo logVo) {
        PageInfo<Log> pageInfo = logService.findLogWhere(logVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("deleteLog")
    @ResponseBody
    public ResultObj deleteLog(LogVo logVo){
        try{
            logService.delById(logVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    @ResponseBody
    public ResultObj delBatch(@RequestParam(value = "ids[]") Integer[] ids){
        try{
            logService.delBatch(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }
}
