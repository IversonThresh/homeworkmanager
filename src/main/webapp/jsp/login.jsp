<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>学生管理系统</title>
    <link href="/zuoyeguanli/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<script src="/zuoyeguanli/jquery/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
    var flag;//判断是否可以提交
    var userFlag = false;
    var passFlag = false;

    function checkUser() {  //判断用户名输入是否为空，如果为空给出错误提示
        var userElement = document.getElementById("username"); //获得user输入标签
        var userNullTip = document.getElementById("userNullTip");  //获得提示标签
        if (userElement.value.length == 0) {
            userNullTip.innerHTML = "<font color='red'>用户名不能为空！</font>";//设<label>标签红色提示内容
        }
        else {
            userFlag = true;
        }
    }

    function focusUser() {
        var userNullTip = document.getElementById("userNullTip");
        userNullTip.innerHTML = "";   //隐藏红色提示文字
        userFlag = false;
    }

    function checkPassword() {
        var passElement = document.getElementById("password");
        var passNullTip = document.getElementById("passwordNullTip");
        if (passElement.value.length == 0) {
            passNullTip.innerHTML = "<font color='red'>密码不能为空！</font>";//设置红色提示内容
        }
        else {
            passFlag = true;
        }
    }

    function focusPassword() {
        var passNullTip = document.getElementById("passwordNullTip");
        passNullTip.innerHTML = "";
        passFlag = false;
    }

    function submitFlag() {
        if (userFlag == true && passFlag == true) { //如果用户名和密码输入都不为空，则允许提交
            flag = true;
        }
        else {
            if (userFlag == false) {
                var userNullTip = document.getElementById("userNullTip");
                userNullTip.innerHTML = "<font color='red'>用户名不能为空！</font>";//设置红色提示内容
            }
            if (passFlag == false) {
                var passNullTip = document.getElementById("passwordNullTip");
                passNullTip.innerHTML = "<font color='red'>密码不能为空！</font>";//设置红色提示内容
            }
            flag = false;
        }
        return flag;
    }
</script>
<body>
<div id="web">
    <p style="height:180px;"></p>
    <p align="center"><img src="/zuoyeguanli/images/logzi.png"/></p>
    <p style="height:40px;"></p>
    <div class="login">
        <div class="banner">
            <iframe id="frame_banner" src="/zuoyeguanli/sban/banner.html" height="218" width="100%"
                    allowtransparency="true"
                    title="test" scrolling="no" frameborder="0"></iframe>
        </div>
        <form action="/zuoyeguanli/user/showUser.do" method="post">
            <div class="logmain">
                <h1>&nbsp;</h1>
                <div class="logdv">
                    <span class="logzi">用户名：</span>
                    <input name="username" type="text" id="username" class="ipt" value="" onBlur="checkUser()"
                           onfocus="focusUser()" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
                    <label id="userNullTip"></label>
                </div>
                <div class="logdv">
                    <span class="logzi">密 码：</span>
                    <input name="password" type="password" id="password" class="ipt" value="" onBlur="checkPassword()"
                           onfocus="focusPassword()" onkeyup="this.value=this.value.replace(/[, ]/g,'')"/>
                    <label id="passwordNullTip"></label>
                </div>
                <div class="logdv">
                    <p class="logzi">&nbsp;</p>
                    <table>
                        <tr>
                            <td><input name="role" type="radio" value="R" class="cex"/>管理员</td>
                            <td><input name="role" type="radio" value="T" class="cex"/>教师</td>
                            <td><input name="role" type="radio" value="S" class="cex"/>学生</td>
                        </tr>
                    </table>
                </div>
                <div class="logdv" style="height:40px;">
                    <p class="logzi">&nbsp;</p>
                    <input name="tijiao" id="tijiao" type="submit" class="btnbg" value="点击登录"/>
                </div>

            </div>
        </form>
    </div>
    <p style="height:100px;"></p>
    <p align="center">技术支持:西三-703</p>


</div>
</body>
</html>
