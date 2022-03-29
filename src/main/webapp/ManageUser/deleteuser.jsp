<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//check login session user not access or back to index.jsp page
if(session.getAttribute("adminlogin")== null)
{
	response.sendRedirect("../index.jsp");
}
%>
<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.entities.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	//TODO fix
    UserDao.deleteUser(u);
    response.sendRedirect("manageuser.jsp");
%>