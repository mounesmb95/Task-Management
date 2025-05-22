package com.taskmanagement.controller;

import com.taskmanagement.model.User;
import com.taskmanagement.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UserWebController {

    @Autowired
    private UserService userService;

    @GetMapping("/create")
    public String showCreateUserForm(Model model) {
        model.addAttribute("user", new User());
        return "create-user"; // create-user.jsp
    }

    @PostMapping("/create")
    public String createUser(@ModelAttribute User user) {
        try {
            userService.createUser(user);  // Save the user
            return "redirect:/dashboard";  // Redirect to the dashboard after user creation
        } catch (Exception e) {
            e.printStackTrace();  // Print the stack trace for debugging
            return "error";  // Show an error page if user creation fails
        }
    }

    @GetMapping("/list")
    public String listUsers(Model model) {
        try {
            List<User> users = userService.getAllUsers();
            model.addAttribute("users", users);
            return "user-list"; // JSP file: user-list.jsp
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // fallback error.jsp
        }
    }

}
