<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新闻管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/static/plugins/fonts/font-awesome-4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">

    <!-- local css start-->
    <link rel="stylesheet" href="/static/css/local/common.css">
    <link rel="stylesheet" href="/static/css/local/statement.css">
    <link rel="stylesheet" href="/static/plugins/datetimepicker/jquery.datetimepicker.css">
    <link rel="stylesheet" href="/static/css/local/staffmanagement.css">
    <link rel="stylesheet" href="/static/css/local/cashmanagement.css">
    <!-- local css end-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.2.0 -->
    <script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/static/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- DataTables -->
    <script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/static/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <!-- AdminLTE App -->
    <script src="/static/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/static/js/demo.js"></script>
    <!-- datepicker -->
    <script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="/static/plugins/datetimepicker/jquery.datetimepicker.full.js"></script>


</head>
<style type="text/css">
    table.dataTable thead > tr > th {
        box-sizing: border-box;
        padding: 1px;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .file {
        position: relative;
        display: inline-block;
        background: #3c8dbc;
        border: 1px solid #99D3F5;
        border-radius: 4px;
        width: 100px;
        height: 35px;
        color: #fff;
        text-decoration: none;
        text-indent: 0;
        line-height: 30px;
        text-align: center;
    }

    .file input {
        position: absolute;
        width: 100px;
        height: 35px;
        right: 0;
        top: 0;
        opacity: 0;
    }

    .text-center1 {
        text-align: center;
    }

    .file:hover {
        background: #AADFFD;
        border-color: #367fa9;
        color: #fff;
        text-decoration: none;
    }

    .table > tbody > tr > td {
        vertical-align: middle;
    }

    div.dataTables_paginate {
        margin-bottom: 50px;
    }

    #detailCabinet .col-sm-5 {
        width: 0px;
    }

    #detailCabinet .col-sm-7 {
        float: right;
    }

    #shoptype .col-sm-5 {
        width: 0px;
    }

    #shoptype .col-sm-7 {
        float: right;
    }

    #container {
        height: 400px;
        position: relative;
    }

    .shuru {
        color: #333;
        position: absolute;
        top: 10px;
        overflow: hidden;
        line-height: 20px;
    }

</style>

<body class="hold-transition skin-blue sidebar-mini">

<section class="content-header">
    <%--<div class="ctc_title">账号管理</div>--%>
    <ul class="typebox">
        <li class="active" flag="1" id="article" onclick="getArticleData()">新闻列表<span class="redcle"></span></li>
    </ul>
    <div class="down_line"></div>

    <!--article列表-->
    <div id="articleList">
        <div class="col-xs-12">
            <div class="box-header">
                <br/>
                <form class="form-inline">
                    <div class="form-group">
                        <label>状态:</label>
                        <select id="articleStatus" class="form-control">
                            <option value="">全部</option>
                            <option value="0">未发布</option>
                            <option value="1">发布</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>查询：</label>
                        <input style="width: 250px;" class="form-control" type="text" id="articleSearch"
                               placeholder="输入新闻标题/作者、发布日期"/>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="searchArticle();" class="btn btn-block btn-info ">搜索</button>
                    </div>

                    <span style=""></span>
                    <div class="form-group" style="float: right;">
                        <button type="button" onclick="addArticle();" data-target="#addArticle"
                                class="btn btn-block btn-info ">添加新闻
                        </button>
                    </div>
                </form>
            </div>
            <br/>
            <div class="bnsbox">
                <table id="articleConfigList" class="table table-bordered " style="width: 100%">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
                        <th>标题</th>
                        <th>分类</th>
                        <th>作者</th>
                        <th>状态</th>
                        <th>创建日期</th>
                        <th>发布日期</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- 【删除新闻】弹出窗内容 -->
    <div class="modal" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">删除提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">是否删除此新闻?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmDelete();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【撤销发布新闻】弹出窗内容 -->
    <div class="modal" id="cancelPublishModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">确定撤销发布？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmCancel();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【发布新闻】弹出窗内容 -->
    <div class="modal" id="publishArticle" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">确定发布？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmPublish();">确定</button>
                </div>
            </div>
        </div>
    </div>

</section>


