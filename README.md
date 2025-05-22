# 📝 Task Management System

A full-stack Task Management Web Application built using **Spring Boot**, **Spring Security**, **JSP**, and **MySQL**. It supports **Admin and User login roles** where:

- 👨‍💼 **Admin** can create users and assign tasks
- 👤 **Users** can log in and view tasks assigned to them

---

## 📌 Features

- 🔐 Role-Based Authentication & Authorization (Admin/User)
- ✅ Task CRUD (Create, Read, Update, Delete)
- 🔍 Search Tasks by Title or Description
- 👨‍💻 Admin:
  - Add and manage users
  - Create and assign tasks
- 🙋‍♂️ User:
  - View their assigned tasks
- 📅 Priority, Status, and Due Date tracking
- 🔒 Password encryption using BCrypt
- 🔄 Live reload with Spring DevTools
- 🌐 RESTful routing with JSP frontend

---



<details>
<summary>Click to expand</summary>

- Login Page  
- Admin Dashboard  
- Create Task  
- User Dashboard  


</details>

---

## 🛠️ Tech Stack

| Layer         | Technology                      |
|--------------|----------------------------------|
| Backend       | Spring Boot, Spring Security    |
| Frontend      | JSP, HTML, Bootstrap            |
| Database      | MySQL                           |
| ORM           | Spring Data JPA                 |
| Security      | Spring Security, BCrypt         |
| Tools         | Maven, Lombok, DevTools         |

---

## ⚙️ Setup Instructions

### 1. Clone the repository
bash
git clone https://github.com/your-username/task-management.git
cd task-management


Configure application.properties
properties
Copy
Edit
spring.datasource.url=jdbc:mysql://localhost:3306/taskdb
spring.datasource.username=root
spring.datasource.password=yourpassword
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
3. Run MySQL and create database
sql
Copy
Edit
CREATE DATABASE taskdb;
4. Build & Run
bash
Copy
Edit
mvn clean install
mvn spring-boot:run
Visit http://localhost:8080/login

👥 Default Roles
Role	Username	Password	Access
Admin	admin	admin123	Manage all tasks & users
User	user1	user123	View assigned tasks only

