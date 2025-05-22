<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="text-primary mb-4">Create New User</h2>

    <form:form modelAttribute="user" method="POST" action="/user/create" cssClass="row g-3">
        <div class="col-md-6">
            <label class="form-label">Name</label>
            <form:input path="name" cssClass="form-control" required="true" />
        </div>
        <div class="col-md-6">
            <label class="form-label">Email</label>
            <form:input path="email" cssClass="form-control" required="true" />
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-success">Create User</button>
            <a href="/user/list" class="btn btn-secondary ms-2">Back to User List</a>
        </div>
    </form:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
