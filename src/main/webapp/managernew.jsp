<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link rel="icon" type="image/png" href="assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/app.js"></script>
</head>

<body>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="assets/i/logo.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="kuanjie">
                <a href="#">个人中心</a>
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

                <p class="ycfg"><input type="text" class="am-form-field am-input-sm" placeholder="圆角表单域"/></p>
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

        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：清风抚雪</div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">教师信息管理</a></h3>
            <ul>
                <li><a href="#">添加教师</a></li>
                <li><a href="http://localhost:8080/zuoyeguanli/teacher/sellectAllTeacher.do">查看所有教师</a></li>
            </ul>
            <h3 class="am-icon-cart-plus"><em></em> <a href="#"> 学生信息管理</a></h3>
            <ul>
                <li><a href="#">添加学生</a></li>
                <li><a href="#">查看所有学生</a></li>
            </ul>
            <h3 class="am-icon-users on"><em></em> <a href="#">课程管理</a></h3>
            <ul>
                <li><a href="#">添加课程</a></li>
                <li><a href="#">查看所有课程</a></li>
            </ul>
            <h3 class="am-icon-volume-up"><em></em> <a href="#">发布公告</a></h3>
            <ul>
                <li><a href="#">发布公告</a></li>
                <li><a href="#">查看所有公告</a></li>
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
                returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>
    </div>

    <div class=" admin-content">

        <div class="daohang">

        </div>


        <div class="admin-biaogelist">

            <div class="listbiaoti am-cf">
                <ul class="am-icon-users"> 公告列表</ul>
                <!--这里打开的是新页面-->
            </div>


            <form class="am-form am-g">
                <table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped">
                    <thead>
                    <tr class="am-success">
                        <th class="table-check"><input type="checkbox"/></th>

                        <th class="table-id">ID</th>
                        <th class="table-title">公告标题</th>
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


                <ul class="am-pagination am-fr">
                    <li class="am-disabled"><a href="#">«</a></li>
                    <li class="am-active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">»</a></li>
                </ul>


                <hr/>
            </form>

        </div>

    </div>


</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/polyfill/rem.min.js"></script>
<script src="assets/js/polyfill/respond.min.js"></script>
<script src="assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="assets/js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>