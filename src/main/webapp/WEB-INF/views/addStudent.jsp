<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/17
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加学生信息</title>
    <link rel="stylesheet" href="/zuoyeguanli/lib/layui/css/layui.css" media="all"/>
    <link rel="stylesheet" href="/zuoyeguanli/css/login.css"/>
    <link rel="stylesheet" href="/zuoyeguanli/css/tooltips.css"/>


    <script type="text/javascript" src="/zuoyeguanli/js/jquery.min.js"></script>
    <script type="text/javascript" src="/zuoyeguanli/js/jquery.pure.tooltips.js"></script>
    <script type="text/javascript" src="/zuoyeguanli/lib/layui/layui.js"></script>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background: #2d9b95;
            background: -moz-radial-gradient(center, ellipse cover, #2d9b95 0%, #0e1329 100%);
            background: -webkit-radial-gradient(center, ellipse cover, #2d9b95 0%, #0e1329 100%);
            background: -o-radial-gradient(center, ellipse cover, #2d9b95 0%, #0e1329 100%);
            background: -ms-radial-gradient(center, ellipse cover, #2d9b95 0%, #0e1329 100%);
            background: radial-gradient(ellipse at center, #2d9b95 0%, #0e1329 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#2d9b95', endColorstr='#0e1329', GradientType=1);
            background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #2d9b95), color-stop(100%, #0e1329));
        }

        .box {
            background: #000000;
            position: absolute;
            margin-left: -14%;
            z-index: 3;
            opacity: 0.6;
            left: 50%;
        }

        .box-register {
            width: 450px;
            height: 385px;
            margin-top: -8%;
            top: 46%;
        }

    </style>

</head>
<script type="text/javascript">
    function beforeSubmit(form){
        if(form.studentname.value==''){
            alert('用户名不能为空！');
            form.studentname.focus();
            return false;
        }
        if(form.password.value==''){
            alert('密码不能为空！');
            form.password.focus();
            return false;
        }
        if(form.smajor.value==''){
            alert('所在专业不能为空！');
            form.smajor.focus();
            return false;
        }
        if(form.sgrade.value==''){
            alert('年级不能为空！');
            form.sgrade.focus();
            return false;
        }
        if(form.class.value==''){
            alert('班级不能为空！');
            form.class.focus();
            return false;
        }
        return true;
    }
</script>
<body>

<canvas></canvas>

<div class="beg-login-box box box-register layui-anim-rotate" id="login">
    <header>
        <h1 style="color:#FFFFFF">请输入学生相关信息</h1>
    </header>
    <div class="beg-login-main">
        <form action="/zuoyeguanli/student/addStudent.do" class="layui-form" method="post" onSubmit="return beforeSubmit(this);">

            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input id="username_register" type="text" name="studentname" lay-verify="userName" autocomplete="off"
                       placeholder="请输入学生姓名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input id="password_register" type="password" name="password" lay-verify="password" autocomplete="off"
                       placeholder="请输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe6b2;</i>
                </label>
                <input id="regcode_register" type="text" name="smajor" lay-verify="regcode" autocomplete="off"
                       placeholder="请输入学生专业" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe6b2;</i>
                </label>
                <input id="sgrade" type="text" name="sgrade" lay-verify="regcode" autocomplete="off"
                       placeholder="请输入学生年级" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe6b2;</i>
                </label>
                <input id="class" type="text" name="class" lay-verify="regcode" autocomplete="off"
                       placeholder="请输入学生班级" class="layui-input">
            </div>
            <div class="layui-form-item" >
                <div class="beg-pull-left beg-login-remember" style="color:#FFFFFF;margin-top: 6%;">
                    <button type="submit" class="layui-btn" onclick="register();return false;">
                        <i class="layui-icon">&#xe650;</i> 添加
                    </button>
                </div>

            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    window.requestAnimFrame = (function () {
        return window.requestAnimationFrame ||
            window.webkitRequestAnimationFrame ||
            function (callback) {
                window.setTimeout(callback, 1000 / 60);
            };
    })();

    var canvas = document.getElementsByTagName("canvas")[0];
    var ctx = canvas.getContext("2d");
    var w = $(document).width();
    var h = $(document).height();
    canvas.width = w;
    canvas.height = h;

    var mols = [];

    function init() {
        for (var i = 0; i < 18; i++) {
            var mol = new generate_mol("C8H10N4O2");
            mols.push(mol);
            var mol = new generate_mol("C6H6O");
            mols.push(mol);
            var mol = new generate_mol("C6H6");
            mols.push(mol);
        }
    }

    function draw() {
        canvas.width = canvas.width;
        for (var i = 0; i < mols.length; i++) {
            var m = mols[i];
            m.x += m.vx;
            if (m.x >= w - 100 || m.x <= 0) {
                m.vx = -m.vx;
            }
            m.y += m.vy;
            if (m.y >= h - 100 || m.y <= 0) {
                m.vy = -m.vy;
            }

            m.r += 0.005;
            m.draw();
        }
    }

    function generate_mol(mol) {
        this.x = Math.random() * w;
        this.y = Math.random() * h;
        this.vx = Math.random() * -2;
        this.vy = Math.random() * 2;
        this.vr = 0.1;
        this.r = Math.random() * Math.PI;
        this.draw = function () {
            if (mol == "C6H6O") {
                //Phenol
                ctx.save();
                ctx.translate(this.x + 20, this.y + 80);
                ctx.rotate(this.r);
                ctx.translate(-this.x + 20, -this.y - 80);
                ctx.beginPath();
                ctx.moveTo(this.x, this.y + 5);
                ctx.lineTo(this.x, this.y + 30);
                ctx.lineTo(this.x - 26, this.y + 45);
                ctx.lineTo(this.x - 26, this.y + 75);
                ctx.lineTo(this.x, this.y + 90);
                ctx.lineTo(this.x + 26, this.y + 75);
                ctx.lineTo(this.x + 26, this.y + 45);
                ctx.lineTo(this.x, this.y + 30);
                ctx.moveTo(this.x - 20, this.y + 47);
                ctx.lineTo(this.x - 20, this.y + 73);
                ctx.moveTo(this.x, this.y + 83);
                ctx.lineTo(this.x + 22, this.y + 70);
                ctx.moveTo(this.x, this.y + 36);
                ctx.lineTo(this.x + 22, this.y + 49);
                ctx.strokeStyle = "rgba(255,255,255,0.2)";
                ctx.lineWidth = 3;
                ctx.stroke();
                ctx.fillStyle = "rgba(255,255,255,0.2)";
                ctx.font = "15px Arial";
                ctx.fillText("OH", this.x - 5, this.y);
                ctx.closePath();
                ctx.restore();
            }
            else if (mol == "C8H10N4O2") {
                //Caffeine
                ctx.save();
                ctx.translate(this.x + 20, this.y + 80);
                ctx.rotate(this.r);
                ctx.translate(-this.x + 20, -this.y - 80);
                ctx.beginPath();
                ctx.moveTo(this.x, this.y + 5);
                ctx.lineTo(this.x, this.y + 22);
                ctx.moveTo(this.x - 9, this.y + 35);
                ctx.lineTo(this.x - 26, this.y + 45);
                ctx.lineTo(this.x - 26, this.y + 75);
                ctx.lineTo(this.x, this.y + 90);
                ctx.lineTo(this.x + 18, this.y + 80);
                ctx.moveTo(this.x + 26, this.y + 68);
                ctx.lineTo(this.x + 26, this.y + 45);
                ctx.lineTo(this.x + 9, this.y + 35);
                ctx.moveTo(this.x - 20, this.y + 47);
                ctx.lineTo(this.x - 20, this.y + 73);
                ctx.moveTo(this.x + 23, this.y + 42);
                ctx.lineTo(this.x + 36, this.y + 32);
                ctx.moveTo(this.x + 26, this.y + 46);
                ctx.lineTo(this.x + 39, this.y + 36);
                ctx.moveTo(this.x + 34, this.y + 81);
                ctx.lineTo(this.x + 48, this.y + 90);
                ctx.moveTo(this.x - 2, this.y + 88);
                ctx.lineTo(this.x - 2, this.y + 110);
                ctx.moveTo(this.x + 3, this.y + 88);
                ctx.lineTo(this.x + 3, this.y + 110);
                ctx.moveTo(this.x - 26, this.y + 45);
                ctx.lineTo(this.x - 46, this.y + 38);
                ctx.moveTo(this.x - 60, this.y + 44);
                ctx.lineTo(this.x - 74, this.y + 58);
                ctx.lineTo(this.x - 61, this.y + 77);
                ctx.moveTo(this.x - 58, this.y + 49);
                ctx.lineTo(this.x - 68, this.y + 59);
                ctx.moveTo(this.x - 46, this.y + 82);
                ctx.lineTo(this.x - 26, this.y + 73);
                ctx.moveTo(this.x - 60, this.y + 86);
                ctx.lineTo(this.x - 70, this.y + 100);
                ctx.strokeStyle = "rgba(255,255,255,0.2)";
                ctx.lineWidth = 3;
                ctx.stroke();
                ctx.fillStyle = "rgba(255,255,255,0.2)";
                ctx.font = "15px Arial";
                ctx.fillText("CH", this.x - 5, this.y);
                ctx.fillText("3", this.x + 18, this.y + 6);
                ctx.fillText("N", this.x - 5, this.y + 37);
                ctx.fillText("O", this.x + 38, this.y + 35);
                ctx.fillText("N", this.x + 21, this.y + 81);
                ctx.fillText("CH", this.x + 50, this.y + 99);
                ctx.fillText("3", this.x + 72, this.y + 105);
                ctx.fillText("O", this.x - 5, this.y + 124);
                ctx.fillText("N", this.x - 59, this.y + 42);
                ctx.fillText("N", this.x - 59, this.y + 84);
                ctx.fillText("H  C", this.x - 98, this.y + 114);
                ctx.fillText("3", this.x - 87, this.y + 119);
                ctx.closePath();
                ctx.restore();
            }
            else if (mol == "C6H6") {
                //Benzene
                ctx.save();
                ctx.translate(this.x + 20, this.y + 80);
                ctx.rotate(this.r);
                ctx.translate(-this.x + 20, -this.y - 80);
                ctx.beginPath();
                ctx.moveTo(this.x, this.y + 30);
                ctx.lineTo(this.x - 26, this.y + 45);
                ctx.lineTo(this.x - 26, this.y + 75);
                ctx.lineTo(this.x, this.y + 90);
                ctx.lineTo(this.x + 26, this.y + 75);
                ctx.lineTo(this.x + 26, this.y + 45);
                ctx.lineTo(this.x, this.y + 30);
                ctx.moveTo(this.x - 20, this.y + 47);
                ctx.lineTo(this.x - 20, this.y + 73);
                ctx.moveTo(this.x, this.y + 83);
                ctx.lineTo(this.x + 22, this.y + 70);
                ctx.moveTo(this.x, this.y + 36);
                ctx.lineTo(this.x + 22, this.y + 49);
                ctx.strokeStyle = "rgba(255,255,255,0.2)";
                ctx.lineWidth = 3;
                ctx.stroke();
                ctx.closePath();
                ctx.restore();
            }
        }
    }

    init();

    function animloop() {
        draw();
        requestAnimFrame(animloop);
    }

    animloop();
</script>

</body>
</html>

