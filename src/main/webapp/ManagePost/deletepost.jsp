<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
//check login session user not access or back to index.jsp page
if(session.getAttribute("adminlogin")== null)
{
	response.sendRedirect("../index.jsp");
}
%>
<%@page import="com.dao.PostDao" %>
<%
    PostDao.delete(Integer.parseInt(request.getParameter("postId")));
    response.sendRedirect("managepost.jsp");
%>