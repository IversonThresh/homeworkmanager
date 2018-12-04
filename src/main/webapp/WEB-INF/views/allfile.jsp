<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/21
  Time: 8:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>allfile</title>
</head>
<body>
<table border="1" align="center">
    <thead>
    <tr>
        <th>作业编号</th>
        <th>作业题目</th>
        <th>学生姓名</th>
        <th>作业预览</th>
        <th>下载作业</th>
        <th>作业评分</th>
    </tr>
    </thead>
    <tbody id="mainbody">
    <c:forEach items="${tasks}" var="task">
        <tr>
            <td>${task.getTaskid()}</td>
            <td>${task.getTaskname()}</td>
            <td>${task.getStudentname()}</td>
            <td><a href="http://localhost:8080/zuoyeguanli/teacher/deleteTeacher.do">作业预览</a></td>
            <td><a href="http://localhost:8080/zuoyeguanli/student/download.do?taskid=${task.getTaskid()}">作业下载</a>
            </td>
            <td><a href="http://localhost:8080/zuoyeguanli/teacher/taskScore.do?taskid=${task.getTaskid()}&flag=N">作业评分</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
