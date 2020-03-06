<%--
  Created by IntelliJ IDEA.
  User: 19096
  Date: 2020/3/3
  Time: 17:35
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
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录名称:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入登录名称" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">真实名称:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="realname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入真实名称" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">地址:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="address" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入地址" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">电话号码:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="phone" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入电话号码" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职位:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="position" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入职位" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-black" style="text-align: center">
                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" lay-submit lay-filter="formUser">查询
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" lay-reset lay-filter="reset">重置
                </button>
            </div>
        </div>

    </form>
    <!-- 搜索条件结束 -->

    <!--查询结果以表格呈现-->
    <table id="userTable" lay-filter="userTable"></table>

    <script id="toolbarUser" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="userAdd">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barUser" type="text/html">
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-xs layui-btn-warm layui-btn-radius" lay-event="edit">重置密码</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="delegate">分配角色</a>
    </script>


    <!-- 添加或者修改弹出框开始 -->
    <div style="display: none" id="addOrUpdateDiv">
        <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
            <div class="layui-form-item">
                <label class="layui-form-label">身份证ID:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="hidden" name="userid">
                    <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入身份证号码" style="height: 30px;border-radius: 10px">
                </div>
                <label class="layui-form-label">登录名称:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入登录名称" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">登录密码:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="password" name="pwd" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入登录密码" style="height: 30px;border-radius: 10px">
                </div>
                <label class="layui-form-label">真实姓名:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="realname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入真实姓名" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">性别:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="sex" value="1" checked title="男">
                        <input type="radio" name="sex" value="0" title="女">
                    </div>
                </div>
                <label class="layui-form-label">地区:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="address" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入地区" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="phone" name="phone" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入电话" style="height: 30px;border-radius: 10px">
                </div>
                <label class="layui-form-label">职位:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="position" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入职位" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">用户类型:</label>
                    <div class="layui-input-block">
                        <input type="radio" name="type" value="1"  title="超级管理员">
                        <input type="radio" name="type" value="0" checked title="系统用户">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">是否可用:</label>
                    <div class="layui-input-block">
                        <input type="radio" name="available" value="1"  checked title="可用">
                        <input type="radio" name="available" value="0"  title="不可用">
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
                            class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius"
                            >重置
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!-- 添加或者修改弹出框结束 -->

    <!-- 分配角色开始 -->
    <div style="display: none" id="delegateDiv">
        <table id="roleTable" lay-filter="roleTable"></table>
    </div>
    <!-- 分配角色开始 -->

    <script src="/layui/layui.js"></script>
    <script>
        var userTable;
        layui.use(['table','form','layer','jquery'], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.jquery;

            // 初始化table
            userTable = table.render({
                elem: "#userTable"
                , url: "/user/findUser"
                , page: {limit: 5, limits: [5, 10, 15]}
                , cellMinWidth: 80
                , toolbar: '#toolbarUser'
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'userid', title: 'ID', width:80, align: "center"}
                    , {field: 'realname', title: '用户姓名', width:120, align: "center"}
                    , {field: 'loginname', title: '登录名', width:120, align: "center"}
                    , {field: 'identity', title: '身份证号', align: "center"}
                    , {field: 'phone', title: '用户电话', align: "center"}
                    , {field: 'address', title: '用户地址', align: "center"}
                    , {
                        field: 'sex', title: '性别', align: "center", width:80, templet: function (data) {
                            return data.sex === 1 ? "<font color=blue >男</font>" : "<font color=red >女</font>"
                        }
                    }
                    , {field: 'pwd', title: '密码', width:100, align: "center"}
                    , {fixed: 'right', title: '操作', toolbar: '#barUser', width:256, align: "center"}
                ]]
            }) ;

            // form表单提交  -- 查询功能
            form.on("submit(formUser)", function (data) {

                userTable.reload({
                    url: "/user/findUserWhere"
                    , where: {
                        'realname': data.field.realname,
                        'loginname': data.field.loginname,
                        'address': data.field.address,
                        'phone': data.field.phone,
                        'identity': data.field.identity,
                        'sex': data.field.sex
                    }
                    , page: {
                        curr: 1
                    }
                });
                return false;
            });

            // 头部工具栏添加事件
            table.on('toolbar(userTable)', function (obj) {
                if (obj.event === "userAdd") { // 点击新增按钮执行的内容
                    userAdd();
                } else if (obj.event === "delBatch") { // 点击批量删除执行的内容
                    delBatch(obj);
                }
            });

            //监听行工具事件
            table.on('tool(userTable)', function (obj) {
                var data = obj.data;
                if (obj.event === "edit") { // 编辑
                    update(data);
                } else if (obj.event === "delete") { // 删除
                    del(data);
                } else if (obj.event === "delegate") { // 分配角色
                    delegate(data);
                }
            });

            //添加
            function userAdd() {
                // 弹出框
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "添加菜单"
                    , content: $("#addOrUpdateDiv")
                    , area: ['800px', '440px']
                    , success: function (layero, index) {
                        // 页面数据要清除
                        $("#dataFrm")[0].reset();
                        url = "/user/addUser";
                    }
                })
            }

            //删除
            function del(data) {
                layer.confirm("您确定要删除" + data.loginname + "的数据么", function (ind) {
                    $.post("/user/deleteUser", {"userid": data.userid}, function (d) {
                        layer.msg(d.msg);
                        // 刷新table数据
                        userTable.reload();
                    });
                    layer.close(ind);
                })
            }

            var index;
            var url;

            //批量删除
            function delBatch(obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                var data = checkStatus.data;
                //如果没有选中
                if (data.length === 0) {
                    layer.msg("请至少选择一个");
                } else {
                    layer.confirm("你确定要删除这几个用户吗", function (ind) {
                        var userids = new Array();
                        $.each(data, function (index, item) {
                            userids.push(item.userid)
                        })
                        $.post("/user/delBatch", {"userids": userids}, function (r) {
                            layer.msg(r.msg);
                            userTable.reload();
                        })
                    })
                }
            }

            //修改
            function update(data){
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "修改菜单"
                    , content: $("#addOrUpdateDiv")
                    , area: ['800px', '440px']
                    , success: function (layero, index) {
                        // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                        form.val("dataFrm", data);
                        url = "/user/updateUser"  // 设置修改的地址
                    }
                })
            }

            var roleTable;
            function delegate(data){
                // 弹出框
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "分配"+ data.realname +"的角色"
                    , content: $("#delegateDiv")
                    , area: ['800px', '440px']
                    , btn:['<div class="layui-icon layui-icon-release">确认分配</div>'
                        ,'<div class="layui-icon layui-icon-close">取消分配</div>']
                    , btnAlign:'c'
                    , success: function () {
                        //给roleTable赋值
                        roleTable =  table.render({
                            elem:"#roleTable"
                            ,url:"/user/findRoleByUser?userid="+data.userid
                            ,cellMinWidth:80
                            ,cols: [[ //表头
                                {type: 'checkbox', fixed: 'left'}
                                ,{field: 'roleId', title: '角色ID',  align: "center"}
                                ,{field: 'roleName', title: '角色名称', align: "center"}
                                ,{field: 'roleDesc', title: '角色描述',  align: "center"}
                            ]]
                        })

                    }
                    , yes : function(obj) {
                        var checkStatus = table.checkStatus("roleTable");
                        console.log(checkStatus)
                        if (checkStatus.data.length == 0) {
                            layer.msg("至少选择一个")
                        } else {
                            // 获取用户id
                            var userid = data.userid;
                            var param = "userid=" + userid;

                            // 循环选中的内容nodes
                            $.each(checkStatus.data, function (i, item) {
                                param += "&ids=" + item.roleId;
                            })
                            // A=valueA&B=valueB&B=valueB
                            // 把数据保存到数据库
                            $.get("/user/saveRoleUser?" + param, function (r) {
                                layer.msg(r.msg)
                            })
                        }
                        layer.close(index)
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
                        userTable.reload()
                    });
                    layer.close(ind);
                });
                return false;
            })

        })
    </script>




</body>
</html>
