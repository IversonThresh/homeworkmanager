package com.hejin.service.impl;

import com.hejin.dao.IAnnounceDao;
import com.hejin.model.Announce;
import com.hejin.service.IAnnounceService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("announceService")
public class AnnounceService implements IAnnounceService{
    @Resource
    private IAnnounceDao announceDao;
    @Override
    public Integer publishAnnounce(String announceid,String announcename,String content,String publishtime,String username,String role){
        return this.announceDao.publishAnnounce(announceid,announcename,content,publishtime,username,role);
    }

    @Override
    public int teacherPublishTask(String id,String announcename,String content,String role,String teachername,String publishtime){
        return this.announceDao.teacherPublishTask(id,announcename,content,role,teachername,publishtime);
    }

    @Override
    public List<Announce> selectAllAnnounce(){
        return this.announceDao.selectAllAnnounce();
    }

    @Override
    public Announce selectAnnounceById(String announceid){
        return this.announceDao.selectAnnounceById(announceid);
    }
}
