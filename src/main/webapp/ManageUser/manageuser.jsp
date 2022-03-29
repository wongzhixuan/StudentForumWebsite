<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//check login session user not access or back to index.jsp page
if(session.getAttribute("adminlogin")== null)
{
	response.sendRedirect("../index.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manage User - Forum</title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>
<%@page import="com.dao.UserDao, com.entities.User, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Users List</h1>
<% //TODO fix
List<User>list = UserDao.getAllRecords();
request.setAttribute("list",list);%>

<table border="1" width="100%">
<tr>
<th>Id</th>
<th>Name</th>
<th>Password</th>
<th>Email</th>
<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u">
<tr>
<td>${u.getId()}</td>
<td>${u.getName()}</td>
<td>${u.getPassword()}</td>
<td>${u.getEmail()}</td>

<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td>
</tr>

</c:forEach>
</table>
<br>
</body>
</html>