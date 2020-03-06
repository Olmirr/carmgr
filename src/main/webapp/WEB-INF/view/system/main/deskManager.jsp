<%--
  Created by IntelliJ IDEA.
  User: 19096
  Date: 2020/2/26
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>car mgr</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/css/public.css" media="all" />
</head>
<body class="childrenBody">
<blockquote class="layui-elem-quote layui-bg-green">
    <div id="nowTime"></div>
</blockquote>

<div class="layui-row layui-col-space10">
    <div class="layui-col-lg6 layui-col-md12">

        <blockquote class="layui-elem-quote title">最新公告 <i class="layui-icon layui-red">&#xe756;</i></blockquote>
        <table class="layui-table mag0" lay-skin="line">
            <colgroup>
                <col>
                <col width="110">
            </colgroup>
            <tbody class="hot_news"></tbody>
        </table>
</div>
<input type="hidden" id="userName" value="${user.realname}">

<script type="text/javascript" src="/layui/layui.js"></script>
<script type="text/javascript" src="/js/main.js"></script>
</body>
</html>
