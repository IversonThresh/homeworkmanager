<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/12
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>announce</title>
</head>
<body>
<form action="/zuoyeguanli/announce/publishAnnounce.do?flag=Y&role=R" method="post">
    <div style="text-align: center">
        <table border="1" style="position: absolute">
            <thead style="width:500px;height:400px;border: 1px solid blue;">
            <input type="text" name="announcename" style="width:300px;" value="">
            </thead>
            <br><br>
            <tbody style="width:500px;height:400px;border: 1px solid blue;">
            <%--<input type="text" name="content" style="width: 300px;height: 400px;">--%>
            <textarea name="content" id="content" cols="30" rows="10"style="width: 300px;height: 400px;">

            </textarea>
            </tbody>
        </table><br>
        <input type="submit" value="发布">
    </div>
</form>
</body>
</html>
