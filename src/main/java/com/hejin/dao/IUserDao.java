package com.hejin.dao;

import com.hejin.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {

    User selectUser(long id);

    User selectUserByName(String username);

    List<User> selectAllUser();

    Integer updatePersonMess(@Param("id") Long id,@Param("username") String username,@Param("password") String password,@Param("email") String email);

    int addTeacher(@Param("tid") String tid,@Param("tno") String tno,@Param("teachername") String teachername,@Param("password") String password,@Param("phone") String phone);

    int selectTotalRow();

    List<Teacher> selectAllTeacher();

    int deleteTeacher(String tid);

    Teacher selectByTid(String tid);

    int updateTeacher(@Param("tid") String tid,@Param("tno") String tno,@Param("teachername") String teachername,@Param("password") String password,@Param("phone") String phone);

    Teacher selectTeacherByName(String teachername);

    //student
    int addStudent(@Param("sid") String sid,@Param("sno") String sno,@Param("studentname") String studentname,@Param("password") String password,@Param("smajor") String smajor,@Param("sgrade") String sgrade,@Param("sclass") String sclass);

    List<Student> selectAllStudent();

    int deleteStudent(String sid);

    Student selectStudentById(String sid);

    int updateStudent(@Param("sid") String sid,@Param("sno") String sno,@Param("studentname") String studentname,@Param("password") String password,@Param("smajor") String smajor,@Param("sgrade") String sgrade,@Param("sclass") String sclass);

    Student selectStudentByName(String studentname);

    List<CnameHomework> selectAllHomework(String studentname);

    List<Task> checkGoal(String studentname);
}