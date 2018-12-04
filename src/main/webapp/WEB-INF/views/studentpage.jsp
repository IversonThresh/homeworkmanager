<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/24
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>studentpage</title>
</head>
<script src="/zuoyeguanli/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#addstu").click(function () {
           form1.action = "/zuoyeguanli/student/forword.do?flag=ADD";
           form1.submit();
        });

        $("#allstudent").click(function () {
           form1.action = "/zuoyeguanli/student/allstudent.do";
           form1.submit();
        });

    });
</script>
<body>
<form method="post" id="form1">
    <input type="button" value="添加学生信息" id="addstu"><br><br>
    <input type="button" value="查看所有学生信息" id="allstudent"><br><br>
</form>
</body>
</html>
