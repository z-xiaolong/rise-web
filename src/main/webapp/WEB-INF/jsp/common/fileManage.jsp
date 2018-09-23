<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>文件管理</title>
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
    <link rel="stylesheet" href="/static/plugins/bootstrap-fileinput/css/fileinput-rtl.min.css">
    <link rel="stylesheet" href="/static/css/local/staffmanagement.css">
    <link rel="stylesheet" href="/static/css/local/cashmanagement.css">
    <link href="https://use.fontawesome.com/releases/v5.0.10/css/all.css" rel="stylesheet">
    <link href="/static/plugins/bootstrap-fileinput/themes/explorer-fas/theme.css" rel="stylesheet">
    <!-- local css end-->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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
    <script src="/static/plugins/bootstrap-fileinput/js/plugins/piexif.js"></script>
    <script src="/static/plugins/bootstrap-fileinput/js/plugins/purify.js"></script>
    <script src="/static/plugins/bootstrap-fileinput/js/plugins/sortable.js"></script>
    <script src="/static/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
    <link href="/static/plugins/bootstrap-fileinput/themes/explorer-fas/theme.js" rel="stylesheet">
    <script src="/static/plugins/bootstrap-fileinput/js/locales/zh.js"></script>


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
    <ul class="typebox" id="typeList">
        <c:forEach items="${fileTypes}" var="item">
            <li class="" value="${item.id}" id="${item.type}" onclick="getFileData(this.value);">${item.typeName}<span class="redcle"></span></li>
        </c:forEach>
    </ul>

    <div class="down_line"></div>

    <!--file列表-->
    <div id="file">
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
                               placeholder="输入文件标题/作者、上传日期"/>
                    </div>

                    <div class="form-group">
                        <button type="button" onclick="searchArticle();" class="btn btn-block btn-info ">搜索</button>
                    </div>

                    <span style=""></span>
                    <div class="form-group" style="float: right;">
                        <button type="button" data-target="#uploadModal" data-toggle="modal"
                                class="btn btn-block btn-info ">上传文件
                        </button>
                    </div>
                </form>
            </div>
            <br/>
            <div class="bnsbox">
                <table id="fileList" class="table table-bordered " style="width: 100%">
                    <thead>
                    <tr>
                        <th style="display: none;">id</th>
                        <th>文件名</th>
                        <th>上传人</th>
                        <th>文件大小</th>
                        <th>上传日期</th>
                        <th>下载次数</th>
                        <th>扩展名</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <!-- 【删除文件】弹出窗内容 -->
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
                    <h4 align="center">是否删除此文件?</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmDelete();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【禁止下载】弹出窗内容 -->
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
                    <h4 align="center">确定禁止下载？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmCancel();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【允许下载】弹出窗内容 -->
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
                    <h4 align="center">确定允许下载？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmPublish();">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 【上传文件】弹出窗内容 -->
    <div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">选择文件</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" title="Your custom upload logic">Save</button>
                </div>
            </div>
        </div>
    </div>


</section>


<script type="text/javascript">


    $(document).ready(function () {

        //加载数据
        getFileData(1);
        $("#file").show();
        $("#fileUpload").fileinput({
            showPreview: false,
            showUpload: false,
            elErrorContainer: '#kartik-file-errors',
            //allowedFileExtensions: ["jpg", "png", "gif"]
            //uploadUrl: '/site/file-upload-single'
        });
    });


    //上传文件
    function uploadFile() {

    }

    $("#txt_file").on("fileuploaded", function (event, data, previewId, index) {

    });


    var typeID;
    var fileID;
    var keyword;
    //加载File数据
    function getFileData(data) {
        typeID = data;
        var id = typeID - 1;
        $("#typeList li").removeClass("active");
        $("#typeList li:eq("+id+")").addClass("active");
        var table = $('#fileList').DataTable({
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
                url: "${pageContext.request.contextPath}/fileManage/getFileList",
                type: "POST",
                data: {
                    keyword: keyword,
                    typeID:typeID
                }
            },
            //参数显示

            "columns": [
                {"data": "id", 'sClass': "text-center", "bSortable": false, "visible": false},
                {"data": "fileName", 'sClass': "text-center", "searching": true},
                {"data": "uploader", 'sClass': "text-center", "searching": true,'width': '10%',},
                {"data": "size", 'sClass': "text-center", "searching": true,'width': '10%',},
                {"data": "uploadTime", 'sClass': "text-center", "searching": true,'width': '10%',},
                {"data": "downloadCounts", 'sClass': "text-center", "searching": true, 'width': '10%'},
                {"data": "extension", 'sClass': "text-center", "searching": true},
                {
                    "data": "id", 'sClass': "text-center", 'width': '20%',
                    "render": function (data, type, full, meta) {
                        var str = "";
                        str += '<div class="btn-group">';
                        if (status == 0) {
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editArticle(' + data + ');>下载</button>';
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=publish(' + data + ');>发布</button>';
                        } else if (status == 1) {
                            str += '<button type="button" class="btn btn-sm btn-default" onclick=editArticle(' + data + ');>下载</button>';
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






    function confirmUpload() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/fileManage/uploadFile",
            async: true,//默认就是true
            dataType: "json",
            data: {typeID: typeID},
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

    //删除文件
    function deleteFile(data) {
        fileID = data;
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