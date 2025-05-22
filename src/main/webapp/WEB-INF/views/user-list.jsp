<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="mb-4 text-primary">User List</h2>

    <a href="/user/create" class="btn btn-success mb-3">+ Create New User</a>

    <table class="table table-bordered table-striped table-hover">
        <thead class="table-dark">
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Email</th>
                <th class="text-center">Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${users}" var="user" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td class="text-center">
                        <a href="/user/edit/${user.id}" class="btn btn-sm btn-warning">Edit</a>
                        <a href="/user/delete/${user.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <a href="/dashboard" class="btn btn-secondary">Back to Dashboard</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
