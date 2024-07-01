<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.agrimarketplace.model.User"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All User Details</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f9f9f9;
	margin: 20px;
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
	color: #333;
}

td {
	color: #666;
}

button {
	padding: 8px 15px;
	background-color: #e57a97;
	color: white;
	border: none;
	cursor: pointer;
	border-radius: 3px;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #45a049;
}

.edit-button {
	background-color: #2196F3;
}

.edit-button:hover {
	background-color: #1e87db;
}

.delete-button {
	background-color: #f44336;
}

.delete-button:hover {
	background-color: #e53935;
}

.text5 {
	font-family: cursive;
	text-align: center;
	font-family: bold;
	font-size: 18px;
}
</style>

<body>
	<div class="text5">
		<h2>
			<font color="#e57a97">USER</font> <font color="#74ab4f">DETAILS</font>
		</h2>
	</div>
	<form action="/search" method="GET">

		<input type="text" id="searchTerm" name="name"
			placeholder="Enter name...">
		<button>Search</button>
	</form>

	<table>
		<thead>
			<tr>
				<td>ID</td>
				<td>NAME</td>
				<td>TYPE</td>
				<td>PHONE NUMBER</td>
				<td>EMAIL</td>
				<td>ADDRESS</td>
				<td>UPDATE</td>
				<td>DELETE</td>
			</tr>
		</thead>
		<tbody>
			<%List<User> users=(ArrayList<User>)request.getAttribute("users");
        for (User user : users)
          {
        %>
			<tr>
				<td><%= user.getId()%></td>
				<td><%= user.getName()%></td>
				<td><%= user.getType()%></td>
				<td><%= user.getPhone()%></td>
				<td><%= user.getEmail()%></td>
				<td><%= user.getAddress()%></td>
				<td>
					<form action="updateStudent.jsp">
						<input type="hidden" name="id" value="<%=user.getId() %>">
						<button>Edit</button>
					</form>
				</td>
				<td>

					<form action="/delete" method="get">
						<input type="hidden" name="id" value="<%= user.getId()%>">
						<button>Delete</button>
					</form>
				</td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>