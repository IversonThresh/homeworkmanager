package com.hejin.dao;

import com.hejin.model.Announce;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAnnounceDao {
    Integer publishAnnounce(@Param("announceid") String announceid, @Param("announcename") String announcename, @Param("content") String content, @Param("publishtime") String publishtime,@Param("username") String username,@Param("role") String role);
    int teacherPublishTask(@Param("announceid") String announceid, @Param("announcename") String announcename, @Param("content") String content,@Param("role") String role,@Param("username") String username ,@Param("publishtime") String publishtime);
    List<Announce> selectAllAnnounce();
    Announce selectAnnounceById(String announceid);
}
