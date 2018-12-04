package com.hejin.dao;

import com.hejin.model.Task;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ITaskDao {
    int insertTask(@Param("taskid") String taskid,@Param("taskname") String taskname,@Param("teachername") String teachername,@Param("taskurl") String taskurl,@Param("studentname") String studentname,@Param("res") String res);

    List<Task> selectAllFile(String teachername);

    Task selectTaskById(String taskid);

    int updateScore(@Param("taskid") String taskid,@Param("goal") String goal,@Param("evaluation") String evaluation);
}
