<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Class List</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String loggedUser = (String) session.getAttribute("username");
        
        if (loggedUser == null) {
            response.sendRedirect("login.jsp");
        }
    %>

    <div class="container">
        <h1>Class List</h1>
        <hr>
        <div class="button-container">
            <form action="<%= request.getContextPath() %>/portal" method="post">
                <input name="side-menu" value="class" type="hidden">
                <input name="main-content" value="class-registration" type="hidden">
                <button name="next-action" value="class-registration" type="submit">Add New Class</button>
            </form>
        </div>

        <table class="class-list-table">
            <thead>
                <tr>
                    <th colspan="6">
                        <h2>Class List Options</h2>
                    </th>
                </tr>
                <tr>
                    <th>Subject</th>
                    <th>Teacher</th>
                    <th>Date</th>
                    <th>Student List</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="classX" items="${listOfClassX}">
                    <tr>
                        <td><c:out value="${classX.getSubject().getSubjectName()}" /></td>
                        <td><c:out value="${classX.getTeacher().getFirstName()}" /> <c:out value="${classX.getTeacher().getLastName()}" /></td>
                        <td><c:out value="${classX.date}" /></td>
                        <td>
                            <form action="<%= request.getContextPath() %>/portal" method="post">
                                <input name="side-menu" value="class" type="hidden">
                                <input name="main-content" value="class-student-list" type="hidden">
                                <input name="next-action" value="class-student-list" type="hidden">
                                <button name="id" value="${classX.id}" type="submit" class="btn btn-student-list">Student List</button>
                            </form>
                        </td>
                        <td>
                            <form action="<%= request.getContextPath() %>/portal" method="post">
                                <input name="side-menu" value="class" type="hidden">
                                <input name="main-content" value="class-edit-form" type="hidden">
                                <input name="next-action" value="class-edit-form" type="hidden">
                                <button name="id" value="${classX.id}" type="submit" class="btn btn-edit">Edit</button>
                            </form>
                        </td>
                        <td>
                            <form action="<%= request.getContextPath() %>/portal" method="post">
                                <input name="side-menu" value="class" type="hidden">
                                <input name="main-content" value="class-registration" type="hidden">
                                <input name="next-action" value="class-delete" type="hidden">
                                <button name="id" value="${classX.id}" type="submit" class="btn btn-delete">Delete</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
