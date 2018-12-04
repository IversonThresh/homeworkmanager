<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/1
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<title>双飞翼页面布局</title>
<style type="text/css">
    * {
        padding: 0;
        margin: 0;
    }

    body, html {
        height: 100%;
        font: 20px/40px "microsoft yahei";
        color: black;
    }

    #container {
        width: 100%;
        margin: 0 auto;
        height: 100%;
    }

    #header, #footer {
        height: 12.5%;
        width: 100%;
        background: burlywood;
    }

    #main {
        height: 75%;
    }

    #center, #left, #right {
        height: 100%;
        float: left;
    }

    #center {
        width: 100%; /*这里center已经占满了中间这一栏 left right都是在它的上面*/
        background: #2aabd2;
    }

    #left {
        background: lightgrey;
        width: 15%;
        margin-left: -100%; /*向左偏移自己的100% 回到上一行的开头*/
    }

    #right {
        background: lightgray;
        width: 15%;
        margin-left: -15%; /*向左偏移自己本身的长度   回到了上一行的末尾*/
    }

    #main-inner {
        padding-left: 15%; /*回到自己的开头*/
    }
</style>
</head>
<script src="/zuoyeguanli/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(window).load(function () {
        });
    });

    function manaMess() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/user/managerMess.do?username=<%=request.getAttribute("username")%>";
        f1.submit();
    }

    function stumess() {
        form1.action = "/zuoyeguanli/student/forword.do?flag=ALL";
        form1.submit();
    }

    function publish() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/announce/publishAnnounce.do?flag=N&username=${user.username}";
        f1.submit();
    }

    function courseManager() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/manager/managerMess.do?flag=N";
        f1.submit();
    }

    function teachermess() {
        var f1 = document.getElementById("form1");
        f1.action = "/zuoyeguanli/teacher/teachermess.do?flag=MANAGER";
        f1.submit();
    }

</script>
<body onload="submitForm2()">
<div id="container">
    <div id="header">
        <h2>欢迎${user.username}管理员</h2>
    </div>
    <div id="main">
        <div id="center">
            <div id="main-inner">
                <table border="1" align="center">
                    <thead>
                    <tr>
                        <th>公告标题</th><br>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${announces}" var="announce">
                        <tr>
                            <td><a href="/zuoyeguanli/announce/selectAnnounce.do?announceid=${announce.getAnnounceid()}">${announce.getAnnouncename()}</a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div id="left">
            <form method="post" id="form1">
                <button id="mangerpersonmess" onclick="manaMess()">个人信息管理</button>
                <br><br>
                <input type="button" value="学生信息管理" onclick="stumess()"><br><br>
                <input id="publishmess" type="button" onclick="publish()" value="发布公告"><br><br>
                <input name="courseman" id="courseman" type="button" onclick="courseManager()" value="课程管理"><br><br>
                <input type="button" value="教师信息管理" onclick="teachermess()"><br><br>
            </form>
        </div>
        <div id="right">
            right
        </div>
    </div>
    <div id="footer">
        footer
    </div>
</div>
</body>
</html>
