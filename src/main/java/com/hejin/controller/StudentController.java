package com.hejin.controller;

import com.hejin.model.CnameHomework;
import com.hejin.model.Student;
import com.hejin.model.Task;
import com.hejin.service.ICourseService;
import com.hejin.service.ITaskService;
import com.hejin.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Resource
    private ICourseService courseService;
    @Resource
    private ITaskService taskService;
    @Resource
    private IUserService userService;

    @RequestMapping("/uploadfile.do")
    public String uploadFile(MultipartFile file, HttpServletRequest request) throws IOException {
        request.setCharacterEncoding("UTF-8");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        String res = sdf.format(new Date());
        //upload文件位置
        String realPath = request.getSession().getServletContext().getRealPath("/upload");
        //原始文件名称
        String originalFilename = file.getOriginalFilename();
        String title = request.getParameter("title");
        String course = request.getParameter("course2");
        String studentname = request.getParameter("username");
        /*if (course==null&&course==""){
            String message = "没有课程名称，上传失败";
            request.setAttribute("message",message);
            return "student";
        }*/
        //老师名字，用来创建文件夹
        String teacherName = this.courseService.selectTeacherName(course);
        //新文件名 传这个到数据库
        String newFileName = title + res + studentname + originalFilename.substring(originalFilename.lastIndexOf("."));
        // 创建年月老师文件夹
        Calendar date = Calendar.getInstance();
        File dateDirs = new File(date.get(Calendar.YEAR) + File.separator + (date.get(Calendar.MONTH) + 1) + File.separator + teacherName);
        // 新文件
        File newFile = new File(realPath + File.separator + dateDirs + File.separator + newFileName);
        // 判断目标文件所在目录是否存在
        if (!newFile.getParentFile().exists()) {
            // 如果目标文件所在的目录不存在，则创建父目录
            newFile.getParentFile().mkdirs();
        }
        // 将内存中的数据写入磁盘
        file.transferTo(newFile);
        // 完整的url
        String fileUrl = date.get(Calendar.YEAR) + "/" + (date.get(Calendar.MONTH) + 1) + "/" + newFileName;
        //将作业信息路径存到task表中，用于老师下载作业。title teachername
        UUID uuid = UUID.randomUUID();
        String taskid = uuid.toString();
        String taskurl = realPath + File.separator + dateDirs + File.separator + newFileName;
        int state = this.taskService.insertTask(taskid, newFileName, teacherName, taskurl,studentname,res);
        request.setAttribute("studentname",studentname);
        return "successstudent";
    }

    @RequestMapping("/stucourse.do")
    public String stuCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        List<String> coursenames = this.courseService.selectStuCourse(username);
        request.setAttribute("coursenames", coursenames);
        request.setAttribute("username", username);
        return "student";
    }

    @RequestMapping("/download.do")
    public String downloadTask(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String taskid = request.getParameter("taskid");
        Task task = this.taskService.selectTaskById(taskid);
        String file = task.getTaskurl();
        //获取输入流
        File file1 = new File(file);
        long length = file1.length();
        String size = String.valueOf(length);
        FileInputStream fileInputStream = new FileInputStream(file1);
        BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
        String filename = task.getTaskname();
        filename = URLEncoder.encode(filename, "UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //response.AddHeader("Content-Length", bytes.Length.ToString());
        response.addHeader("Content-Length",size);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while ((len = bufferedInputStream.read())!=-1){
            out.write(len);
            out.flush();
        }
        return "success";
    }

    @RequestMapping("/forword.do")
    public String selectAllStudent(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        String forword = "";
        if("ALL".equals(flag)){
            forword = "studentpage";
        }else if ("ADD".equals(flag)){
            forword = "addStudent";
        }
        return forword;
    }

    @RequestMapping("/addStudent")
    public String addStudent(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String studentname = request.getParameter("studentname");
        String password = request.getParameter("password");
        String smajor = request.getParameter("smajor");
        String sgrade = request.getParameter("sgrade");
        String sclass = request.getParameter("class");
        UUID uuid = UUID.randomUUID();
        String sid = uuid.toString();
        UUID uuid1 = UUID.randomUUID();
        String sno = uuid1.toString();
        int state = this.userService.addStudent(sid, sno, studentname, password, smajor, sgrade, sclass);
        if (state>=1){
            return "success";
        }
        return "error";
    }

    @RequestMapping("/selectByName.do")
    public String selectByName(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String studentname = request.getParameter("username");
        Student student = this.userService.selectStudentByName(studentname);
        request.setAttribute("student",student);
        return "studentmess";
    }

    @RequestMapping("/selectAllHomework.do")
    public String selectAllHomework(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String studentname = request.getParameter("studentname");
        List<CnameHomework> cnameHomeworks = this.userService.selectAllHomework(studentname);
        request.setAttribute("cnameHomeworks",cnameHomeworks);
        String flag = "allHomework";
        request.setAttribute("flag",flag);
        return "student";
    }

    @RequestMapping("/allstudent.do")
    public String allStudent(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        List<Student> students = this.userService.selectAllStudent();
        String username = request.getParameter("username");
        Cookie username2 = new Cookie("username", username);
        username2.setMaxAge(60*30);
        response.addCookie(username2);

        String flag = "student";
        request.setAttribute("flag",flag);
        request.setAttribute("students",students);
        return "managernew";
    }

    @RequestMapping("/deleteStudent.do")
    public String deleteStudent(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String sid = request.getParameter("sid");
        int state = this.userService.deleteStudent(sid);
        if (state>=1){
            return "success";
        }
        return "error";
    }

    @RequestMapping("/updateStudent.do")
    public String updateStudent(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String sid = request.getParameter("sid");
        String flag = request.getParameter("flag");
        if ("N".equals(flag)){
            Student student = this.userService.selectStudentById(sid);
            request.setAttribute("student",student);
            return "studentmess";
        }
        String studentname = request.getParameter("studentname");
        String sno = request.getParameter("sno");
        String password = request.getParameter("password");
        String sgrade = request.getParameter("sgrade");
        String smajor = request.getParameter("smajor");
        String sclass = request.getParameter("sclass");
        int state = this.userService.updateStudent(sid, sno, studentname, password, smajor, sgrade, sclass);
        if (state>=1){
            request.setAttribute("studentname",studentname);
            return "successstudent";
        }
        return "error";
    }

    @RequestMapping("/checkGoal.do")
    public String checkGoal(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String studentname = request.getParameter("studentname");
        List<Task> tasks = this.userService.checkGoal(studentname);
        request.setAttribute("flag","goal");
        request.setAttribute("tasks",tasks);
        return "student";
    }
}
