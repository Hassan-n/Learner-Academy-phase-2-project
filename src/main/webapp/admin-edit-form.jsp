<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="styles.css" />
<title>Admin Edit Form</title>

</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		String loggedUser = (String)session.getAttribute("username");
		
		if(loggedUser == null){
			response.sendRedirect("login.jsp");
		}		
	%>
	
	<h1>Please Edit an Admin</h1>

	<hr>
	<br>
	<form action="<%=request.getContextPath()%>/portal"	method="post">

		<h3 class="errorMessage">${errorMessage}</h3>

		<table>
			<tr>
				<th colspan="2">
					<h2>Admin Edit Form</h2>
				</th>
			</tr>
			<tr>
				<td align="right">
					<label for="firstName">First Name:</label>
				</td>
				<td>
					<input type="text" id="firstName" name="firstName" placeholder="First Name" value="${firstName}" required>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label for="lastName">Last Name:</label>
				</td>
				<td>
					<input type="text" id="lastName" name="lastName" placeholder="Last Name" value="${lastName}" required>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label for="username">User Name:</label>
				</td>
				<td>
					<input type="text" id="username" name="username" placeholder="Username" value="${username}" required>
				</td>
			</tr>
			<tr>
				<td align="right">
					<label for="pasword">Password:</label>
				</td>
				<td>
					<input type="password" id="password" name="password" placeholder="Password" value="" required>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				
					<input name="id" id="id" value="${id}" type="hidden" />
					<button name="next-action" value="admin-edit" type="submit" >Confirm Edits</button>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>