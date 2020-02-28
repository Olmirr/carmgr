<%--
  Created by IntelliJ IDEA.
  User: 19096
  Date: 2020/2/26
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
    <title>Title</title>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="/layui_ext/dtree/font/dtreefont.css">
    </head>
    <body>
    <ul id="demoTree1" class="dtree" data-id="0"></ul>


    <script type="text/javascript" src="/layui/layui.js"></script>
    <script>
        layui.extend({
            dtree: '/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
        }).use(['dtree','layer','jquery'], function(){
            var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;

            // 初始化树
            var DemoTree = dtree.render({
                elem: "#demoTree1",
                //data: demoTree, // 使用data加载
                url: "/menu/menuLeftTreeJson" // 使用url加载（可与data加载同时存在）
                , dataStyle:"layuiStyle"//使用layui风格的数据格式
                , response:{message:"msg",statusCode:0}  //修改response中返回数据的定义
            });
        });
    </script>
    </body>
</html>
