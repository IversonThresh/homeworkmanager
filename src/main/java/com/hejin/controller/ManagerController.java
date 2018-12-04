package com.hejin.controller;

import com.hejin.model.Course;
import com.hejin.service.ICourseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Resource
    private ICourseService courseService;

    @RequestMapping("/managerMess.do")
    public String managerMess(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        if ("N".equals(flag)) {
            return "course";
        }
        UUID uuid = UUID.randomUUID();
        String courseid = uuid.toString();
        String coursename = request.getParameter("coursename");
        String cmajor = request.getParameter("cmajor");
        String cgrade = request.getParameter("cgrade");
        String tno = request.getParameter("tno");
        this.courseService.addCourse(courseid, coursename, cmajor, cgrade, tno);
        return "success";
    }

    @RequestMapping("/selectAllCourse.do")
    public String selectAllCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Course> courses = this.courseService.selectAllCourse();
        request.setAttribute("courses",courses);
        request.setAttribute("flag","course");
        return "managernew";
    }
}
