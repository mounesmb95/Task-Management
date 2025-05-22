<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Task</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container py-5">
    <h2 class="text-primary mb-4">Create New Task</h2>

    <form:form modelAttribute="task" method="POST" action="/create" cssClass="row g-3">
        <div class="col-md-6">
            <label class="form-label">Title</label>
            <form:input path="title" cssClass="form-control" required="true" />
        </div>
        <div class="col-md-6">
            <label class="form-label">Due Date</label>
            <form:input path="dueDate" type="date" cssClass="form-control" />
        </div>
        <div class="col-12">
            <label class="form-label">Description</label>
            <form:textarea path="description" cssClass="form-control" rows="3" />
        </div>
        <div class="col-md-4">
            <label class="form-label">Priority</label>
            <form:select path="priority" cssClass="form-select">
                <form:options items="${priorities}" />
            </form:select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Status</label>
            <form:select path="status" cssClass="form-select">
                <form:options items="${statuses}" />
            </form:select>
        </div>
        <div class="col-md-4">
            <label class="form-label">Assigned To</label>
            <form:select path="assignedTo.id" cssClass="form-select">
                <form:options items="${users}" itemValue="id" itemLabel="name" />
            </form:select>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">Create Task</button>
            <a href="/dashboard" class="btn btn-secondary ms-2">Back to Dashboard</a>
        </div>
    </form:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
