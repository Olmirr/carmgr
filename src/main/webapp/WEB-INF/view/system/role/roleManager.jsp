<%--
  Created by IntelliJ IDEA.
  User: 19096
  Date: 2020/3/1
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="/favicon.ico">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="/layui_ext/dtree/font/dtreefont.css">
</head>
<body>
    <!-- 搜索条件开始 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
    </fieldset>
    <form class="layui-form" method="post" id="searchFrm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色名称:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="roleName" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入角色名称" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色描述:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="roleDesc" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入角色描述" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否可用:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="available" id="available_on" value="1" checked="checked" title="可用">
                    <input type="radio" name="available" id="available_off" value="0" title="不可用">
                </div>
            </div>
            <div class="layui-inline">
                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" lay-submit lay-filter="formRole">
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" lay-reset lay-filter="reset">
                </button>
            </div>
        </div>

    </form>

    <!--查询结果以表格呈现-->
    <table id="roleTable" lay-filter="roleTable"></table>

    <script id="toolbarRole" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="roleAdd">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barRole" type="text/html">
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="delegate">分配角色</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
    </script>


    <!-- 添加和修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv">
        <form class="layui-form" lay-filter="dataFrm" id="dataFrm">

            <div class="layui-form-item">
                <label class="layui-form-label">角色名称:</label>
                <div class="layui-input-block">
                    <input type="hidden" name="roleId">
                    <input type="text" name="roleName" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">角色描述:</label>
                <div class="layui-input-block">
                    <input type="text" name="roleDesc" placeholder="请输入角色描述" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">是否可用:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="available" value="1" checked title="可用">
                        <input type="radio" name="available" value="0" title="不可用">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                    <button type="button"
                            class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                            lay-filter="doSubmit" lay-submit="">提交
                    </button>
                    <button type="reset"
                            class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!-- 添加和修改的弹出层结束 -->

    <!-- 分配角色弹出层 -->
    <div style="display: none;padding: 20px" id="selRoleMenuDiv">
        <ul id="menuTree" class="dtree" data-id="0" style="width: 100%;"></ul>
    </div>
    <!-- 分配角色弹出层 -->

    <script src="/layui/layui.js"></script>
    <script>
        var roleTable;
        layui.extend({
            dtree: '/layui_ext/dtree/dtree'
        }).use(['table','form','layer','jquery','dtree'], function(){
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.jquery;
            var dtree = layui.dtree;

            // 初始化table
            roleTable = table.render({
                elem: "#roleTable"
                , url: "/role/findRole"
                , page: {limit: 5, limits: [5, 10, 15]}
                , cellMinWidth: 80
                , toolbar: '#toolbarRole'
                , cols: [[ //表头
                    {type: 'checkbox', fixed:'left'}
                    , {field: 'roleId', title: '角色ID', width: 120 , align: "center" }
                    , {field: 'roleName', title: '角色名称' , align: "center" }
                    , {field: 'roleDesc', title: '角色描述' , align: "center" }
                    , {
                        field: 'available', title: '是否可用', align: "center", templet: function (data) {
                            return data.available === 1 ? "可用" : "<font color=red >不可用</font>"
                        }
                    }
                    , {fixed:'right', title: '操作', toolbar: '#barRole', align: "center" }
                ]]
            });

            // form表单提交  -- 查询功能
            form.on("submit(formRole)", function (data) {

                roleTable.reload({
                    url: "/role/findRoleWhere"
                    , where: {
                        'roleName': data.field.roleName,
                        'roleDesc': data.field.roleDesc,
                        'available': data.field.available
                    }
                    , page: {
                        curr: 1
                    }
                });
                return false;
            });

            // 头部工具栏添加事件
            table.on('toolbar(roleTable)', function (obj) {
                if (obj.event === "roleAdd") { // 点击新增按钮执行的内容
                    roleAdd();
                } else if (obj.event === "delBatch") { // 点击批量删除执行的内容
                    delBatch(obj);
                }
            });

            //监听行工具事件
            table.on('tool(roleTable)', function (obj) {
                var data = obj.data;
                if (obj.event === "edit") { // 编辑
                    roleUpdate(data)
                } else if (obj.event === "delete") { // 删除
                    del(data)
                } else if (obj.event === "delegate") { // 分配角色
                    delegate(data);
                }
            });

            //删除
            function del(data) {
                layer.confirm("您确定要删除" + data.roleName + "的数据么", function (ind) {
                    $.post("/role/deleteRole", {"roleId": data.roleId}, function (d) {
                        layer.msg(d.msg);
                        // 刷新table数据
                        roleTable.reload();
                    });
                    layer.close(ind);
                })
            }

            var index;
            var url;

            //添加
            function roleAdd() {
                // 弹出框
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "添加菜单"
                    , content: $("#saveOrUpdateDiv")
                    , area: ['800px', '440px']
                    , success: function (layero, index) {
                        // 页面数据要清除
                        $("#dataFrm")[0].reset();
                        url = "/role/addRole";
                    }
                })
            }

            //批量删除
            function delBatch(obj){
                var checkStatus = table.checkStatus(obj.config.id);
                var data = checkStatus.data;
                //如果没有选中
                if(data.length === 0 ){
                    layer.msg("请至少选择一个");
                } else {
                    layer.confirm("你确定要删除这几个角色吗", function (ind) {
                        var roleIds = new Array();
                        $.each(data, function(index,item){
                            roleIds.push(item.roleId)
                        })
                        $.post("/role/delBatch",{"roleIds":roleIds},function (r) {
                            layer.msg(r.msg);
                            roleTable.reload();
                        })
                    })
                }
            }

            //分配角色
            function delegate(data) {
                index = layer.open({
                    type:1
                    , title:"分配"+data.roleName+"角色"
                    , content:$("#selRoleMenuDiv")
                    , area :['400px','500px']
                    , btn:['<div class="layui-icon layui-icon-release">确认分配</div>'
                        ,'<div class="layui-icon layui-icon-close">取消分配</div>']
                    , btnAlign:'c'
                    , success:function() {
                        // 给下拉树赋值
                        dtree.render({
                            elem: "#menuTree"
                            , url: "/role/roleTreeJson?roleId="+data.roleId
                            , dataStyle:"layuiStyle"
                            , response:{message:"msg",statusCode:0}
                            , checkbar : true
                            , checkbarType:"all"
                            , chackbarData:"choose"
                        });
                    }
                    , yes : function(){
                        // 获取菜单数中选中的nodes
                        var nodes = dtree.getCheckbarNodesParam("menuTree");
                        // 获取角色id
                        var roleId = data.roleId;
                        var param = "roleId="+roleId;

                        // 循环选中的内容nodes
                        $.each(nodes,function(i,item){
                            param += "&ids=" +item.nodeId
                        });
                        // A=valueA&B=valueB&B=valueB
                        // 把数据保存到数据库
                        $.get("/role/saveRoleMenu?"+param,function (r) {
                            layer.msg(r.msg);
                        });
                        layer.close(index);
                    }

                })
            }

            //角色修改
            function roleUpdate(data) {
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "修改菜单"
                    , content: $("#saveOrUpdateDiv")
                    , area: ['800px', '440px']
                    , success: function (layero, index) {
                        // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                        form.val("dataFrm", data);
                        url = "/role/updateRole"  // 设置修改的地址
                    }
                })
            }

            // form表达提交 -- 新增/修改
            form.on("submit(doSubmit)",function() {
                // 获取页面上输入的内容
                var params = $("#dataFrm").serializeArray();

                // layer.msg($("#dataFrm").serialize())
                layer.confirm("您确定要提交该数据么",function(ind){
                    $.post(url,$("#dataFrm").serialize(),function(data) {
                        layer.msg(data.msg);
                        layer.close(index);
                        // 刷新table数据
                        roleTable.reload()
                    });
                    layer.colse(ind)
                });
                return false;
            })
        })
    </script>

</body>
</html>