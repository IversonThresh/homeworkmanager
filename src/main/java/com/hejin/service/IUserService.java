package com.hejin.service;

import com.hejin.model.*;

import java.util.List;

public interface IUserService {

    //manager
    public User selectUser(long userId);
    public User selectUserByName(String username);
    public List<User> selectAllUser();
    public Integer updatePersonMess(Long id,String username,String password,String email);

    //teacher
    public int addTeacher(String tid,String tno,String teachername,String password,String phone);
    public int selectTotalRow();
    public List<Teacher> selectAllTeacher();
    public int deleteTeacher(String tid);
    public Teacher selectByTid(String tid);
    public int updateTeacher(String tid,String tno,String teachername,String password,String phone);
    public Teacher selectTeacherByName(String teachername);

    //student
    public int addStudent(String sid,String sno,String studentname,String password,String smajor,String sgrade,String sclass);
    public List<Student> selectAllStudent();
    public int deleteStudent(String sid);
    public Student selectStudentById(String sid);
    public int updateStudent(String sid,String sno,String studentname,String password,String smajor,String sgrade,String sclass);
    public Student selectStudentByName(String studentname);
    public List<CnameHomework> selectAllHomework(String studentname);
    public List<Task> checkGoal(String studentname);
}