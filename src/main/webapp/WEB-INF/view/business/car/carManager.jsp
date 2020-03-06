<%--
  Created by IntelliJ IDEA.
  User: 19096
  Date: 2020/3/6
  Time: 11:24
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
                <label class="layui-form-label">车牌号:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="carNumber" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入车牌号" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">车辆类型:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="carType" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入车辆类型" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">车辆颜色:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="color" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入车辆颜色" style="height: 30px;border-radius: 10px">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">车辆描述:</label>
                <div class="layui-input-inline" style="padding: 5px">
                    <input type="text" name="description" autocomplete="off" class="layui-input layui-input-inline"
                           placeholder="请输入车辆描述" style="height: 30px;border-radius: 10px">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否出租:</label>
                <div class="layui-input-inline">
                    <input type="radio" name="isRenting" value="1" title="已出租">
                    <input type="radio" name="isRenting" value="0" title="未出租">
                </div>
                <button type="button"
                        class="layui-btn layui-btn-normal layui-icon layui-icon-search layui-btn-radius layui-btn-sm"
                        id="doSearch" style="margin-top: 4px" lay-submit lay-filter="formCar">查询
                </button>
                <button type="reset"
                        class="layui-btn layui-btn-warm layui-icon layui-icon-refresh layui-btn-radius layui-btn-sm"
                        style="margin-top: 4px" lay-reset lay-filter="reset">重置
                </button>
            </div>
        </div>

    </form>

    <!--查询结果以表格呈现-->
    <table id="carTable" lay-filter="carTable"></table>

    <script id="toolbarCar" type="text/html">
        <div class="layui-btn-container">
            <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="add">添加</button>
            <button class="layui-btn layui-btn-sm" lay-event="delBatch">批量删除</button>
        </div>
    </script>

    <script id="barCar" type="text/html">
        <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="delete">删除</a>
    </script>


    <!-- 添加和修改的弹出层-->
    <div style="display: none;padding: 20px" id="addOrUpdateDiv">
        <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
            <div class="layui-col-md12 layui-col-xs12">
                <div class="layui-row layui-col-space10">
                    <div class="layui-col-md9 layui-col-xs7">

                        <div class="layui-form-item magt3">
                            <label class="layui-form-label">车牌号:</label>
                            <div class="layui-input-block" style="padding: 5px">
                                <input type="text" name="carNumber" id="carNumber" autocomplete="off" class="layui-input"
                                       lay-verify="required"
                                       placeholder="请输入车牌号" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆类型:</label>
                            <div class="layui-input-block" style="padding: 5px">
                                <input type="text" name="carType" autocomplete="off" class="layui-input"
                                       placeholder="请输入车辆类型" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆颜色:</label>
                            <div class="layui-input-block" style="padding: 5px">
                                <input type="text" name="color" autocomplete="off" class="layui-input"
                                       placeholder="请输入车辆颜色" style="height: 30px;border-radius: 10px">
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md3 layui-col-xs5">
                        <div class="layui-upload-list thumbBox mag0 magt3" id="carimgDiv">
                            <%--显示要上传的图片--%>
                            <img class="layui-upload-img thumbImg" id="showCarImg">
                            <%--保存当前显示图片的地址--%>
                            <input type="hidden" name="carImg" id="carImg">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item magb0">
                    <label class="layui-form-label">车辆描述:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="description" autocomplete="off" class="layui-input"
                               placeholder="请输入车辆描述" style="height: 30px;border-radius: 10px">
                    </div>
                </div>
                <div class="layui-form-item magb0">
                    <div class="layui-inline">
                        <label class="layui-form-label">车辆价格:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="price" class="layui-input" lay-verify="required|number"
                                   placeholder="请输入车辆价格" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">出租价格:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="rentPrice" class="layui-input" lay-verify="required|number"
                                   placeholder="请输入车辆出租价格" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item magb0">
                    <div class="layui-inline">
                        <label class="layui-form-label">出租押金:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="deposit" class="layui-input" lay-verify="required|number"
                                   placeholder="请输入车辆出租押金" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">是否出租:</label>
                        <div class="layui-input-inline">
                            <input type="radio" name="isRenting" value="1" title="已出租">
                            <input type="radio" name="isRenting" value="0" checked="checked" title="未出租">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item magb0">
                    <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                        <button type="button"
                                class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                                lay-filter="doSubmit" lay-submit="">提交
                        </button>
                        <button type="reset"
                                class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
                            重置
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <script src="/layui/layui.js"></script>
    <script>
        var carTable;
        layui.use(['table','form','layer','jquery'], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $ = layui.jquery;

            // 初始化table
            carTable = table.render({
                elem: "#carTable"
                , url: "/car/findCar"
                , page: {limit: 5, limits: [5, 10, 15]}
                , cellMinWidth: 80
                , toolbar: '#toolbarCar'
                , cols: [[ //表头
                    {type: 'checkbox', fixed: 'left'}
                    , {field: 'carNumber', title: '车牌号', align: "center"}
                    , {field: 'carType', title: '车辆类型', width:120, align: "center"}
                    , {field: 'color', title: '车辆颜色', align: "center"}
                    , {field: 'price', title: '购买价格', align: "center"}
                    , {field: 'rentPrice', title: '出租价格', align: "center"}
                    , {field: 'deposit', title: '出租押金', align: "center"}
                    , {
                        field: 'isRenting', title: '出租状态', align: "center", width:80, templet: function (data) {
                            return data.isRenting === 1 ? "<font color=red >已出租</font>" : "<font color=blue >未出租</font>"
                        }
                    }
                    , {field: 'description', title: '车辆描述', width:100, align: "center"}
                    , {fixed: 'right', title: '操作', toolbar: '#barCar', width:256, align: "center"}
                ]]
            }) ;

            // form表单提交  -- 查询功能
            form.on("submit(formCar)", function (data) {

                carTable.reload({
                    url: "/car/findCarWhere"
                    , where: {
                        'carNumber': data.field.carNumber,
                        'carType': data.field.carType,
                        'color': data.field.color,
                        'description': data.field.description,
                        'isRenting': data.field.isRenting
                    }
                    , page: {
                        curr: 1
                    }
                });
                return false;
            });

            // 头部工具栏添加事件
            table.on('toolbar(carTable)', function (obj) {
                if (obj.event === "add") { // 点击新增按钮执行的内容
                    add();
                } else if (obj.event === "delBatch") { // 点击批量删除执行的内容
                    delBatch(obj);
                }
            });

            //监听行工具事件
            table.on('tool(carTable)', function (obj) {
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
                    , title: "添加车辆"
                    , content: $("#addOrUpdateDiv")
                    , area: ['800px', '500px']
                    , success: function (layero, index) {
                        // 页面数据要清除
                        $("#dataFrm")[0].reset();
                        url = "/car/addCar";
                    }
                })
            }

            //删除
            function del(data) {
                layer.confirm("您确定要删除" + data.carNumber + "的数据么", function (ind) {
                    $.post("/car/deleteCar", {"carNumber": data.carNumber}, function (d) {
                        layer.msg(d.msg);
                        // 刷新table数据
                        carTable.reload();
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
                    layer.confirm("你确定要删除这几个车辆吗", function (ind) {
                        var carids = new Array();
                        $.each(data, function (index, item) {
                            carids.push(item.carNumber)
                        });
                        $.post("/car/delBatch", {"ids": carids}, function (r) {
                            layer.msg(r.msg);
                            carTable.reload();
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
                    , area: ['800px', '500px']
                    , success: function (layero, index) {
                        // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                        form.val("dataFrm", data);
                        url = "/car/updateCar"  // 设置修改的地址
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
                        carTable.reload()
                    });
                    layer.close(ind);
                });
                return false;
            })

        })
    </script>
</body>
</html>
