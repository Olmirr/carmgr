<%--
  Created by IntelliJ IDEA.
  log: 19096
  Date: 2020/3/4
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
</head>
<body>
    <!-- 搜索条件开始 -->
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
    </fieldset>
    <form class="layui-form" method="post" id="searchFrm">
        <div class="layui-form-item" style="text-align: center">
            <div class="layui-inline">
                <label class="layui-form-label">登录名:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="loginname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入登录名" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登录IP:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="loginip" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入登录IP" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <div class="layui-inline">
                <label class="layui-form-label">开始时间:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="startTime" id="startTime" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入开始时间" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">结束时间:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入结束时间" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-black" style="text-align: center">
                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" lay-submit lay-filter="formLog">查询
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" lay-reset lay-filter="reset">重置
                </button>
            </div>
        </div>
    </form>
    <!-- 搜索条件开始 -->

    <!--查询结果以表格呈现-->
    <table id="logTable" lay-filter="logTable"></table>

    <script id="toolbarlog" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barlog" type="text/html">
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
    </script>

    <script src="/layui/layui.js"></script>
    <script>
        var logTable;
        layui.use(['table','form','layer','jquery','laydate'], function() {
                var table = layui.table;
                var form = layui.form;
                var layer = layui.layer;
                var $ = layui.jquery;
                var laydate = layui.laydate;

                laydate.render({
                elem:"#startTime"
                ,type:"datetime"
            });
                laydate.render({
                    elem:"#endTime"
                    ,type:"datetime"
                });

                // 初始化table
                logTable = table.render({
                    elem: "#logTable"
                    , url: "/log/findLog"
                    , page: {limit: 5, limits: [5, 10, 15]}
                    , cellMinWidth: 80
                    , toolbar: '#toolbarlog'
                    , cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'id', title: '日志ID', width: 120, align: "center"}
                        , {field: 'loginname', title: '登录名', align: "center"}
                        , {field: 'loginip', title: '登录IP', align: "center"}
                        , {field: 'logintime', title: '登录时间', align: 'center'}
                        , {fixed: 'right', title: '操作', toolbar: '#barlog', align: "center"}
                    ]]
                });

                // form表单提交  -- 查询功能
                form.on("submit(formLog)", function (data) {

                    logTable.reload({
                        url: "/log/findLogWhere"
                        , where: {
                            'loginname': data.field.loginname,
                            'loginip': data.field.loginip,
                            'startTime': data.field.startTime,
                            'endTime': data.field.endTime
                        }
                        , page: {
                            curr: 1
                        }
                    });
                    return false;
                });

                // 头部工具栏添加事件
                table.on('toolbar(logTable)', function (obj) {
                    if (obj.event === "delBatch") { // 点击批量删除执行的内容
                        delBatch(obj);
                    }
                });

                //监听行工具事件
                table.on('tool(logTable)', function (obj) {
                    var data = obj.data;
                    if (obj.event === "delete") { // 删除
                        del(data);
                    }
                });
                
                function del(data) {
                    layer.confirm("您确定要删除" + data.loginname + "的数据么", function (ind) {
                        $.post("/log/deleteLog", {"id": data.id}, function (d) {
                            layer.msg(d.msg);
                            // 刷新table数据
                            logTable.reload();
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
                    layer.confirm("你确定要删除这几个记录吗", function (ind) {
                        var ids = new Array();
                        $.each(data, function (index, item) {
                            ids.push(item.id)
                        });
                        $.post("/log/delBatch", {"ids": ids}, function (r) {
                            layer.msg(r.msg);
                            logTable.reload();
                        })
                    })
                }
            }
            })
    </script>
            
</body>
</html>
