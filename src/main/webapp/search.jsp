<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.PostDao, com.entities.Post, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String keyword = "";
	if(request.getParameter("search_text") == null || request.getParameter("search_text") == "" || request.getParameter("search_text") == " "){
		response.sendRedirect("index.jsp");
	}else{
		keyword = request.getParameter("search_text");
	}
%>
<% List<Post> record = PostDao.getRecordByKeyword(keyword);
request.setAttribute("record",record);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>

<h1 >Search Result</h1>

<form class="searchform" method="post" action="search.jsp" style="padding-bottom: 10px;">
<input type="text" name="search_text" class="form-control pl-3" placeholder="<%=keyword %>" aria-label="Search">
</form>

<table border="1" width="100%" class="table table-striped table-hover">
<thead>
<tr>
<th scope="col">Id</th>
<th scope="col">Title</th>
<th scope="col">Time</th>
<th scope="col">PostBy</th>
</tr>
</thead>
<tbody>
<c:forEach items="${record}" var="r">
<tr>
<td>${r.getPid()}</td>
<td>${r.getpTitle()}</td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>