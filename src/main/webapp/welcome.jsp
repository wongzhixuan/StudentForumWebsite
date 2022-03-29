<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome: <%=session.getAttribute("Islogin") %></title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>
<%
//check condition unauthorize user not direct access welcome.jsp page
if(session.getAttribute("Islogin") == null || session.getAttribute("Islogin") == " " )
{
	response.sendRedirect("loginform.jsp");
}
%>
<h1> Welcome, <%=session.getAttribute("Islogin")%> </h1>
<h2><a href="index.jsp">Back to Main Menu</a></h2><br>
<h2><a href="logout.jsp">Logout</a></h2>
</body>
</html>