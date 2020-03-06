<%--
  Created by IntelliJ IDEA.
  customer: 19096
  Date: 2020/3/6
  Time: 11:25
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
                <label class="layui-form-label">客户姓名:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="custname" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入客户名称" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="identity" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入身份证号" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户地址:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="address" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入客户地址" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">客户电话:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="phone" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入客户电话" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">客户职业:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="career" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入客户职业" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="sex" value="1" title="男">
                    <input type="radio" name="sex" value="0" title="女">
                </div>
                <button type="button"
                        class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                        id="doSearch" style="margin-top: 4px" lay-submit lay-filter="formCustomer">查询
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                        style="margin-top: 4px" lay-reset lay-filter="reset">重置
                </button>
                <button type="button"
                        class="layui-btn layui-btn-green layui-icon layui-icon-download-circle layui-btn-radius layui-btn-sm"
                        id="doExport" style="margin-top: 4px">导出
                </button>
            </div>
        </div>

    </form>

    <!--查询结果以表格呈现-->
    <table id="customerTable" lay-filter="customerTable"></table>

    <script id="toolbarCustomer" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barCustomer" type="text/html">
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
    </script>


    <!-- 添加和修改的弹出层-->
    <div style="display: none;padding: 20px" id="addOrUpdateDiv">
        <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">客户姓名:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="custname" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">身份证号:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="identity" lay-verify="required" placeholder="请输入客户姓名" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">客户地址:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="address" placeholder="请输入客户地址" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户职业:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="career" placeholder="请输入客户职业" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">客户电话:</label>
                    <div class="layui-input-inline">
                        <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入客户电话" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">客户性别:</label>
                    <div class="layui-input-inline">
                        <input type="radio" name="sex" value="1" checked="checked" title="男">
                        <input type="radio" name="sex" value="0" title="女">
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


    <script src="/layui/layui.js"></script>
    <script>
        var customerTable;
        layui.use(['table','form','layer','jquery'], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.jquery;

            // 初始化table
            customerTable = table.render({
                elem: "#customerTable"
                , url: "/customer/findCustomer"
                , page: {limit: 5, limits: [5, 10, 15]}
                , cellMinWidth: 80
                , toolbar: '#toolbarCustomer'
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'identity', title: '身份证号', align: "center"}
                    , {field: 'custname', title: '客户姓名', width:120, align: "center"}
                    , {field: 'phone', title: '客户电话', align: "center"}
                    , {field: 'address', title: '客户地址', align: "center"}
                    , {field: 'career', title: '客户职业', align: "center"}
                    , {
                        field: 'sex', title: '性别', align: "center", width:80, templet: function (data) {
                            return data.sex === 1 ? "<font color=blue >男</font>" : "<font color=red >女</font>"
                        }
                    }
                    , {field: 'createtime', title: '录入时间', width:100, align: "center"}
                    , {fixed: 'right', title: '操作', toolbar: '#barCustomer', width:256, align: "center"}
                ]]
            }) ;

            // form表单提交  -- 查询功能
            form.on("submit(formCustomer)", function (data) {

                customerTable.reload({
                    url: "/customer/findCustomerWhere"
                    , where: {
                        'custname': data.field.custname,
                        'identity': data.field.identity,
                        'address': data.field.address,
                        'phone': data.field.phone,
                        'career': data.field.career,
                        'sex': data.field.sex
                    }
                    , page: {
                        curr: 1
                    }
                });
                return false;
            });

            // 头部工具栏添加事件
            table.on('toolbar(customerTable)', function (obj) {
                if (obj.event === "add") { // 点击新增按钮执行的内容
                    add();
                } else if (obj.event === "delBatch") { // 点击批量删除执行的内容
                    delBatch(obj);
                }
            });

            //监听行工具事件
            table.on('tool(customerTable)', function (obj) {
                var data = obj.data;
                if (obj.event === "edit") { // 编辑
                    update(data);
                } else if (obj.event === "delete") { // 删除
                    del(data);
                }
            });

            //添加
            function add() {
                // 弹出框
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "添加客户"
                    , content: $("#addOrUpdateDiv")
                    , area: ['800px', '300px']
                    , success: function (layero, index) {
                        // 页面数据要清除
                        $("#dataFrm")[0].reset();
                        url = "/customer/addCustomer";
                    }
                })
            }

            //删除
            function del(data) {
                layer.confirm("您确定要删除" + data.custname + "的数据么", function (ind) {
                    $.post("/customer/deleteCustomer", {"identity": data.identity}, function (d) {
                        layer.msg(d.msg);
                        // 刷新table数据
                        customerTable.reload();
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
                    layer.confirm("你确定要删除这几个客户吗", function (ind) {
                        var customerids = new Array();
                        $.each(data, function (index, item) {
                            customerids.push(item.identity)
                        })
                        $.post("/customer/delBatch", {"ids": customerids}, function (r) {
                            layer.msg(r.msg);
                            customerTable.reload();
                        })
                    })
                }
            }

            //修改
            function update(data){
                index = layer.open({
                    type: 1 // 1（页面层）
                    , title: "修改客户"
                    , content: $("#addOrUpdateDiv")
                    , area: ['800px', '300px']
                    , success: function (layero, index) {
                        // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                        form.val("dataFrm", data);
                        url = "/customer/updateCustomer"  // 设置修改的地址
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
                        customerTable.reload()
                    });
                    layer.close(ind);
                });
                return false;
            })

        })
    </script>
</body>
</html>
