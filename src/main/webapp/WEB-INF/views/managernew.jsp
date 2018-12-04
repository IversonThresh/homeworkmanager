<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="/zuoyeguanli/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/zuoyeguanli/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="/zuoyeguanli/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/zuoyeguanli/assets/css/admin.css">
    <script src="/zuoyeguanli/assets/js/jquery.min.js"></script>
    <script src="/zuoyeguanli/assets/js/app.js"></script>
</head>
<style type="text/css">
    .am-table am-table-bordered am-table-radius am-table-striped tr td {
        height: 20px;
        line-height: 20px;
    }

    .publish-table {
        width: 500px;
        position: fixed;
        border: #ebebeb solid 1px;
        height: 360px;
        top: 50%;
        left: 50%;
        display: none;
        background: #9cdcf2;
        box-shadow: 0px 0px 20px #ddd;
        z-index: 9999;
        margin-left: -250px;
        margin-top: -140px;
    }

    .publish-title {
        width: 100%;
        margin: 10px 0px 0px 0px;
        text-align: center;
        line-height: 40px;
        height: 40px;
        font-size: 18px;
        position: relative;
    }

    .publish-input-content {
        margin-top: 20px;
    }

    .publish-input {
        overflow: hidden;
        margin: 0px 0px 20px 0px;
    }

    .publish-input label {
        float: left;
        width: 90px;
        padding-right: 10px;
        text-align: right;
        line-height: 35px;
        height: 35px;
        font-size: 14px;
    }

    .publish-input input.list-input {
        float: left;
        line-height: 35px;
        height: 35px;
        width: 350px;
        border: #ebebeb 1px solid;
        text-indent: 5px;
    }

    .comments {
        float: left;
        height: 150px;
        width: 350px; /*自动适应父布局宽度*/
        overflow: auto;
        word-break: break-all;
        border: #ebebeb 1px solid;
        text-indent: 5px;
        /*在ie中解决断行问题(防止自动变为在一行显示，主要解决ie兼容问题，ie8中当设宽度为100%时，文本域类容超过一行时，
        当我们双击文本内容就会自动变为一行显示，所以只能用ie的专有断行属性“word-break或word-wrap”控制其断行)*/
    }

    .publish-title {
        width: 100%;
        margin: 10px 0px 0px 0px;
        text-align: center;
        line-height: 40px;
        height: 40px;
        font-size: 18px;
        position: relative;
    }

    .publish-title span {
        position: absolute;
        font-size: 12px;
        right: -20px;
        top: -30px;
        background: #ffffff;
        border: #ebebeb solid 1px;
        width: 40px;
        height: 40px;
        border-radius: 20px;
    }

    .publish-title span a {
        display: block;
    }

    .publish-button {
        width: 30%;
        margin: 30px auto 0px auto;
        line-height: 40px;
        font-size: 14px;
        border: #ebebeb 1px solid;
        text-align: center;
    }

    .publish-button a {
        display: block;
    }


</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#publish').click(function () {
            $('.publish-table').show();
        });

        $('.close-publish').click(function () {
            $('.publish-table').hide();
        });

        $('#publish-button-submit').click(function () {
            form1.action = "/zuoyeguanli/announce/publishAnnounce.do?flag=Y";
            form1.submit();
        });
    });
</script>

<body>
<%--       取出cookie
<%
    String cardid = null ;
    Cookie[] cks = request.getCookies() ;
    if(cks != null)
    {
        // 如果已经设置了cookie ， 则得到它的值，将该值放在卡号文本框的value中
        for(int i=0; i<cks.length; i++)
        {
            if(cks[i].getName().equals("username"))
                cardid = cks[i].getValue();
        }
    }
