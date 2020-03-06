<%--
  Created by IntelliJ IDEA.
  News: 19096
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
                <label class="layui-form-label">公告标题:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="title" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入公告标题" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">公告内容:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="content" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入公告内容" style="height: 30px;border-radius: 10px">
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
                <button type="button" class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm" lay-submit lay-filter="formNews">查询
                </button>
                <button type="reset" class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm" lay-reset lay-filter="reset">重置
                </button>
            </div>
        </div>
    </form>
    <!-- 搜索条件开始 -->

    <!--查询结果以表格呈现-->
    <table id="newsTable" lay-filter="newsTable"></table>

    <script id="toolbarNews" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barNews" type="text/html">
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
        <a class="layui-btn layui-btn-warm layui-btn-xs layui-btn-radius" lay-event="viewNews">查看</a>
    </script>

    <!-- 添加和修改的弹出层开始 -->
    <div style="display: none;padding: 20px" id="saveOrUpdateDiv">
        <form class="layui-form" lay-filter="dataFrm" id="dataFrm">

            <div class="layui-form-item">
                <label class="layui-form-label">公告标题:</label>
                <div class="layui-input-block">
                    <input type="hidden" name="id">
                    <input type="text" name="title" placeholder="请输入公告标题" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">公告内容:</label>
                <div class="layui-input-black">
                    <textarea class="layui-textarea" id="content" name="content" style="display: none"></textarea>
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

    <div id="viewNewsDiv" style="padding: 10px;display: none">
        <h2 id="view_title" align="center"></h2>
        <hr>
        <div style="text-align: right">
            发布人：<span id="view_opername"></span>
            <span style="display: inline-block; width: 20px"></span>
            发布时间：<span id="view_createtime"></span>
        </div>
        <hr>
        <div id="view_content"></div>
    </div>

    <script src="/layui/layui.js"></script>
    <script>
        var newsTable;
        layui.use(['table','form','layer','jquery','laydate','layedit'], function() {
                var table = layui.table;
                var form = layui.form;
                var layer = layui.layer;
                var $ = layui.jquery;
                var laydate = layui.laydate;
                var layedit = layui.layedit;

                laydate.render({
                    elem:"#startTime"
                    ,type:"datetime"
                });
                laydate.render({
                    elem:"#endTime"
                    ,type:"datetime"
                });

                // 初始化table
                newsTable = table.render({
                    elem: "#newsTable"
                    , url: "/news/findNews"
                    , page: {limit: 5, limits: [5, 10, 15]}
                    , cellMinWidth: 80
                    , toolbar: '#toolbarNews'
                    , cols: [[ //表头
                        {type: 'checkbox', fixed: 'left'}
                        , {field: 'id', title: '公告ID', width: 120, align: "center"}
                        , {field: 'title', title: '公告标题', align: "center"}
                        , {field: 'content', title: '公告内容', align: "center"}
                        , {field: 'createtime', title: '创建时间', align: 'center'}
                        , {field: 'publishername', title: '发布人', align: 'center'}
                        , {fixed: 'right', title: '操作', toolbar: '#barNews', align: "center"}
                    ]]
                });

                // form表单提交  -- 查询功能
                form.on("submit(formNews)", function (data) {

                    newsTable.reload({
                        url: "/news/findNewsWhere"
                        , where: {
                            'title': data.field.title,
                            'content': data.field.content,
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
                table.on('toolbar(newsTable)', function (obj) {
                    if (obj.event === "add") { // 点击添加执行的内容
                        add(obj);
                    } else if (obj.event === "delBatch") { // 点击批量删除执行的内容
                        delBatch(obj);
                    }
                });

                //监听行工具事件
                table.on('tool(newsTable)', function (obj) {
                    var data = obj.data;
                    if (obj.event === "edit") { // 编辑
                        edit(data);
                    } else if (obj.event === "delete") { // 删除
                        del(data);
                    } else if (obj.event === "viewNews") { // 查看
                        viewNews(data);
                    }
                });
                //删除
                function del(data) {
                    layer.confirm("您确定要删除" + data.title + "的数据么", function (ind) {
                        $.post("/news/deleteNews", {"id": data.id}, function (d) {
                            layer.msg(d.msg);
                            // 刷新table数据
                            newsTable.reload();
                        });
                        layer.close(ind);
                    })
                }

                var index;
                var layeditContent;
                var url;

                //批量删除
                function delBatch(obj) {
                    var checkStatus = table.checkStatus(obj.config.id);
                    var data = checkStatus.data;
                    //如果没有选中
                    if (data.length === 0) {
                        layer.msg("请至少选择一个");
                    } else {
                        layer.confirm("你确定要删除这几个公告吗", function (ind) {
                            var ids = new Array();
                            $.each(data, function (index, item) {
                                ids.push(item.id)
                            });
                            $.post("/news/delBatch", {"ids": ids}, function (r) {
                                layer.msg(r.msg);
                                newsTable.reload();
                            })
                        })
                    }
                }

                //添加
                function add(data) {
                    // 弹出框
                    index = layer.open({
                        type: 1 // 1（页面层）
                        , title: "添加公告"
                        , content: $("#saveOrUpdateDiv")
                        , area: ['700px', '530px']
                        , success: function (layero, index) {
                            // 页面数据要清除
                            $("#dataFrm")[0].reset();
                            layeditContent = layedit.build("content");
                            url = "/news/addNews";
                        }
                    })
                }

                //编辑
                function edit(data) {
                    index = layer.open({
                        type: 1 // 1（页面层）
                        , title: "修改公告"
                        , content: $("#saveOrUpdateDiv")
                        , area: ['700px', '530px']
                        , success: function (layero, index) {
                            // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                            form.val("dataFrm", data);
                            layeditContent = layedit.build("content");
                            layedit.setContent(layeditContent, data.content, false);
                            url = "/news/updateNews"  // 设置修改的地址

                        }
                    })
                }

                //查看日志
                function viewNews(data) {
                    // 弹出框
                    index = layer.open({
                        type: 1 // 1（页面层）
                        , title: "查看公告"
                        , content: $("#viewNewsDiv")
                        , area: ['700px', '530px']
                        , success: function (layero, index) {
                            $("#view_title").html(data.title);
                            $("#view_opername").html(data.publishername);
                            $("#view_createtime").html(data.createtime);
                            $("#view_content").html(data.content);
                        }
                    })
                }

                // form表达提交 -- 新增/修改
                form.on("submit(doSubmit)",function() {
                    // 获取页面上输入的内容
                    var params = $("#dataFrm").serializeArray();
                    layedit.sync(layeditContent);
                    console.log($("#dataFrm").serialize());
                    layer.confirm("您确定要提交该公告么",function(ind){
                        $.post(url,$("#dataFrm").serialize(),function(data) {
                            layer.msg(data.msg);
                            layer.close(index);
                            // 刷新table数据
                            newsTable.reload();
                        });
                        layer.close(ind);
                    });
                    return false;
                })

            })
    </script>
            
</body>
</html>
