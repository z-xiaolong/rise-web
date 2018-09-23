<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>

    <title>新闻编辑</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!--引入JS-->
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/static/plugins/datatables/dataTables.bootstrap.css">
    <!-- daterangepicker -->
    <link rel="stylesheet" href="/static/plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- datepicker -->
    <link rel="stylesheet" href="/static/plugins/datepicker/datepicker3.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">

    <link rel="stylesheet" href="/static/plugins/datetimepicker/jquery.datetimepicker.css">
    <!-- local css start-->
    <link rel="stylesheet" href="/static/css/local/common.css">
    <link rel="stylesheet" type="text/css" href="/static/umeditor/default/css/umeditor.css">

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
    <script type="text/javascript" src="/static/plugins/ajaxfileupload/ajaxfileupload.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/static/plugins/datatables/dataTables.bootstrap.min.js"></script>

    <!-- daterangepicker -->
    <script src="/static/plugins/daterangepicker/moment.min.js"></script>
    <script src="/static/plugins/daterangepicker/moment.js"></script>
    <script src="/static/plugins/daterangepicker/daterangepicker.js"></script>

    <!-- datepicker -->
    <script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>

    <script src="/static/plugins/datetimepicker/jquery.datetimepicker.full.js"></script>

    <!-- AdminLTE App -->
    <script src="/static/js/app.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/static/js/demo.js"></script>

    <script type="text/javascript" charset="utf-8" src="/static/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/umeditor/umeditor.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="/static/umeditor/lang/zh-cn/zh-cn.js"></script>

</head>
<body class="hold-transition skin-blue sidebar-mini">

<!-- Content Wrapper. Contains page content -->
<!-- Content Header (Page header) -->
<section class="content-header">
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/articleManage/toArticleManagePage">新闻管理</a></li>
        <li class="active">新闻编辑</li>
    </ol>
    <div class="down_line"></div>

</section>
<!-- Main content -->
<section class="content">
    <table style="width: 100%;">
        <input type="hidden" id="articleID" name="id" value="">

        <tr>
            <td align="center" style="color: red;position: absolute;padding-left: 63px; padding-top: 6px;">标题：</td>
            <td>
                <input type="text" id="title" name="title" class="form-control" style="border-radius: 3px;" value=""
                       placeholder="请输入标题"/>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td align="center" style="color: red;padding-left: 18px;width: 150px;">文章类型：</td>
            <td>
                <select id="type" class="form-control" style="display: inline; width: 160px;border-radius: 3px;" onchange="articleType(this.value);">
                    <c:forEach items="${articleTypes}" var="item">
                        <option value="${item.id}">${item.typeName}</option>
                    </c:forEach>
                </select>

                <select id="subType" class="form-control" style="display: none; width: 160px;border-radius: 3px;" onchange="">
                </select>

                <div style="display: inline">
                    <p align="center" style="color: red;padding-left: 30px;width: 150px; display: inline;">发布日期：</p>
                    <input type="text" style="border-radius: 3px;width:242px; height:34px;text-align:left;border: 1px solid #ccc; display: inline;" id="publishDate" value="" placeholder="请选择时间" class="form-control"/>
                </div>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td></td>
        </tr>
        <tr>
            <td align="center" style="color: red;position: absolute;padding-left: 63px; padding-top: 9px;">内容：
            </td>
            <td>
                <div style="padding-top: 19px;margin-left: -87px;">
                    <script type="text/plain" id="myEditor" name="myEditor"></script>
                </div>
            </td>
        </tr>
    </table>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" onclick="cancelAdd()" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary" onclick="saveArticle()">保存</button>
    </div>
    </form>

    <!-- 【添加新闻】弹出窗内容 -->
    <div class="modal" id="saveArticle" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center">确定添加新闻？</h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button type="button" class="btn btn-primary" onclick="confirmAdd()">确定</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 验证弹出窗内容 -->
    <div class="modal" id="validate" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h4 class="modal-title" align="center">提示</h4>
                </div>
                <div class="modal-body">
                    <h4 align="center" id="errorMsg"></h4>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                </div>
            </div>
        </div>
    </div>

</section>

<script>
    var um;
    $(document).ready(function () {
        um = UM.getEditor('myEditor');

        um.addListener('blur', function () {
            $('#focush2').html('编辑器失去焦点了')
        });
        um.addListener('focus', function () {
            $('#focush2').html('')
        });
    });

    //日期插件相关
    $.datetimepicker.setLocale('zh');
    $("#publishDate").datetimepicker({
        inline:false,	//true-显示，false - 隐藏
        format: 'Y-m-d',
        timepicker: false, //true-显示时间，false - 不显示时间
        height : "50px",
        todayBtn: true,
        todayHighlight: true,
        validateOnBlur: false //当鼠标离开时不清空选择的值
        // minDate : 0 ,//最小日期今天
    });


    function articleType(data){
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/articleManage/getSubArticleTypeList",
            async: true,//默认就是true
            dataType: "json",
            data: {
                articleTypeID: data
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {
                var data = result.data;
                if (data == null || data == "") {
                    $("#subType").css("display","none");
                    $("#subType").children("option").remove();
                } else {
                    $("#subType").children("option").remove();
                    for(var i = 0; i < data.length; i++){
                        $("#subType").append('<option value="'+data[i].id+'">'+data[i].subTypeName+'</option>');
                    }
                    $("#subType").css("display","inline");
                }

            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }


    //保存新闻
    var id;
    var title;
    var type;
    var subType;
    var publishDate;
    var content;
    function saveArticle() {

        id = $("#articleID").val();
        if(id == null || id == ""){
            id = -1;
        }
        title = $("#title").val();
        if(title == null || title == ""){
            $("#validate").modal("toggle");
            $("#errorMsg").text("文章标题不能为空！");
            return;
        }
        type = $("#type").val();
        if(type == null || type == ""){
            $("#validate").modal("toggle");
            $("#errorMsg").text("文章类型不能为空！");
            return;
        }
        subType = $("#subType").val();
        if(subType == null || subType == ""){
            subType = -1;
        }
        publishDate = $("#publishDate").val();
        if(publishDate == null || publishDate == ""){
            $("#validate").modal("toggle");
            $("#errorMsg").text("发布日期不能为空！");
            return;
        }
        content = um.getContent();
        if(content == null || content == ""){
            $("#validate").modal("toggle");
            $("#errorMsg").text("文章内容不能为空！");
            return;
        }
        $("#saveArticle").modal("toggle");
        //confirmAdd(id,title,type,subType,publishDate,content);
    }

    //确定添加
    function confirmAdd() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/articleManage/addArticle",
            async: true,//默认就是true
            dataType: "json",
            data: {
                id: id,
                title: title,
                type: type,
                subType: subType,
                publishTime: publishDate,
                content: content
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                if (XMLHttpRequest.status == 200) {
                    alert("很抱歉，你没有操作权限！");
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            success: function (result) {
                if (result.Msg == "success") {
                    $("#articleTypeName").val("");
                    $("#title").val("");
                    um.setContent("");
                    //加载数据
                    window.location.href = "${pageContext.request.contextPath}/articleManage/toArticleManagePage";
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }
    //取消添加
    function cancelAdd() {
        window.location.href = "${pageContext.request.contextPath}/articleManage/toArticleManagePage";
    }

</script>
</body>
</html>
