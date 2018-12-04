<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/30
  Time: 8:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/user/showUser.do" method="post">
    <table>
    <tr><td>姓名：</td><td><input type="text" id="name"></td></tr>
    <tr><td>密码：</td><td><input type="password" id="password"></td></tr>
    </table>
    <button type="submit">登录</button>
</form>
</body>
</html>
