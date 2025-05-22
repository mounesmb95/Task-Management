package com.taskmanagement.controller;

import com.taskmanagement.model.Task;
import com.taskmanagement.model.Priority;
import com.taskmanagement.model.Status;
import com.taskmanagement.service.TaskService;
import com.taskmanagement.service.UserService;  // Ensure this import is present

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TaskWebController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;  // Add this line to inject UserService

    @GetMapping("/dashboard")
    public String viewDashboard(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        List<Task> tasks;

        if (keyword != null && !keyword.trim().isEmpty()) {
            tasks = taskService.searchTasksByKeyword(keyword); // new method in service
        } else {
            tasks = taskService.getAllTasks();
        }

        model.addAttribute("tasks", tasks);
        model.addAttribute("keyword", keyword); // so search bar shows last search
        System.out.println("Loaded tasks: " + tasks.size());

        return "dashboard"; // dashboard.jsp
    }

    

    // Show the create task form
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("task", new Task());
        model.addAttribute("priorities", Priority.values());
        model.addAttribute("statuses", Status.values());
        model.addAttribute("users", userService.getAllUsers());  // Pass all users to the view
        return "create-task"; // create-task.jsp
    }

    // Save a new task
    @PostMapping("/create")
    public String saveTask(@ModelAttribute Task task) {
        taskService.createTask(task);
        return "redirect:/dashboard";
    }

    // Show the edit task form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Task task = taskService.getTaskById(id);
        model.addAttribute("task", task);
        model.addAttribute("priorities", Priority.values());
        model.addAttribute("statuses", Status.values());
        model.addAttribute("users", userService.getAllUsers()); // Add this
        return "edit-task";
    }

    @PostMapping("/update/{id}")
    public String updateTask(@PathVariable Long id, @ModelAttribute Task task) {
        task.setId(id);
        taskService.createTask(task); // or use updateTask() method
        return "redirect:/dashboard";
    }

    @GetMapping("/delete/{id}")
    public String deleteTask(@PathVariable Long id) {
        taskService.deleteTask(id);
        return "redirect:/dashboard";
    }

}
