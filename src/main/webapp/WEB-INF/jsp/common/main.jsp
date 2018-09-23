<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>RiseLab</title>
    <!-- <link rel="shortcut icon" type="image/x-icon" href="dist/img/zhongxing_icon.ico"> -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="/static/css/AdminLTE.css">
    <link rel="stylesheet" href="/static/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="/static/css/ace/ace.min.css">
    <link rel="stylesheet" href="/static/plugins/fonts/font-awesome-4.4.0/css/font-awesome.min.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.2.0 -->
    <script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="/static/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="/static/plugins/datatables/dataTables.bootstrap.min.js"></script>
    <!-- AdminLTE App -->
    <script src="/static/js/app.min.js"></script>
    <style>
        #menuFrame {
            width: 100%;
            min-height: 768px;
        }

        #systemConfig {
            position: absolute;
            right: 5px;
            top: 60px;
            background: #fff;
            list-style: none;
            text-align: center;
            padding: 10px 40px;
            display: none;
        }

        #systemConfig li {
            padding: 8px 0;
            font-size: 16px;
        }
    </style>

</head>
<!-- skin-purple 这个class可以控制主题颜色 -->
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <!-- 头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><font size="4"><b id="s1">C</b>MS</font></span>
            <span class="logo-lg"><b id="project">C</b>MS</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"><font size="4"><b>&nbsp;&nbsp;&nbsp;&nbsp;RiseLab</b></font><span
                    class="sr-only"></span>
            </a>


            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button --> <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <!-- The user image in the navbar-->
                        <!-- hidden-xs hides the username on small devices so only the image appears. -->
                        <span class="hidden-xs"><i class="fa fa-fw fa-user"></i><font size="4">${user.userName }</font></span>
                    </a>

                    </li>
                    <li onclick="systemConfigShow();"><a href="#" data-toggle="control-sidebar"><i
                            class="fa fa-gear"></i></a></li>

                    <ul id="systemConfig" class="systemConfigClass">
                        <li onclick="changePassword();"><a href="#" style="color: black;">修改密码</a></li>
                        <li onclick="operatLogs();"><a href="#" style="color: black;">操作日志</a></li>
                        <li onclick=""><a href="${pageContext.request.contextPath}/logout" style="color: black;">退出登录</a></li>
                    </ul>
                </ul>
            </div>
        </nav>
    </header>

    <!-- 左边栏 -->
    <aside class="main-sidebar">
        <section class="sidebar">
            <!-- sidebar menu: : style can be found in sidebar.less -->
            <ul class="sidebar-menu" style="position: absolute;top: 60px;bottom: 0;overflow-y: auto;left: 0;right: 0;">
                <li id="kongbai" style="height: 1px; display:none;">
                    <a href="${pageContext.request.contextPath}/toWelcomePage"
                       target="menuFrame">
                    </a>
                </li>
                <!-- 菜单管理 -->
                <c:forEach items="${Menus}" var="menu">
                    <li class="treeview" id="${menu.id}">
                        <a href="${pageContext.request.contextPath}${menu.link}" target="menuFrame">
                            <i class="${menu.icon}">
                            </i>
                            <span>${menu.name}</span>
                        </a>
                    </li>
                </c:forEach>

            </ul>
        </section>
    </aside>

    <!-- 内容显示部分 -->

    <div class="content-wrapper">
        <!-- Main content -->
        <section class="content" style=" margin-top:56px">

            <!-- Your Page Content Here -->
            <iframe id="menuFrame" name="menuFrame"
                    src="${pageContext.request.contextPath}/toWelcomePage" width="100%"
                    height=100% frameborder="0" marginheight="0" marginwidth="0" onLoad="iFrameHeight()">
            </iframe>

        </section>
    </div>

    <!-- 底部 -->
    <footer class="main-footer" style="text-align: center">
        <!-- To the right -->
        <div class="pull-right hidden-xs"></div>
        <!-- Default to the left -->
        <strong>
            <span id="copyright" style="color: #333;">2016-2018
                <a style="color: #333;" href="http://www.swu-rise.net.cn">RISE</a>
                <span style="padding: 0 3px;">|</span>西南大学25教1001<span style="padding: 0 1px;">|</span>
                <a style="color: #333;" href="https://github.com/RISE-SWU/">GitHub</a>
            </span>
        </strong>
    </footer>

</div>

