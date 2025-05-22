package com.taskmanagement.service;


import com.taskmanagement.dto.TaskDTO;
import com.taskmanagement.exception.ResourceNotFoundException;
import com.taskmanagement.model.Task;
import com.taskmanagement.model.User;
import com.taskmanagement.repository.TaskRepository;
import com.taskmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    private TaskRepository taskRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Task createTask(TaskDTO taskDTO) {
        Task task = new Task();
        mapDTOToEntity(taskDTO, task);
        return taskRepository.save(task);
    }

    @Override
    public Task updateTask(Long id, TaskDTO taskDTO) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
        mapDTOToEntity(taskDTO, task);
        return taskRepository.save(task);
    }

    @Override
    public void deleteTask(Long id) {
        Task task = taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
        taskRepository.delete(task);
    }

    @Override
    public Task getTaskById(Long id) {
        return taskRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Task not found with id: " + id));
    }

    @Override
    public List<Task> getAllTasks() {
        return taskRepository.findAll();
    }

    private void mapDTOToEntity(TaskDTO dto, Task task) {
        task.setTitle(dto.getTitle());
        task.setDescription(dto.getDescription());
        task.setDueDate(dto.getDueDate());
        task.setPriority(dto.getPriority());
        task.setStatus(dto.getStatus());

        User user = userRepository.findById(dto.getAssignedToId())
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));
        task.setAssignedTo(user);
    }

    @Override
    public Task createTask(Task task) {
        return taskRepository.save(task);
    }
    
    public List<Task> searchTasksByKeyword(String keyword) {
        return taskRepository.findByTitleContainingIgnoreCase(keyword);
    }

}