<script type="text/javascript">
    $(document).ready(function () {
        //加载数据
        getArticleData();
    });
    var articleID;
    var keyword;

    //加载Admin数据
    function getArticleData() {
        var status = 0;
        var table = $('#articleConfigList').DataTable({
            //"ScrollY": true,   //垂直新增滚动轴  ,无效
            //"ScrollX": true,   //水平新增滚动轴  ,无效
            "destroy": true,   //可以重新初始化，用于搜索
            "lengthChange": false,
            "ordering": false, //排序
            "info": true,		   //
            "autoWidth": true,   //宽度自动
            "paging": true,      //分页
            "searching": false,  //全局搜索关闭
            "processing": true,  //开启显示‘正在加载.../processing’
            "serverSide": true,    //true代表后台处理分页，false代表前台处理分页
            "ajax": {
                url: "${pageContext.request.contextPath}/articleManage/getArticleList",
                type: "POST",
                data: {
                    keyword: keyword
                }
            },
            //参数显示
            "columns": [
                {"data": "id", 'sClass': "text-center", "bSortable": false, "visible": false},
                {"data": "title", 'sClass': "text-center", "searching": true},
                {"data": "type", 'sClass': "text-center", "searching": true},
                {"data": "author", 'sClass': "text-center", "searching": true},
                {
                    "data": "status", 'sClass': "text-center", 'width': '10%',
                    "render": function (data, type, full, meta) {
                        status = data;
                        if (data == 1) {
                            str = "<span class='label label-success' style='padding-left:10px;padding-right:10px;padding-top: inherit;' >已发布</span> ";
                        }
                        if (data == 0) {
                            str = "<span class='label label-danger' style='padding-left:10px;padding-right:10px;padding-top: inherit;'>未发布</span>";
                        }
                        return str;
                    }
                },
                {"data": "createTime", 'sClass': "text-center", "searching": true, 'width': '10%'},
                {"data": "publishTime", 'sClass': "text-center", "searching": true, 'width': '10%'},
                {
                    "data": "id", 'sClass': "text-center", 'width': '20%',
                    "render": function (data, type, full, meta) {
                        var str = "";
                        str += '<div class="btn-group">';
                        if (status == 0) {
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editAdmin(' + data + ');>编辑</button>';
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=publish(' + data + ');>发布</button>';
                        } else if (status == 1) {
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editAdmin(' + data + ');>编辑</button>';
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=cancelPublish(' + data + ');>撤回</button>';
                        }
                        str += '<button type="button" class="btn btn-sm btn-default btn-danger" onclick=deleteArticle(' + data + ');>删除</button>';
                        str += '</div>';
                        return str;
                    }
                }
            ],
            //是否开启主题
            "bJQueryUI": true,
            "oLanguage": {    // 语言设置
                "sLengthMenu": "每页显示 _MENU_ 条记录",
                "sZeroRecords": "抱歉， 没有找到",
                "sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
                "sInfoEmpty": "没有数据",
                "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                "sZeroRecords": "没有检索到数据",
                "sSearch": "检索:",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "前一页",
                    "sNext": "后一页",
                    "sLast": "尾页"
                }
            }
        });
    }

    //添加新闻
    function addArticle() {
        window.location.href = "${pageContext.request.contextPath}/articleManage/toAddArticlePage";
    }

    //撤销发布新闻
    function cancelPublish(data) {
        articleID = data;
        $("#cancelPublishModal").modal("toggle");
    }

    function confirmCancel() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/articleManage/cancelPublishArticle",
            async: true,//默认就是true
            dataType: "json",
            data: {articleID: articleID},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#cancelPublishModal").modal("toggle");//弹窗消失
                    //加载数据
                    getArticleData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    //删除新闻
    function deleteArticle(data) {
        articleID = data;
        $("#deleteModal").modal("toggle");
    }

    function confirmDelete() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/articleManage/deleteArticle",
            async: true,//默认就是true
            dataType: "json",
            data: {articleID: articleID},
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#deleteModal").modal("toggle");//弹窗消失
                    //加载数据
                    getArticleData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    //发布新闻
    function publish(data) {
        articleID = data;
        $("#publishArticle").modal("toggle");
    }

    function confirmPublish(data) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/articleManage/publishArticle",
            async: true,//默认就是true
            dataType: "json",
            data: {
                articleID: articleID
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {  //function1()
                if (result.Msg == "success") {
                    $("#publishArticle").modal("toggle");//弹窗消失
                    //加载数据
                    getArticleData();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

</script>
</body>

</html>