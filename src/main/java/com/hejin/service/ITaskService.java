package com.hejin.service;

import com.hejin.model.Task;

import java.util.List;

public interface ITaskService {
    public int insertTask(String taskid,String taskname,String teachername,String taskurl,String studentname,String res);

    public List<Task> selectAllFile(String teachername);

    public Task selectTaskById(String taskid);

    public int updateScore(String taskid,String goal,String evaluation);
}
