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
<body class="childrenBody">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>查询条件</legend>
        </fieldset>

        <form class="layui-form">
                <div class="layui-form-item">
                        <label class="layui-form-label">菜单名称</label>
                        <div class="layui-input-inline">
                                <input type="text" name="name" required   placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
                        </div>
                        <div class="layui-input-inline">
                                <button type="button" class="layui-btn layui-btn-normal layui-btn-radius layui-btn-sm" lay-submit lay-filter="formMenu">查询 </button>
                                <button type="reset" class="layui-btn layui-btn-warm layui-btn-radius layui-btn-sm" lay-reset lay-filter="reset">重置 </button>
                        </div>
                </div>
        </form>

        <table id="menuTable" lay-filter="menuTable"></table>

        <script id="toolbarMenu" type="text/html">
                <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-sm layui-btn-danger" lay-event="menuAdd">添加</button>
                </div>
        </script>

        <script id="barMenu" type="text/html">
                <a class="layui-btn layui-btn-xs layui-btn-radius" lay-event="edit">编辑</a>
                <a class="layui-btn layui-btn-danger layui-btn-xs layui-btn-radius" lay-event="del">删除</a>
        </script>

        <!-- 添加和修改的弹出层开始 -->
        <div style="display: none;padding: 20px" id="saveOrUpdateDiv">
                <form class="layui-form" lay-filter="dataFrm" id="dataFrm">
                <div class="layui-form-item">
                        <label class="layui-form-label">父级菜单：</label>
                        <div class="layui-input-block">
                                <div class="layui-unselect layui-form-select" id="pid_div">
                                        <div class="layui-select-title">
                                                <input type="hidden" name="pid" id="pid">
                                                <ul id="menuTree" class="dtree" data-id="0" style="width: 100%;"></ul>
                                                <i class="layui-edge"></i>
                                        </div>
                                </div>

                        </div>
                </div>
                <div class="layui-form-item">
                        <label class="layui-form-label">菜单名称:</label>
                        <div class="layui-input-block">
                                <input type="hidden" name="id">
                                <input type="text" name="name" placeholder="请输入菜单名称"lay-verify="required" autocomplete="off" class="layui-input">
                        </div>
                </div>

                <div class="layui-form-item">
                        <label class="layui-form-label">菜单地址:</label>
                        <div class="layui-input-block">
                                <input type="text" name="href" placeholder="请输入菜单地址" autocomplete="off" class="layui-input">
                        </div>
                </div>

                <div class="layui-form-item">
                        <div class="layui-inline">
                                <label class="layui-form-label">菜单图标:</label>
                                <div class="layui-input-inline">
                                        <input type="text" name="icon" placeholder="请输入菜单图标"  autocomplete="off" class="layui-input">
                                </div>
                        </div>

                        <div class="layui-inline">
                                <label class="layui-form-label">TARGET:</label>
                                <div class="layui-input-inline">
                                        <input type="text" name="target" placeholder="请输入TRAGET" autocomplete="off" class="layui-input">
                                </div>
                        </div>

                </div>

                <div class="layui-form-item">
                        <div class="layui-inline">
                                <label class="layui-form-label">是否展开:</label>
                                <div class="layui-input-inline">
                                        <input type="radio" name="open" value="1" title="展开">
                                        <input type="radio" name="open" value="0" title="不展开" checked="checked">
                                </div>
                        </div>

                        <div class="layui-inline">
                                <label class="layui-form-label">是否可用:</label>
                                <div class="layui-input-inline">
                                        <input type="radio" name="available" value="1" checked="checked" title="可用">
                                        <input type="radio" name="available" value="0" title="不可用">
                                </div>
                        </div>
                </div>
                        <div class="layui-form-item">
                                <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                                        <button type="button" class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius" lay-filter="doSubmit" lay-submit="">提交</button>
                                        <button type="reset" class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">重置</button>
                                </div>
                        </div>
                </form>
        </div>

        <script src="/layui/layui.js"></script>
        <script>
                var menuTree;
                var menuTable;
                layui.extend({
                        dtree: '/layui_ext/dtree/dtree'
                }).use(['table','form','layer','jquery','dtree'], function(){
                        var table = layui.table
                        var form = layui.form
                        var layer = layui.layer
                        var $ = layui.jquery
                        var dtree = layui.dtree

                        // 初始table
                        menuTable = table.render({
                                elem:"#menuTable"
                                ,url:"/menu/findMenuRight"
                                ,page: {limit:5 ,limits:[5,10,15]} //开启分页
                                ,cellMinWidth:80
                                ,toolbar: '#toolbarMenu' //开启头部工具栏，并为其绑定左侧模板
                                ,cols: [[ //表头
                                        {type: 'checkbox', fixed: 'left'}
                                        ,{field: 'id', title: '菜单ID',  fixed: 'center'}
                                        ,{field: 'pid', title: '父节点ID',   fixed: 'center'}
                                        ,{field: 'name', title: '菜单名称', width:120, fixed: 'center'}
                                        ,{field: 'href', title: '地址', width:200, fixed: 'center'}
                                        ,{field: 'open', title: '是否展开',   fixed: 'center',templet:function(data) {
                                                return data.open == 1 ? "展开" :"<font color=red >不展开</font>"
                                        }}
                                        ,{field: 'target', title: '跳转方式', fixed: 'center'}
                                        ,{field: 'icon', title: '图标',  fixed: 'center',templet:function(data) {
                                                return "<div class='layui-icon'>"+data.icon+"</div>"
                                        }}
                                        ,{field: 'available', title: '是否可用',   fixed: 'center',templet:function(data) {
                                                return data.available == 1 ? "可用" :"<font color=red >不可用</font>"
                                        }}
                                        ,{fixed: 'right', title:'操作', toolbar: '#barMenu', width:120}
                                ]]
                        })

                        // form表单提交  -- 查询功能
                        form.on("submit(formMenu)",function(data) {

                                menuTable.reload({
                                        url:"/menu/findMenuRight"
                                        ,where :{
                                                'name':data.field.name
                                        }
                                        ,page:{
                                                curr:1
                                        }
                                })
                                return false;
                        })

                        // 头部工具栏添加事件
                        table.on('toolbar(menuTable)',function(obj) {
                                if(obj.event == "menuAdd"){ // 点击新增按钮执行的内容
                                        menuAdd()
                                }
                        })

                        //监听行工具事件
                        table.on('tool(menuTable)', function(obj){
                                var data = obj.data
                                if(obj.event == "edit"){ // 编辑
                                        menuUpdate(data)
                                }else  if(obj.event == "del"){ // 删除
                                        del(data)
                                }
                        })

                        function del(data){
                        //data.id 就是当前这条数据的主键ID

                        layer.confirm("您确定要删除"+ data.name +"数据么",function(ind){
                                $.post("/menu/exitsChildren", {"id":data.id} ,function(r) {
                                        if(r.data != "0"){
                                                layer.msg("该菜单还有子菜单，不能删除")
                                        }else{
                                                $.post("/menu/deleteMenu", {"id":data.id} ,function(d){
                                                        layer.msg(d.msg)
                                                        // 刷新table数据
                                                        menuTable.reload()
                                                        // 左侧的树 刷新一下
                                                        window.parent.left.demoTree.reload()
                                                })
                                        }
                                })
                                layer.close(ind)
                        })


                        }

                        var index;
                        var url;
                        function menuAdd() {
                                // 弹出框
                                index =  layer.open({
                                        type:1 // 1（页面层）
                                        , title:"添加菜单"
                                        , content:$("#saveOrUpdateDiv")
                                        , area : ['800px', '440px']
                                        , success:function(layero, index) {
                                                // 页面数据要清除
                                                $("#dataFrm")[0].reset()
                                                url="/menu/addMenu"
                                        }
                                })
                        }
                        function menuUpdate(data) {
                                index =  layer.open({
                                        type:1 // 1（页面层）
                                        , title:"修改菜单"
                                        , content:$("#saveOrUpdateDiv")
                                        , area : ['800px', '440px']
                                        , success:function(layero, index) {
                                                // 把当前行的数据data显示到form表单中去,form表单中是有id隐藏字段
                                                form.val("dataFrm",data)
                                                // 下拉框设置值
                                                var p = dtree.dataInit("menuTree",data.pid)
                                                $("#menuTree_select_input_id").val(p.context)
                                                url="/menu/updateMenu"  // 设置修改的地址
                                        }
                                })
                        }
                        // form表达提交 -- 新增/修改
                        form.on("submit(doSubmit)",function() {
                                // 获取页面上输入的内容
                                var params = $("#dataFrm").serializeArray();
                                $("#pid").val(params[1].value)

                                // layer.msg($("#dataFrm").serialize())
                                layer.confirm("您确定要提交该数据么",function(ind){
                                        $.post(url,$("#dataFrm").serialize(),function(data) {
                                        layer.msg(data.msg)
                                        layer.close(index)
                                        // 刷新table数据
                                        menuTable.reload()
                                        // 左侧的树 刷新一下
                                        window.parent.left.demoTree.reload()
                                        })
                                        layer.colse(ind)
                                })
                                return false;
                        })

                        //给下拉数赋值 menuTree
                        menuTree= dtree.renderSelect({
                                elem: "#menuTree",
                                url: "/menu/menuLeftTreeJson" // 使用url加载（可与data加载同时存在）
                                , dataStyle:"layuiStyle"//使用layui风格的数据格式
                                , response:{message:"msg",statusCode:0}  //修改response中返回数据的定义
                                // , selectTips: "请选择"
                        });
                        dtree.on('chooseDone("menuTree")', function(obj){
                                var param = dtree.selectVal("menuTree");
                                layer.msg(JSON.stringify(param));
                        });
                })

        function searchById(id) {
                menuTable.reload({
                        url:"/menu/findMenuRightById"
                        ,where:{
                        'id':id
                        }
                        ,page:{
                        curr:1
                        }
                })

        }
        </script>
</body>
</html>
