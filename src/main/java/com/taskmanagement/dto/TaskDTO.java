package com.taskmanagement.dto;



import com.taskmanagement.model.Priority;
import com.taskmanagement.model.Status;
import lombok.Data;

import java.time.LocalDate;

@Data
public class TaskDTO {
    private String title;
    private String description;
    private LocalDate dueDate;
    private Priority priority;
    private Status status;
    private Long assignedToId;
}
