package com.taskmanagement.service;


import com.taskmanagement.dto.TaskDTO;
import com.taskmanagement.model.Task;

import java.util.List;

public interface TaskService {
    Task createTask(Task task);
    Task updateTask(Long id, TaskDTO taskDTO);
    void deleteTask(Long id);
    Task getTaskById(Long id);
    List<Task> getAllTasks();
	Task createTask(TaskDTO taskDTO);
	List<Task> searchTasksByKeyword(String keyword);
	
}