%>--%>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="/zuoyeguanli/assets/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="kuanjie">

                <%--
                                <a href="http://localhost:8080/zuoyeguanli/user/managerMess.do?username=<%=request.getAttribute("username")%>">个人中心</a>
                --%>
                <a href="http://localhost:8080/zuoyeguanli/user/managerMess.do?username=<%=request.getSession().getAttribute("username")%>">个人中心</a>
                <a href="#">系统设置</a>
            </li>
            <li class="soso">
                <p>
                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="R">管理员</option>
                        <option value="T">教师</option>
                        <option value="S">学生</option>
                    </select>
                </p>

                <p class="ycfg"><input type="text" id="search-text" class="am-form-field am-input-sm" placeholder="请输入搜索名字"/></p>
                <p>
                    <button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button>
                </p>
            </li>


            <li class="am-hide-sm-only" style="float: right;">
                <a href="javascript:;" id="admin-fullscreen">
                    <span class="am-icon-arrows-alt"></span>
                    <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">

    <div class="nav-navicon admin-main admin-sidebar">

        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;">
            欢迎系统管理员：<%=request.getSession().getAttribute("username")%>
        </div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">教师信息管理</a></h3>
            <ul>
                <li><a href="http://localhost:8080/zuoyeguanli/teacher/teachermess.do?flag=ADD">添加教师</a></li>
                <li>
                    <a href="http://localhost:8080/zuoyeguanli/teacher/sellectAllTeacher.do?username=<%=request.getAttribute("username")%>">查看所有教师</a>
                </li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 学生信息管理</a></h3>
            <ul>
                <li><a href="http://localhost:8080/zuoyeguanli/student/forword.do?flag=ADD">添加学生</a></li>
                <li>
                    <a href="http://localhost:8080/zuoyeguanli/student/allstudent.do?username=<%=request.getAttribute("username")%>">查看所有学生</a>
                </li>
            </ul>
            <h3 class="am-icon-users on"><em></em> <a href="#">课程管理</a></h3>
            <ul>
                <li><a href="http://localhost:8080/zuoyeguanli/manager/managerMess.do?flag=N">添加课程</a></li>
                <li><a href="http://localhost:8080/zuoyeguanli/manager/selectAllCourse.do">查看所有课程</a></li>
            </ul>
            <h3 class="am-icon-volume-up"><em></em> <a href="#">发布公告</a></h3>
            <ul>
                <%--<li><a href="http://localhost:8080/zuoyeguanli/announce/publishAnnounce.do?flag=N&username=${username}">发布公告</a>
                </li>--%>
                <li><a href="javascript:void(0);" id="publish">发布公告</a></li>
            </ul>
        </div>
        <!-- sideMenu End -->

        <script type="text/javascript">

            jQuery(".sideMenu").slide({
                titCell: "h3", //鼠标触发对象
                targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect: "slideDown", //targetCell下拉效果
                delayTime: 300, //效果时间
                triggerTime: 150, //鼠标延迟触发时间（默认150）
                defaultPlay: true,//默认是否执行效果（默认true）
                returnDefault: true, //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>
    </div>

    <div class=" admin-content">

        <div class="daohang">

        </div>

        <div class="publish-table">
            <div class="publish-title">发布公告<span><a href="javascript:void(0);" class="close-publish">关闭</a></span></div>
            <div class="publish-input-content">
                <form method="post" id="form1">
                    <input type="hidden" value="${username}" name="username">
                    <div class="publish-input">
                        <label>公告标题：</label>
                        <input type="text" placeholder="请输入标题" name="announcename" id="announcename" class="list-input"/>
                    </div>
                    <div class="publish-input">
                        <label>公告内容：</label>
                        <textarea placeholder="请输入内容要求" name="content" id="content" class="comments"></textarea>
                    </div>
                    <div class="publish-button"><a href="javascript:void(0);" id="publish-button-submit">发布</a></div>
                </form>
            </div>
        </div>

        <div class="admin-biaogelist">

            <div class="listbiaoti am-cf">
                <c:if test="${flag == 'announce'}">
                    <ul class="am-icon-users"> 公告列表</ul>
                </c:if>
                <c:if test="${flag == 'teacher'}">
                    <ul class="am-icon-users"> 教师列表</ul>
                </c:if>
                <c:if test="${flag == 'student'}">
                    <ul class="am-icon-users"> 学生列表</ul>
                </c:if>
                <c:if test="${flag == 'course'}">
                    <ul class="am-icon-users"> 课程列表</ul>
                </c:if>
                <!--这里打开的是新页面-->
            </div>


            <form class="am-form am-g">
                <table width="70%" class="am-table am-table-bordered am-table-radius am-table-striped">
                    <thead>
                    <c:if test="${flag == 'announce' }">
                        <tr class="am-success">
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-title">公告标题</th>
                            <th class="table-title">公告内容</th>
                        </tr>
                    </c:if>
                    <c:if test="${flag == 'teacher' }">
                        <tr class="am-success">
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-id">TID</th>
                            <th class="table-title">教师名称</th>
                            <th class="table-title">手机号码</th>
                            <th class="table-title">删除</th>
                            <th class="table-title">修改</th>
                        </tr>
                    </c:if>
                    <c:if test="${flag == 'student' }">
                        <tr class="am-success">
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-title">学生名字</th>
                            <th class="table-title">密码</th>
                            <th class="table-title">所在专业</th>
                            <th class="table-title">年级</th>
                            <th class="table-title">班级</th>
                            <th class="table-title">删除</th>
                            <th class="table-title">修改</th>
                        </tr>
                    </c:if>
                    <c:if test="${flag == 'course' }">
                        <tr class="am-success">
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-title">课程名称</th>
                            <th class="table-title">专业</th>
                            <th class="table-title">班级</th>
                            <th class="table-title">老师编号</th>
                        </tr>
                    </c:if>
                    </thead>
                    <tbody>
                    <c:if test="${flag == 'announce' }">
                        <c:forEach items="${announces}" var="announce">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>
                                    <a href="/zuoyeguanli/announce/selectAnnounce.do?announceid=${announce.getAnnounceid()}">${announce.getAnnouncename()}</a>
                                </td>
                                <td>${announce.content}</td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <c:if test="${flag== 'teacher' }">
                        <c:forEach items="${teachers}" var="teacher">
                            <tr style="width: 50px">
                                <td><input type="checkbox"/></td>
                                <td>${teacher.tno}</td>
                                <td>${teacher.teachername}</td>
                                <td>${teacher.phone}</td>
                                <td>
                                    <a href="http://localhost:8080/zuoyeguanli/teacher/deleteTeacher.do?tid=${teacher.tid }">删除</a>
                                </td>
                                <td>
                                    <a href="http://localhost:8080/zuoyeguanli/teacher/updateTeacher.do?tid=${teacher.tid }&flag=N">修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <c:if test="${flag== 'student' }">
                        <c:forEach items="${students}" var="student">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${student.getStuname()}</td>
                                <td>${student.getPassword()}</td>
                                <td>${student.getSmajor() }</td>
                                <td>${student.getSgrade()}</td>
                                <td>${student.sclass }</td>
                                <td>
                                    <a href="http://localhost:8080/zuoyeguanli/student/deleteStudent.do?sid=${student.getStudentid()}">删除</a>
                                </td>
                                <td>
                                    <a href="http://localhost:8080/zuoyeguanli/student/updateStudent.do?sid=${student.getStudentid()}&flag=N">修改</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <c:if test="${flag== 'course' }">
                        <c:forEach items="${courses}" var="course">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${course.getCoursename()}</td>
                                <td>${course.getCmajor()}</td>
                                <td>${course.getCgrade() }</td>
                                <td>${course.getTno()}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>


                <%--<ul class="am-pagination am-fr">
                    <li class="am-disabled"><a href="#">«</a></li>
                    <li class="am-active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                </ul>--%>


                <hr/>
            </form>

        </div>

    </div>


</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="/zuoyeguanli/assets/js/polyfill/rem.min.js"></script>
<script src="/zuoyeguanli/assets/js/polyfill/respond.min.js"></script>
<script src="/zuoyeguanli/assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="/zuoyeguanli/assets/js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>