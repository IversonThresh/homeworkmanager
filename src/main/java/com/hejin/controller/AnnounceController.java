package com.hejin.controller;

import com.hejin.model.Announce;
import com.hejin.service.IAnnounceService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/announce")
public class AnnounceController {

    @Resource
    private IAnnounceService announceService;

    @RequestMapping("/publishAnnounce.do")
    public String selectUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String flag = request.getParameter("flag");
        if ("N".equals(flag)) {
            return "publishAnnounce";
        }
        String role = "R";
        String username = request.getParameter("username");
        String announcename = request.getParameter("announcename");
        String content = request.getParameter("content");
        UUID uannounceid = UUID.randomUUID();
        String announceid = uannounceid.toString();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String publishtime = simpleDateFormat.format(date);
        Integer row = this.announceService.publishAnnounce(announceid, announcename, content, publishtime,username,role);
        if (row==0){
            return "error";
        }
        return "success";
    }

    @RequestMapping("/teacherPublishTask.do")
    public String teacherPublishTask(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String role = "T";
        UUID uannounceid = UUID.randomUUID();
        String announceid = uannounceid.toString();
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String publishtime = simpleDateFormat.format(date);
        String teachername = request.getParameter("teachername");
        String tasktitle = request.getParameter("tasktitle");
        String content = request.getParameter("content");
        String ts = request.getParameter("ts");
        int state = this.announceService.teacherPublishTask(announceid, tasktitle, content, role, teachername, publishtime);
        if (state>0){
            if ("teacher".equals(ts)){
                request.setAttribute("teachername",teachername);
                return "successteacher";
            }
            return "success";
        }
        return "error";
    }

    @RequestMapping("/selectAnnounce.do")
    public String selectAnnounce(HttpServletRequest request,HttpServletResponse response)throws IOException{
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String announceid = request.getParameter("announceid");
        Announce announce = this.announceService.selectAnnounceById(announceid);
        request.setAttribute("announce",announce);
        return "announce";
    }
}
