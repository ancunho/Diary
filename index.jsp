<%@ page import="com.cunho.model.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    UserVO userVO = (UserVO) request.getSession().getAttribute("currentUser");
    if(userVO == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 101 Template</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/layout.css" rel="stylesheet">
<!--[if lt IE 9]>
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->
</head>
<body>
<div class="header" style="height:70px;">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapse" data-toggle="collapse" data-target="#headerNav">
                    <span class="sr-only">Toggle Nav</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="#this" class="navbar-brand">Cunho</a>
            </div>
            <div class="collapse navbar-collapse" id="headerNav">
                <ul class="nav navbar-nav navbar-left">
                    <li class="active"><a href="#this">asdf</a> </li>
                    <li class="dropdown">
                        <a href="#this" class="dropdown-toggle" data-toggle="dropdown">분류<span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#this">분류1</a> </li>
                            <li><a href="#this">분류2</a> </li>
                            <li><a href="#this">분류3</a> </li>
                            <li class="divider"></li>
                            <li><a href="#this">분류4</a> </li>
                        </ul>
                    </li>
                </ul>
                <!-- login start-->
                <div class="navbar-right" style="margin:0 10px;"><button type="button" class="btn navbar-btn"><span class="glyphicon glyphicon-log-out"></span></button></div>
                <div class="navbar-text navbar-right" style="margin-right:0px;">欢迎光临！cunho </div>
                <!-- //login end -->
                <!-- Not login start-->
                <div class="navbar-right" style="margin-right:0px;"><button type="button" class="btn btn-success navbar-btn">Sign In</button></div>
                <!-- //Not login end -->
            </div>
        </div>
    </nav>
</div>

<div class="contents">
    <div class="container">
        <div class="row">
            <div class="col-md-9">asdf</div>
            <div class="col-md-3">asdf</div>
        </div>
    </div>
</div>

<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
</body>
</html>
