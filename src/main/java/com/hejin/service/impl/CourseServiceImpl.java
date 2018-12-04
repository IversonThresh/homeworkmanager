package com.hejin.service.impl;

import com.hejin.dao.ICourseDao;
import com.hejin.model.Course;
import com.hejin.service.ICourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("courseService")
public class CourseServiceImpl implements ICourseService {
    @Resource
    private ICourseDao courseDao;
    @Override
    public int addCourse(String courseid,String coursename,String cmajor,String cgrade,String tno){
        return this.courseDao.addCourse(courseid,coursename,cmajor,cgrade,tno);
    }

    @Override
    public List<String> selectStuCourse(String username){
        return this.courseDao.selectStuCourse(username);
    }

    @Override
    public String selectTeacherName(String course){
        return this.courseDao.selectTeacherName(course);
    }

    @Override
    public List<Course> selectAllCourse(){
        return this.courseDao.selectAllCourse();
    }

}
