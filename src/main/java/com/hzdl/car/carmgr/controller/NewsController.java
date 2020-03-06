package com.hzdl.car.carmgr.controller;

import com.github.pagehelper.PageInfo;
import com.hzdl.car.carmgr.bean.News;
import com.hzdl.car.carmgr.bean.User;
import com.hzdl.car.carmgr.service.NewsService;
import com.hzdl.car.carmgr.util.HzdlResultJson;
import com.hzdl.car.carmgr.util.ResultObj;
import com.hzdl.car.carmgr.vo.NewsVo;
import com.hzdl.car.carmgr.vo.NewsVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author 伴你时光尽头
 * @create 2020-03-04 22:33
 */
@RestController
@RequestMapping("news")
public class NewsController {
    @Resource
    private NewsService newsService;

    @RequestMapping("findNews")
    public HzdlResultJson findNews(NewsVo newsVo) {
        PageInfo<News> pageInfo = newsService.findNews(newsVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("findNewsWhere")
    public HzdlResultJson findNewsWhere(NewsVo newsVo) {
        PageInfo<News> pageInfo = newsService.findNewsWhere(newsVo) ;
        return HzdlResultJson.ok(pageInfo.getTotal(),pageInfo.getList());
    }

    @RequestMapping("deleteNews")
    public ResultObj deleteNews(NewsVo newsVo){
        try{
            newsService.delById(newsVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("delBatch")
    public ResultObj delBatch(@RequestParam(value = "ids[]") Integer[] ids){
        try{
            newsService.delBatch(ids);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e){
            return ResultObj.DELETE_ERROR;
        }
    }

    @RequestMapping("addNews")
    public ResultObj addMenu(NewsVo newsVo, HttpSession session) {
        try {
            Object o = session.getAttribute("user");
            User user = (User)o;
            newsVo.setPublishername(user.getLoginname());
            newsService.add(newsVo);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            return ResultObj.ADD_ERROR;
        }
    }

    @RequestMapping("updateNews")
    public ResultObj updateMenu(NewsVo newsVo, HttpSession session){
        try {
            Object o = session.getAttribute("user");
            User user = (User)o;
            newsVo.setPublishername(user.getLoginname());
            newsService.update(newsVo);
            return  ResultObj.UPDATE_SUCCESS;
        } catch (Exception e){
            return ResultObj.UPDATE_ERROR;
        }
    }
    @RequestMapping("findNewsLatest")
    public HzdlResultJson findNewsLatest(){
        try{
            return HzdlResultJson.ok(5L,newsService.findNewsLatest());
        } catch (Exception e){
            return HzdlResultJson.error(-1,e.getMessage());
        }
    }
}
