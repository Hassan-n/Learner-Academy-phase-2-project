<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css" />
    <title>Teacher List</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String loggedUser = (String)session.getAttribute("username");
        if(loggedUser == null){
            response.sendRedirect("login.jsp");
        }       
    %>
    <h1>Teacher List</h1>
    <hr>
    <table class="teacher_list">
        <tr>
            <td colspan="6" style="border: 0px">
                <form action="<%=request.getContextPath()%>/portal" method="post">
                    <input name="side-menu" value="teacher" type="hidden" />
                    <input name="main-content" value="teacher-registration" type="hidden" />
                    <button name="next-action" value="teacher-registration" type="submit" class="button">Add New Teacher</button>
                </form>
            </td>
        </tr>
        <tr>
            <th>Accreditation ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="teacher" items="${listOfTeacher}">
            <tr>
                <td><c:out value="${teacher.accreditationId}" /></td>
                <td><c:out value="${teacher.firstName}" /></td>
                <td><c:out value="${teacher.lastName}" /></td>
                <td><c:out value="${teacher.age}" /></td>
                <td>
                    <form action="<%=request.getContextPath()%>/portal" method="post">
                        <input name="side-menu" value="teacher" type="hidden" />
                        <input name="main-content" value="teacher-edit-form" type="hidden" />
                        <input name="next-action" value="teacher-edit-form" type="hidden" />
                        <button name="id" value="${teacher.id}" type="submit" class="edit-btn">Edit</button>
                    </form>
                </td>
                <td>
                    <form action="<%=request.getContextPath()%>/portal" method="post">
                        <input name="side-menu" value="teacher" type="hidden" />
                        <input name="main-content" value="teacher-registration" type="hidden" />
                        <input name="next-action" value="teacher-delete" type="hidden" />
                        <button name="id" value="${teacher.id}" type="submit" class="delete-btn">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
