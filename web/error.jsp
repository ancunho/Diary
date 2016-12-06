<%@ page import="com.cunho.model.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
//    if(session.getAttribute("currentUser") != null) {
//        response.sendRedirect("index.jsp");
//    }
    UserVO userVO = (UserVO) request.getSession().getAttribute("currentUser");
    if(userVO != null) {
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
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h1>ERROR Page!!!!!</h1>

</body>
</html>