<%@ page import="com.hejin.model.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/29
  Time: 22:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
dhfdkasjfffffdkfjadksfjkldj!!!!!!!!
<%
    List<User> resultSet=( List<User>)request.getAttribute("result");
    for(User u :resultSet ){
        out.print(u.getUsername()+"--");
    }
%>
${user.username}
${user.password}
${user.role}
</body>
</html>
