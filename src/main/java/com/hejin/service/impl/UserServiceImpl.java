package com.hejin.service.impl;

import com.hejin.dao.IUserDao;
import com.hejin.model.*;
import com.hejin.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserDao userDao;

    //manager
    public User selectUser(long userId) {
        return this.userDao.selectUser(userId);
    }

    @Override
    public List<User> selectAllUser(){
        return this.userDao.selectAllUser();
    }

    @Override
    public User selectUserByName(String username) {
        return this.userDao.selectUserByName(username);
    }

    @Override
    public Integer updatePersonMess(Long id,String username,String password,String email){
        return  this.userDao.updatePersonMess(id, username, password, email);
    }

    //teacher
    @Override
    public int addTeacher(String tid,String tno,String teachername,String password,String phone){
        return this.userDao.addTeacher(tid, tno, teachername, password, phone);
    }

    @Override
    public int selectTotalRow(){
        return this.userDao.selectTotalRow();
    }

    @Override
    public List<Teacher> selectAllTeacher(){
        return this.userDao.selectAllTeacher();
    }

    @Override
    public int deleteTeacher(String tid){
        return this.userDao.deleteTeacher(tid);
    }

    @Override
    public Teacher selectByTid(String tid){
        return this.userDao.selectByTid(tid);
    }

    @Override
    public int updateTeacher(String tid,String tno,String teachername,String password,String phone){
        return this.userDao.updateTeacher(tid, teachername, tno, password, phone);
    }

    @Override
    public Teacher selectTeacherByName(String teachername){
        return this.userDao.selectTeacherByName(teachername);
    }

    //student
    @Override
    public int addStudent(String sid,String sno,String studentname,String password,String smajor,String sgrade,String sclass){
        return this.userDao.addStudent(sid,sno,studentname,password,smajor,sgrade,sclass);
    }

    @Override
    public List<Student> selectAllStudent(){
        return this.userDao.selectAllStudent();
    }

    @Override
    public int deleteStudent(String sid){
        return this.userDao.deleteStudent(sid);
    }

    @Override
    public Student selectStudentById(String sid){
        return this.userDao.selectStudentById(sid);
    }

    @Override
    public int updateStudent(String sid,String sno,String studentname,String password,String smajor,String sgrade,String sclass){
        return this.userDao.updateStudent(sid, sno, studentname, password, smajor, sgrade, sclass);
    }

    @Override
    public Student selectStudentByName(String studentname){
        return this.userDao.selectStudentByName(studentname);
    }

    @Override
    public List<CnameHomework> selectAllHomework(String studentname){
        return this.userDao.selectAllHomework(studentname);
    }

    @Override
    public List<Task> checkGoal(String studentname){
        return this.userDao.checkGoal(studentname);
    }

}