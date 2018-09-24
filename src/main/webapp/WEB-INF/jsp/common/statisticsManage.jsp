<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/static/bootstrap/table/bootstrap-table.css" />
    <link rel="stylesheet" href="/static/plugins/bootstrap-fileinput/css/fileinput.min.css" />
    <script type="text/javascript" src="/static/plugins/jQuery/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="/static/bootstrap/js/bootstrap.js" ></script>
    <script type="text/javascript" src="/static/bootstrap/table/bootstrap-table.js" ></script>
    <script type="text/javascript" src="/static/plugins/bootstrap-fileinput/js/fileinput.js"></script>
    <script type="text/javascript" src="/static/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
    <script type="text/javascript" src="/static/js/fileInput.js"></script>
</head>

<body>

<div class="container-fluid">
    <form id="form" action="upload/insert" method="post" enctype="multipart/form-data">
        <div class="row form-group">
            <div class="col-sm-12">
                <input id="input-id" name="file" multiple type="file" data-show-caption="true">
            </div>
        </div>
    </form>
</div>
</body>
</html>