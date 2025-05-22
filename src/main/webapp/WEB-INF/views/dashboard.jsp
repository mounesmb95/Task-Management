<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Task Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="text-primary">Task Dashboard</h2>
        <div>
            <a href="/user/create" class="btn btn-success me-2">Create New User</a>
            <a href="/create" class="btn btn-primary">Create New Task</a>
        </div>
    </div>

    <!-- Search Form -->
    <form class="mb-4" method="get" action="/dashboard">
        <div class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="Search by title..." value="${keyword}">
            <button class="btn btn-outline-secondary" type="submit">Search</button>
            <c:if test="${not empty keyword}">
                <a href="/dashboard" class="btn btn-outline-danger">Clear</a>
            </c:if>
        </div>
    </form>

    <c:if test="${empty tasks}">
        <div class="alert alert-warning">No tasks found.</div>
    </c:if>

    <c:if test="${not empty tasks}">
        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle shadow-sm">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Priority</th>
                        <th>Status</th>
                        <th>Due Date</th>
                        <th>Assigned To</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="task" items="${tasks}">
                        <tr>
                            <td>${task.id}</td>
                            <td>${task.title}</td>
                            <td>${task.description}</td>
                            <td>${task.priority}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${task.status == 'COMPLETED'}">
                                        <span class="badge bg-success">${task.status}</span>
                                    </c:when>
                                    <c:when test="${task.status == 'PENDING'}">
                                        <span class="badge bg-warning text-dark">${task.status}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-secondary">${task.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${task.dueDate}</td>
                            <td><c:out value="${task.assignedTo.name}" default="N/A" /></td>
                            <td>
                                <a href="/edit/${task.id}" class="btn btn-sm btn-outline-primary">Edit</a>
                                <a href="/delete/${task.id}" class="btn btn-sm btn-outline-danger"
                                   onclick="return confirm('Are you sure you want to delete this task?');">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
