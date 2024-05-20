<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css" />
<title>Class Info</title>
</head>
<body>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        String loggedUser = (String)session.getAttribute("username");
        
        if(loggedUser == null){
            response.sendRedirect("login.jsp");
        }
    %>
    <h1>${subject.subjectName} Class Details:</h1>

    <hr>
    <div class="class-info-container">
        <div class="class-details">
            <h4>Teacher: ${teacher.firstName} ${teacher.lastName}</h4>
            <h4>Date: ${classX.date}</h4>
        </div>

        <h2 class="student-list-title">Student List:</h2>

        <table class="student-list-table">
            <tr>
                <th>Student ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Remove from Class</th>
            </tr>
            <c:forEach var="student" items="${listOfAllStudentOnClass}">
                <tr>
                    <td><c:out value="${student.studentId}" /></td>
                    <td><c:out value="${student.firstName}" /></td>
                    <td><c:out value="${student.lastName}" /></td>
                    <td><c:out value="${student.age}" /></td>
                    <td>
                        <form action="<%=request.getContextPath()%>/portal" method="post">
                            <input name="side-menu" value="student" type="hidden" />
                            <input name="main-content" value="student-registration" type="hidden" />
                            <input id="classXId" name="classXId" value="${classX.id}" type="hidden" />
                            <input name="next-action" value="student-class-remove" type="hidden" />
                            <button name="id" value="${student.id}" type="submit" class="btn btn-remove">Remove from Class</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <form action="<%=request.getContextPath()%>/portal" method="post" class="add-student-form">
            <select id="studentId" name="studentId" required>
                <c:forEach var="student" items="${listOfFREEStudent}">
                    <option value="${student.id}">${student.firstName} ${student.lastName}</option>
                </c:forEach>
            </select>
            <input name="side-menu" value="student" type="hidden" />
            <input name="main-content" value="class-student-list" type="hidden" />
            <input id="classXId" name="classXId" value="${classX.id}" type="hidden" />
            <button name="next-action" value="student-class-add" type="submit" class="btn btn-add">Add Student to Class</button>
        </form>
    </div>
</body>
</html>
