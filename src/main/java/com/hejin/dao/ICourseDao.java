package com.hejin.dao;

import com.hejin.model.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICourseDao {
    int addCourse(@Param("courseid") String courseid,@Param("coursename") String coursename,@Param("cmajor") String cmajor,@Param("cgrade") String cgrade,@Param("tno") String tno);

    List<String> selectStuCourse(String username);

    String selectTeacherName(String course);

    List<Course> selectAllCourse();
}
