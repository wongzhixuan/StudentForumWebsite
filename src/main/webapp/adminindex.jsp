<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page - Forum</title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>
<h1> Hello, <%=session.getAttribute("adminlogin")%> </h1>
<%if (session.getAttribute("adminlogin")!= null)
{
%>
<a href="logout.jsp">Log Out</a>
<%
}
else{
	response.sendRedirect("index.jsp");
}
%>
<br>
<a href="ManageUser/manageuser.jsp">Manage User</a>
<a href="ManagePost/managepost.jsp">Manage Post</a>
<a href="ManageReport/viewreport.jsp">View Report</a>
</body>
</html>