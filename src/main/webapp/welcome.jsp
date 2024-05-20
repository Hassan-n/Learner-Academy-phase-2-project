<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="styles.css">
    <title>Welcome</title>
</head>
<body>
    <c:if test="${empty sessionScope.username}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <div class="welcome-container">
        <h1>${welcomeMessage != null ? welcomeMessage : 'Welcome!'}</h1>
        <h3>Your username is: ${sessionScope.username}</h3>
    </div>
</body>
</html>
