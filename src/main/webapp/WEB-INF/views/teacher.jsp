<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/7
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>teacher</title>
</head>
<script type="text/javascript">
    function teachermess() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/teacher/teachermess.do?flag=ADD";
        f1.submit();
    }
    
    function checkallteacher() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/teacher/sellectAllTeacher.do";
        f1.submit();
    }
</script>
<body>
<form method="post" id="form1">
    <input type="button" value="添加教师信息" onclick="teachermess()" ><br><br>
    <input type="button" value="查看所有教师信息" onclick="checkallteacher()"><br><br>
</form>
</body>
</html>
