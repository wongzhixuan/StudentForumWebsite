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
<title>Manage Post - Forum</title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>

</head>
<body>
<%@page import="com.dao.PostDao, com.entities.Post, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Users List</h1>
<% List<Post> record = PostDao.getAllPosts();
request.setAttribute("record",record);%>
<a href="../adminindex.jsp"><button class="btn btn-default" >Back to Main Page</button></a>
<table border="1" width="100%">
<tr>
<th>Id</th>
<th>Title</th>
<th>Description</th>
<th>Delete</th>
<th>ViewMore</th>
</tr>
<c:forEach items="${record}" var="r">
<tr>
<td>${r.getPid()}</td>
<td>${r.getpTitle()}</td>
<td>${r.getpContent()}</td>

<td><a href="deletepost.jsp?postId=${r.getPid()}">Delete</a></td>
<td><a href="../viewpost.jsp?postId=${r.getPid()}">ViewMore</a></td>
</tr>

</c:forEach>
</table>
<br>
</body>
</html>