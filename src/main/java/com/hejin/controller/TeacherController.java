package com.hejin.controller;

import com.hejin.model.Task;
import com.hejin.model.Teacher;
import com.hejin.service.ITaskService;
import com.hejin.service.IUserService;
import com.hejin.util.UtilTool;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
    @Resource
    private IUserService userService;

    @Resource
    private ITaskService taskService;

    @RequestMapping("/teachermess.do")
    public String teacherForword(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String forword = "";
        String flag = request.getParameter("flag");
        if ("MANAGER".equals(flag)) {
            forword = "teacher";
        } else if ("ADD".equals(flag)) {
            forword = "addTeacher";
        }
        return forword;
    }

    @RequestMapping("/addteacher.do")
    public String addTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        if ("N".equals(flag)) {
            return "teacher";
        }
        String teachername = request.getParameter("teachername");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        UUID uuid = UUID.randomUUID();
        String tid = uuid.toString();
        UtilTool utilTool = new UtilTool();
        String tno = utilTool.intIdProduct();
        /*int itno = 100000;
        int totalRow = this.userService.selectTotalRow();
        int s = itno + totalRow + 1;
        String tno = Integer.toString(s);*/
        int row = this.userService.addTeacher(tid, tno, teachername, password, phone);
        if (row >= 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/sellectAllTeacher.do")
    public String selectAllTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Teacher> teacherList = this.userService.selectAllTeacher();
        String username = request.getParameter("username");
        Cookie username2 = new Cookie("username", username);
        username2.setMaxAge(60*30);
        response.addCookie(username2);

        String flag = "teacher";
        request.setAttribute("flag",flag);
        request.setAttribute("teachers", teacherList);
        return "managernew";
    }

    @RequestMapping("/deleteTeacher.do")
    public String deleteTeacher(HttpServletResponse response, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String tid = request.getParameter("tid");
        int row = this.userService.deleteTeacher(tid);
        if (row >= 0) {
            return "success";
        }
        return "error";
    }

    @RequestMapping("/updateTeacher.do")
    public String updateTeacher(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        if ("N".equals(flag)) {
            String tid = request.getParameter("tid");
            Teacher teacher = this.userService.selectByTid(tid);
            request.setAttribute("teacher", teacher);
            return "updateteacher";
        }
        String tid = request.getParameter("tid");
        String teachername = request.getParameter("teachername");
        String tno = request.getParameter("tno");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        int state = this.userService.updateTeacher(tid, teachername, tno, password, phone);
        if (state>=0){
            request.setAttribute("teachername",teachername);
            return "successteacher";
        }
        return "error";
    }

    @RequestMapping("/selectAllFile.do")
    public String selectAllFile(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String teachername = request.getParameter("teachername");
        String flag = "allfile";
        request.setAttribute("flag",flag);
        List<Task> tasks = this.taskService.selectAllFile(teachername);
        request.setAttribute("tasks",tasks);

        return "teacherpage";
    }

    @RequestMapping("/selectByName.do")
    public String selectByName(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String teachername = request.getParameter("teachername");
        Teacher teacher = this.userService.selectTeacherByName(teachername);
        request.setAttribute("teacher",teacher);
        //return "updateteacher";
        return "updateteacher";
    }

    @RequestMapping("/taskScore.do")
    public String taskScore(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String taskid = request.getParameter("taskid");
        String goal = request.getParameter("goal");
        String flag = request.getParameter("flag");
        String evaluation = request.getParameter("evaluation");
        request.setAttribute("taskid",taskid);
        HttpSession session = request.getSession();
        Object username = session.getAttribute("username");
        String teachername = username.toString();
        if ("N".equals(flag)){
            return "goalevaluation";
        }
        int state = this.taskService.updateScore(taskid, goal,evaluation);
        if (state>=0){
            request.setAttribute("teachername",teachername);
            return "successteacher";
        }
        return "error";
    }
}
