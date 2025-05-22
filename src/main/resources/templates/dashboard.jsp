<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard - Task Management</title>
</head>
<body>
    <h1>Task Dashboard</h1>

    <table border="1" cellpadding="10" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Priority</th>
                <th>Due Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="task" items="${tasks}">
                <tr>
                    <td>${task.id}</td>
                    <td>${task.title}</td>
                    <td>${task.description}</td>
                    <td>${task.priority}</td>
                    <td>${task.dueDate}</td>
                    <td>${task.status}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="/create">+ Create Task</a>
    

</body>
</html>
