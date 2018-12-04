<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/22
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>goal</title>
</head>
<style type="text/css">
    /*评分框的样式*/
    .goal-table {
        width: 500px;
        position: fixed;
        border: #ebebeb solid 1px;
        height: 360px;
        top: 50%;
        left: 50%;
        background: #B1D2EC;
        box-shadow: 0px 0px 20px #ddd;
        z-index: 9999;
        margin-left: -250px;
        margin-top: -140px;
    }

    .goal-title {
        width: 100%;
        margin: 10px 0px 0px 0px;
        text-align: center;
        line-height: 40px;
        height: 40px;
        font-size: 18px;
        position: relative;
    }

    .goal-input-content {
        margin-top: 20px;
    }

    .goal-input {
        overflow: hidden;
        margin: 0px 0px 20px 0px;
    }

    .goal-input label {
        float: left;
        width: 90px;
        padding-right: 10px;
        text-align: right;
        line-height: 35px;
        height: 35px;
        font-size: 14px;
    }

    .goal-input input.list-input {
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

    .goal-title {
        width: 100%;
        margin: 10px 0px 0px 0px;
        text-align: center;
        line-height: 40px;
        height: 40px;
        font-size: 18px;
        position: relative;
    }

    .goal-title span {
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

    .goal-title span a {
        display: block;
    }

    .goal-button {
        width: 30%;
        margin: 30px auto 0px auto;
        line-height: 40px;
        font-size: 14px;
        border: #ebebeb 1px solid;
        text-align: center;
    }

    .goal-button a {
        display: block;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
        $('#goal-button-submit').click(function () {
            alert("dfdsfdf");
            form2.submit();
        });
    });
</script>
<body>
<div class="goal-table">
    <div class="goal-title">作业评分</div>
    <div class="goal-input-content">
        <form method="post" id="form2" action="/zuoyeguanli/teacher/taskScore.do?taskid=${taskid}&flag=Y">
            <input type="hidden" value="${taskid}" name="taskid">
            <input type="hidden" name="flag" value="Y">
            <div class="goal-input">
                <label>作业评分：</label>
                <input type="text" placeholder="请输入分数" name="goal" id="goal" class="list-input"/>
            </div>
            <div class="goal-input">
                <label>作业评价：</label>
                <textarea placeholder="请输入对该作业的评价" name="evaluation" id="evaluation" class="comments"></textarea>
            </div>
            <div class="goal-button"><input type="submit" value="提交"></div>

        </form>
    </div>
</div>
</body>
</html>
