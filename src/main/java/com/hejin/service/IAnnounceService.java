package com.hejin.service;

import com.hejin.model.Announce;

import java.util.List;

public interface IAnnounceService {
    public Integer publishAnnounce(String id,String announcename,String content,String publishtime,String username,String role);

    public int teacherPublishTask(String id,String announcename,String content,String role,String teachername,String publishtime);

    public List<Announce> selectAllAnnounce();

    public Announce selectAnnounceById(String announceid);
}
