package com.hejin.service;

import com.hejin.model.Course;

import java.util.List;

public interface ICourseService {
    public int addCourse(String courseid,String coursename,String cmajor,String cgrade,String tno);
    public List<String> selectStuCourse(String username);
    public String selectTeacherName(String course);
    public List<Course> selectAllCourse();
}
