package com.hejin.service.impl;

import com.hejin.dao.ITaskDao;
import com.hejin.model.Task;
import com.hejin.service.ITaskService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("taskService")
public class TaskServiceImpl implements ITaskService{

    @Resource
    private ITaskDao taskDao;

    @Override
    public int insertTask(String taskid,String taskname,String teachername,String taskurl,String studentname,String res) {
        return this.taskDao.insertTask(taskid,taskname,teachername,taskurl,studentname,res);
    }

    @Override
    public List<Task> selectAllFile(String teachername){
        return this.taskDao.selectAllFile(teachername);
    }

    @Override
    public Task selectTaskById(String taskid){
        return this.taskDao.selectTaskById(taskid);
    }

    @Override
    public int updateScore(String taskid,String goal,String evaluation){
        return this.taskDao.updateScore(taskid,goal,evaluation);
    }
}
