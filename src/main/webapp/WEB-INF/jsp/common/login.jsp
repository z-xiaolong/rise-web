<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CMS</title>

    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- jQuery 2.2.0 -->
    <script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
    <!-- Bootstrap 3.3.5 -->
    <script src="/static/bootstrap/js/bootstrap.min.js"></script>
    <!--page css-->
    <link rel="stylesheet" href="/static/css/local/login.css"/>
</head>


<body style="min-width: 494px;" id="s1" background="/static/images/background.png">
<div class="header container-fluid">
    <div class="" style="margin: 30px auto;">
        <!-- logo预留 -->
        <img class=" logo" id="logo"/>
    </div>
</div>
<div class="container-fluid bg-content">
    <div class=" login-content">
        <div style="text-align: center"><font style="color:#ffffff;font-size: 30px;"><img
                src="/static/images/download.png" style="text-align: center; height: 100%; width: 100%"></font></div>
        <div id="Msg" align="center" style="color: red;height: 20px;">${Msg }</div>
        <div id="logins">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="text" name="userName" id="username" placeholder="请输入用户名"/>
                <input type="password" name="password" id="password" placeholder="请输入密码"/>

                <input type="radio" name="type" checked="checked" value="1"
                       style="margin-top: 10px; margin-left:30px; color:#ffffff; cursor: pointer;"/>
                <label style="color: #ffffff; margin-right: 7px;">管理员</label>
                <input type="radio" name="type" value="2"
                       style="margin-top: 10px; color:#ffffff; cursor: pointer;"/>
                <label style="color: #ffffff; margin-right: 7px;">教师</label>
                <input type="radio" name="type" value="3"
                       style="margin-top: 10px; color:#ffffff; cursor: pointer;"/>
                <label style="color: #ffffff">学生</label>
                <button class="login-submit">登&nbsp;&nbsp;录</button>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(".login-submit").click(function () {
        var password = $("#password").val();
        var username = $("#username").val();
        if (username == "") {
            $("#Msg").text("请输入用户名!");
            return false;
        }
        if (password == "") {
            $("#Msg").text("请输入密码!");
            return false;
        }
    });
</script>
</html>