<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Task List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h1 class="my-4">Task List</h1>
        <a href="/task_form.jsp" class="btn btn-primary mb-3">Create New Task</a>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Priority</th>
                    <th>Assigned To</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Loop through tasks -->
                <tr>
                    <td>Test Task</td>
                    <td>PENDING</td>
                    <td>HIGH</td>
                    <td>John Doe</td>
                    <td>
                        <a href="/task/{task.id}" class="btn btn-info">View</a>
                        <a href="/task/{task.id}/edit" class="btn btn-warning">Edit</a>
                        <a href="/task/{task.id}/delete" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
