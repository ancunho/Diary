<%@ page import="com.cunho.model.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    UserVO userVO = (UserVO) request.getAttribute("UserVO");
    if (request.getAttribute("UserVO") == null) {
        String USERNAME = null;
        String PASSWORD = null;

        Cookie[] cookies = request.getCookies();
        for(int i = 0; cookies != null && i < cookies.length; i++) {
            if(cookies[i].getName().equals("UserVO")) {
                USERNAME = cookies[i].getValue().split("-")[0];
                PASSWORD = cookies[i].getValue().split("-")[1];
            }
        }
        if (USERNAME == null) {USERNAME = "";}
        if (PASSWORD == null) {PASSWORD = "";}
        pageContext.setAttribute("UserVO",new UserVO(USERNAME,PASSWORD));
    } else {
        response.sendRedirect("index.jsp");
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

<div class="col-md-4 col-md-offset-4 col-lg-4 col-lg-offset-4 col-sm-4 col-sm-offset-4 loginBox">
    <form role="form" action="login" method="post">
        <div class="form-group">
            <label for="USERNAME">用户名：</label>
            <input type="text" class="form-control" value="${UserVO.USERNAME}" id="USERNAME" name="USERNAME" placeholder="请输入用户名">
        </div>
        <div class="form-group">
            <label for="PASSWORD">密码：</label>
            <input type="password" class="form-control" value="${UserVO.PASSWORD}" id="PASSWORD" name="PASSWORD" placeholder="请输入密码">
        </div>

        <div class="checkbox">
            <label>
                <input type="checkbox" name="REMEMBER" value="1" class="rememberMe"> 记住我
            </label>
            <span>${ERRORMSG}</span>
        </div>
        <button type="submit" class="btn btn-success btn-block loginSubmit">登录</button>
    </form>
</div>



<script src="js/jquery-1.9.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/common.js"></script>
</body>
</html>