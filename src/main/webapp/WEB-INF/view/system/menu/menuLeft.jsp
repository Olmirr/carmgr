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
            dtree: '/layui_ext/dtree/dtree'
        }).use(['dtree','layer','jquery'], function(){
            var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;

            // 初始化树
            var DemoTree = dtree.render({
                elem: "#demoTree1"
                , url: "/menu/menuLeftTreeJson"
                , dataStyle:"layuiStyle"
                , response:{message:"msg",statusCode:0}
            });

            //点击左侧菜单项，右侧显示内容
            dtree.on("node('demoTree1')",function(obj) {
                var id = obj.param.nodeId;
                window.parent.right.searchById(id);
            });
        });
    </script>
    </body>
</html>
