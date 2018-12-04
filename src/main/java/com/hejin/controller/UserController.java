package com.hejin.controller;

import com.hejin.model.Announce;
import com.hejin.model.Student;
import com.hejin.model.Teacher;
import com.hejin.model.User;
import com.hejin.service.IAnnounceService;
import com.hejin.service.ICourseService;
import com.hejin.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private IUserService userService;

    @Resource
    private IAnnounceService announceService;

    @Resource
    private ICourseService courseService;

    @RequestMapping("/showUser.do")
    public String selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        /*Cookie username2 = new Cookie("username", username);
        username2.setMaxAge(60*30);
        response.addCookie(username2);*/
        HttpSession session = request.getSession();
        session.setAttribute("username",username);

        String password = request.getParameter("password");
        String forword = "error";
        List<Announce> announces = this.announceService.selectAllAnnounce();
        request.setAttribute("announces",announces);

        request.setAttribute("username", username);
        String role1 = request.getParameter("role");
        String flag = "announce";
        User user = null;
        if("R".equals(role1)){
            user = this.userService.selectUserByName(username);
            request.setAttribute("user", user);
            request.setAttribute("flag",flag);
            if (user != null && password.equals(user.getPassword())) {
                forword = "managernew";
            }
        }else if ("T".equals(role1)){
            Teacher teacher = this.userService.selectTeacherByName(username);
            request.setAttribute("teacher",teacher);
            request.setAttribute("flag",flag);
            if (teacher != null && password.equals(teacher.getPassword())) {
                forword = "teacherpage";
            }
        }else if ("S".equals(role1)){
            Student student = this.userService.selectStudentByName(username);
            List<String> coursenames = this.courseService.selectStuCourse(username);
            request.getSession().setAttribute("coursenames",coursenames);
            request.setAttribute("student",student);
            request.setAttribute("flag",flag);
            if (student != null && password.equals(student.getPassword())) {
                forword = "student";
            }
        }
        return forword;
        /*if (password == null) {
            password = "-1";
        }
        User user = this.userService.selectUserByName(username);
        String page = null;
        List<Announce> announces = this.announceService.selectAllAnnounce();
        request.setAttribute("announces",announces);
        request.setAttribute("user", user);
        request.setAttribute("username", username);
        if (user != null && password.equals(user.getPassword())) {
            String role = user.getRole();
            if ("R".equals(role)) {
                page = "manager";
            } else if ("T".equals(role)) {
                page = "teacherpage";
            } else if ("S".equals(role)) {
                page = "student";
            }
            return page;
        }else {
            return "error";
        }*/
        /*
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        long userId = Long.parseLong(request.getParameter("id"));
        User user = this.userService.selectUser(userId);
        ObjectMapper mapper = new ObjectMapper();
        response.getWriter().write(mapper.writeValueAsString(user));
        response.getWriter().close();
        */
    }

    @RequestMapping("/managerMess.do")
    public String managerMess(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        User user = this.userService.selectUserByName(username);
        request.setAttribute("user", user);
        return "managerpersonmess";
    }

    @RequestMapping("/selectAllUser.do")
    public String selectAllUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<User> resultSet = this.userService.selectAllUser();
        request.setAttribute("result",resultSet);
        return "hj";
    }
        @RequestMapping("/updateMess.do")
    public String updatePersonMess(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String Sid = request.getParameter("id");
        long id = Long.parseLong(Sid);
        int row = this.userService.updatePersonMess(id, username, password, email);
        if (row>=1){
            return "success";
        }
        return "error";
    }
}