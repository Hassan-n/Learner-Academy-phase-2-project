<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css" />
<title>Student List</title>

</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String loggedUser = (String)session.getAttribute("username");
        
        if(loggedUser == null){
            response.sendRedirect("login.jsp");
        }        
    %>
    <h1>Student List</h1>

    <hr>
    <br>

    <table class="student_list" style="width: 100%;">
        <tr>
            <td colspan="6" align="center" style="border: 0px;">
                <form action="<%=request.getContextPath()%>/portal" method="post">
                    <input name="side-menu" value="student" type="hidden" />
                    <input name="main-content" value="student-registration" type="hidden" />
                    <button name="next-action" value="student-registration" type="submit">Add New Student</button>
                </form>
            </td>
        </tr>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="student" items="${listOfStudent}">
            <tr>
                <td><c:out value="${student.studentId}" /></td>
                <td><c:out value="${student.firstName}" /></td>
                <td><c:out value="${student.lastName}" /></td>
                <td><c:out value="${student.age}" /></td>
                <td>
                    <form action="<%=request.getContextPath()%>/portal" method="post">
                        <input name="side-menu" value="student" type="hidden" />
                        <input name="main-content" value="student-edit-form" type="hidden" />
                        <input name="next-action" value="student-edit-form" type="hidden" />
                        <button name="id" value="${student.id}" type="submit" class="edit-btn">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="<%=request.getContextPath()%>/portal" method="post">
                        <input name="side-menu" value="student" type="hidden" />
                        <input name="main-content" value="student-registration" type="hidden" />
                        <input name="next-action" value="student-delete" type="hidden" />
                        <button name="id" value="${student.id}" type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
