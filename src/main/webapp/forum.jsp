//TODO delete
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id = "p" class = "com.dao.bean.Post"/>
<jsp:setProperty property="*" name="p"/>
<jsp:useBean id = "nc" class = "com.dao.bean.Comment"/>
<jsp:useBean id = "comm" class = "com.dao.bean.Comment"/>
<jsp:useBean id = "lc" class = "com.dao.bean.LeafComment"/>
<%@page import = "com.dao.CommentDao, com.dao.bean.Comment, com.dao.bean.LeafComment, com.dao.bean.Post, java.util.*"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
	String commentClass = "\"comment\"";
	String replyClass = "\"reply\"";
	List<Comment> list = CommentDao.fetchComments(Integer.parseInt(request.getParameter("postId")));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id = "Post">
	<h3>${p.getPostTitle()}</h3>
	<p>${p.getPostContent()}</p>
</div>
//TODO check user is original poster, if yes add a delete post button
//TODO fetch database to load post
<c:forEach items = "${list}" var = "comm">
<%
	out.print("<div class = " + commentClass + "><p>" + comm.getCommentText());
	List<LeafComment> r = comm.getReplies();
	if(r != null){
		for(int i = 0; i < r.size(); i++){
			out.print("<div class = " + replyClass + "><p>" + r.get(i).getCommentText() + "</p></div>");
		}
	}
	out.print("</div>");
%>
</c:forEach>

//TODO upvote, downvote, get user
</body>
</html>