<!-- 【修改密码】弹出窗内容 -->
<div class="modal" id="changeMyPassword" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" align="center">修改密码</h4>
            </div>
            <div class="modal-body">

                <table style="width: 100%">
                    <tr>
                        <td width="15%"></td>
                        <td width="70%"><input onmouseout="checkOldPassword();" id="oldPassword" type="password"
                                               class="form-control" placeholder="请输入原始密码"/></td>
                        <td width="15%">
                            <img alt="" id="oldPW_OK" style="display: none;" src="/static/images/u66.png">
                            <img alt="" id="oldPW_NO" style="display: none;" src="/static/images/u64.png">
                        </td>
                    </tr>
                    <tr>
                        <td width="15%"></td>
                        <td><br></td>
                        <td></td>
                    <tr>
                    <tr>
                        <td width="15%"></td>
                        <td><input type="password" onmouseout="checkNewPassword();" id="newPassword"
                                   class="form-control" placeholder="请输入6~16位的新密码"/></td>
                        <td width="15%">
                            <img alt="" id="newPW_OK" style="display: none;" src="/static/images/u66.png">
                            <img alt="" id="newPW_NO" style="display: none;" src="/static/images/u64.png">
                        </td>
                    </tr>
                    <tr>
                        <td width="15%"></td>
                        <td><br></td>
                        <td></td>
                    <tr>
                    <tr>
                        <td width="15%"></td>
                        <td><input type="password" onmouseout="checkNewPasswordTwice();" id="newPassword2"
                                   class="form-control" placeholder="请重新输入6~16位的新密码"/></td>
                        <td width="15%">
                            <img alt="" id="newPW_OK_2" style="display: none;" src="/static/images/u66.png">
                            <img alt="" id="newPW_NO_2" style="display: none;" src="/static/images/u64.png">
                        </td>
                    </tr>
                    <tr>
                        <td width="15%"><br></td>
                        <td></td>
                        <td></td>
                    <tr>
                    <tr>
                        <td width="15%"><br></td>
                        <td><span id="oldPW_tishi" style="color: red;display: none;">原始密码错误</span></td>
                        <td></td>
                    <tr>

                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>&nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" onclick="sureChangeMyPassword();">确定</button>
            </div>
        </div>
    </div>
</div>

<!-- 日志展示 -->
<div class="modal" id="showOperateLogs" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog" style="width:1150px ;height:auto">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                        class="sr-only">Close</span></button>
                <h4 class="modal-title" align="center">操作日志列表</h4>
            </div>
            <div class="modal-body" align="center">
                <table id="logsDetailTable" class="table table-bordered ">
                    <thead>
                    <tr>
                        <th style="display:none">id</th>
                        <th style="width:10%">账号</th>
                        <th style="width:10%">IP</th>
                        <th style="width: 10%">内容</th>
                        <th style="width: 10%">时间</th>
                        <th style="width: 10%">响应时间</th>
                        <th style="width: 10%">状态</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%-- <input type="hidden" value="${user_role_id}" id="user_role_id"/> --%>
<input type="hidden" value="${user.userName}" id="username"/>
<script type="text/javascript" language="javascript">

    $(document).ready(function () {

    });


    function cancealShow() {
        $("#audit_tishi").hide();
    }


    //设置菜单是否显示
    var showOrNot = true;

    function systemConfigShow() {
        if (showOrNot) {
            $("#systemConfig").show();
            showOrNot = false;
        } else {
            $("#systemConfig").hide();
            showOrNot = true;
        }
    }

    //系统设置菜单点击事件
    $(".systemConfigClass li").click(function () {
        $("#systemConfig").hide();
        showOrNot = true;
    })

    /*********************************修改密码开始***********************************************/

    //修改密码
    function changePassword() {
        $("#changeMyPassword").modal("toggle");
        $("#oldPW_OK").hide();
        $("#oldPW_NO").hide();
        $("#newPW_OK").hide();
        $("#newPW_NO").hide();
        $("#newPW_OK_2").hide();
        $("#newPW_NO_2").hide();
        $("#oldPW_tishi").hide();
        var oldPassword = $("#oldPassword").val("");
        var newPassword = $("#newPassword").val("");
        var newPassword2 = $("#newPassword2").val("");

    }

    //确定修改密码
    function sureChangeMyPassword() {
        var oldPassword = $("#oldPassword").val();
        var newPassword = $("#newPassword").val();
        var newPassword2 = $("#newPassword2").val();
        if (oldPassword.length < 1) {
            $("#oldPW_OK").hide();
            $("#oldPW_NO").show();
            return;
        }
        if (newPassword.length < 6 || newPassword.length > 16) {
            $("#newPW_OK").hide();
            $("#newPW_NO").show();
            return;
        }
        if (newPassword2.length < 6 || newPassword2.length > 16 || newPassword2 != newPassword) {
            $("#newPW_OK_2").hide();
            $("#newPW_NO_2").show();
            return;
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/changePassword",
            async: true,//默认就是true
            dataType: "json",
            data: {
                oldPassword: oldPassword,
                newPassword: newPassword
            },
            success: function (result) {  //function1()
                if (result.status == 1) {
                    $("#changeMyPassword").modal("toggle");
                } else if (result.status == 3) {
                    $("#oldPW_tishi").show();
                } else {
                    alert("操作失败，请联系管理员");
                }
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });
    }

    function checkOldPassword() {
        var oldPassword = $("#oldPassword").val();
        if (oldPassword.length < 1) {
            $("#oldPW_OK").hide();
            $("#oldPW_NO").show();
        } else {
            $("#oldPW_OK").show();
            $("#oldPW_NO").hide();
        }
    }

    function checkNewPassword() {
        var newPassword = $("#newPassword").val();
        if (newPassword.length < 6 || newPassword.length > 16) {
            $("#newPW_OK").hide();
            $("#newPW_NO").show();
            $("#newPassword").val("");
        } else {
            $("#newPW_OK").show();
            $("#newPW_NO").hide();
        }
    }

    function checkNewPasswordTwice() {
        var newPassword2 = $("#newPassword2").val();
        var newPassword = $("#newPassword").val();
        if (newPassword2.length < 6 || newPassword2.length > 16 || newPassword2 != newPassword) {
            $("#newPW_OK_2").hide();
            $("#newPW_NO_2").show();
            $("#newPassword2").val("");
        } else {
            $("#newPW_OK_2").show();
            $("#newPW_NO_2").hide();
        }
    }

    /********************************修改密码结束***********************************************/

    /*********************************退出登录*************************************************/
    function logout() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/logout",
            async: true,//默认就是true
            dataType: "json",
            data: {},
            success: function (result) {
                window.location.href = '${pageContext.request.contextPath}';
            },
            failure: function (result) {
                alert('网络错误！');
            },
        });

    }

    /****************************************************************************************/

    /*********************************退出登录*************************************************/
    //操作日志
    function operatLogs() {
        var table = $('#logsDetailTable').DataTable({
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
                url: "${pageContext.request.contextPath}/getAllLogs",
                type: "GET",
                data: {}
            },
            //参数显示
            "columns": [
                {"data": "id", 'sClass': "text-center", "bSortable": false, "visible": false},
                {"data": "account", 'sClass': "text-center",},
                {"data": "ip", 'sClass': "text-center"},
                {"data": "description", 'sClass': "text-center"},
                {
                    "data": "operationTime", 'sClass': "text-center",
                    "render": function (data, type, full, meta) {
                        return getMyDate(data, 1);
                    }
                },
                {"data":"responseTime",'sClass':"text-center"},
                {"data":"status",'sClass':"text-center",
                    "render": function (data, type, full, meta) {
                        if(data == 1){
                            return "成功";
                        }
                        else if(data == 0){
                            return "失败";
                        }
                    }
                },
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
        $("#showOperateLogs").modal("toggle");
    }

    /****************************************************************************************/

    function iFrameHeight() {
        document.getElementById("menuFrame").height=0;
        document.getElementById("menuFrame").height=document.getElementById("menuFrame").contentWindow.document.body.scrollHeight;

/*        var ifm = document.getElementById("menuFrame");
        var subWeb = document.frames ? document.frames["menuFrame"].document : ifm.contentDocument;
        if (ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
            ifm.width = subWeb.body.scrollWidth;
        }*/
    }

    //处理左侧菜单栏是否选中
    var lastLi = "kongbai";
    $(document).ready(function () {
        $("li").click(function () {
            //alert($(this).attr("id"));
            $("#" + lastLi).attr("class", "treeview");
            var li = $(this).attr("id");
            lastLi = li;
            $("#" + li).attr("class", "active treeview");

            window.localStorage.setItem("leftactive", lastLi);
            var seid = window.localStorage.getItem("leftactive");
            if (seid == "kongbai") {

            } else {
                $("#" + seid).siblings().removeClass('active');//移除同级元素的选中状态
                console.log(seid)
                $("#" + seid).addClass("active");//元素的选中状态
            }
        });
    });


    $(".main-header a").click(function () {
        window.localStorage.setItem("leftactive", "kongbai");
    })


    //日期处理
    function getMyDate(time, type) {
        //时间格式：yyyy-MM-dd HH:mm:ss
        if (type == 1) {
            var oDate = new Date(time),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth() + 1,
                oDay = oDate.getDate(),
                oHour = oDate.getHours(),
                oMin = oDate.getMinutes(),
                oSen = oDate.getSeconds(),
                oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay) + ' ' + getzf(oHour) + ':' + getzf(oMin) + ':' + getzf(oSen);//最后拼接时间
            return oTime;
        }
        //时间格式：yyyy-MM-dd
        if (type == 2) {
            var oDate = new Date(time),
                oYear = oDate.getFullYear(),
                oMonth = oDate.getMonth() + 1,
                oDay = oDate.getDate(),
                oTime = oYear + '-' + getzf(oMonth) + '-' + getzf(oDay);//最后拼接时间
            return oTime;
        }
    }

    //补0操作,当时间数据小于10的时候，给该数据前面加一个0
    function getzf(num) {
        if (parseInt(num) < 10) {
            num = '0' + num;
        }
        return num;
    }


</script>

</body>
</html>
