<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.PostDao, com.dao.LikeDao, com.dao.CommentDao, com.entities.Post, com.entities.User, com.dao.bean.Comment, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id = "nc" class = "com.dao.bean.Comment"/>
<jsp:setProperty property="*" name="nc"/>
<jsp:useBean id = "rc" class = "com.dao.bean.LeafComment"/>
<jsp:setProperty property="*" name="rc"/>
<% 
String postId = request.getParameter("postId");
//TODO bad fix
List<Post> record = new ArrayList<Post>();
record.add(PostDao.getPostByPostId(Integer.parseInt(postId)));
request.setAttribute("record",record);
List<Comment> comments = CommentDao.fetchComments(record.get(0).getPid());
request.setAttribute("comments",comments);
User u = (User)request.getSession().getAttribute("currentUser");
%>
<%
if(u == null){
	request.setAttribute("liked", false);
}else{
	request.setAttribute("liked", LikeDao.isLikedByUser(record.get(0).getPid(), u.getId()));
}
request.setAttribute("likeCount", LikeDao.countLikeOnPost(record.get(0).getPid()));
%>
<%
if(request.getParameter("submitComment") != null){
	if(u == null){
		response.sendRedirect("loginform.jsp");	
	}else{
		nc.setUser(u);
		nc.setPid(record.get(0).getPid());
		if(CommentDao.add(nc) > 0){
			response.sendRedirect("viewpost.jsp?postId=" + nc.getPid());
		}
	}
}
if(request.getParameter("reply") != null){
	if(u == null){
		response.sendRedirect("loginform.jsp");
	}else{
		rc.setUser(u);
		System.out.print(request.getParameter("cid"));
		rc.setCid(Integer.parseInt(request.getParameter("cid")));
		if(CommentDao.addReply(rc) > 0){
			response.sendRedirect("viewpost.jsp?postId=" + request.getParameter("postId"));
		}
	}
}
if(request.getParameter("likePost") != null){
	if(u == null){
		response.sendRedirect("loginform.jsp");
	}else{
		if(LikeDao.insertLike(Integer.parseInt(request.getParameter("postId")), u.getId())){
			response.sendRedirect("viewpost.jsp?postId=" + request.getParameter("postId"));
		}
	}
}else if(request.getParameter("unlikePost") != null){
	if(u == null){
		response.sendRedirect("loginform.jsp");
	}else{
		if(LikeDao.deleteLike(Integer.parseInt(request.getParameter("postId")), u.getId())){
			response.sendRedirect("viewpost.jsp?postId=" + request.getParameter("postId"));
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:forEach items="${record}" var="r">${r.getpTitle()} - Forum</c:forEach></title>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>
     <div id="wrapper">
	<header class="forum-header header">
		<div class="container-fluid">
			<nav class="navbar navbar-expand md navbar-dark bg-dark">
				<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Forum</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
      				<ul class="navbar-nav ">
        				<li class="nav-item">
          					<a class="nav-link active" aria-current="page" href="#">Home</a>
        				</li>
       					 <li class="nav-item dropdown">
          					<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            				Category</a>
          					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
          					<li>
          						<div class="container">
          							<div class="menu-content clearfix">
          							<div class="tab">
          								<button class="tablinks active" onclick="openCategory(event, 'cat01')">Recommended</button>
          								<button class="tablinks active" onclick="openCategory(event, 'cat02')">Following</button>
          								<button class="tablinks active" onclick="openCategory(event, 'cat03')">Trending</button>
          							</div>
          							
          							<div class="tab-details clearfix">
          								<div id="cat01" class="tabcontent active">
                                        	<div class="row">
                                            	<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="upload/tech_menu_01.jpg" alt="" class="img-fluid">
                                                            	<div class="hovereffect">
                                                       			</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments1</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              					</div>
                              					
                              					<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="upload/tech_menu_01.jpg" alt="" class="img-fluid">
                                                            	<div class="hovereffect">
                                                            	</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments2</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              					</div>
                              					
                              					<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="upload/tech_menu_01.jpg" alt="" class="img-fluid">
                                                            	<div class="hovereffect">
                                                            	</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments3</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              					</div>
                              				</div>
                              					
                              			<div id="cat02" class="tabcontent active">
                                        	<div class="row">	
                              					<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="upload/tech_menu_02.jpg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website1</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>
                                                
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="/website.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website2</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>
                                                
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="website.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website3</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>
                                                
                        					<div id="cat03" class="tabcontent active">
                                        	<div class="row">
                              					<div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="study.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart1</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>
                                                
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="/study.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart2</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>
                                                
                                                <div class="col-lg-3 col-md-6 col-sm-12 col-xs-12">
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="upload/tech_menu_02.jpg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart3</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div>          							
                                              </div><!-- end row -->
                                          </div>
                                      </div><!-- end tab-details -->
                                  </div><!-- end menu-content -->
                              </div></div>
                          </li>
                      </ul>
                  </li>

        		<li class="nav-item">
          			<a class="nav-link" href="contactus.jsp">Contact Us</a>
        		</li>
        		
        		
        		</div>
    		</nav>
		</div><!-- end container-fluid -->
	</header><!-- end market-header -->
	<br><br><br><br>
     
     <section class="section">
         <div class="container">
             <div class="row">
             <br><br><br>
				<div class="container-fluid">
				<form class="form-control" action = "" method = "post">
				<table class="table table-striped table-hover" width="100%">
				<c:forEach items="${record}" var="r">
				<tr>
				<td>Title: </td><td>${r.getpTitle()}</td>
				</tr>
				<tr>
				<td>Description: </td><td>${r.getpContent()}</td>
				</tr>
				</c:forEach>
				</table>
				<textarea class = "form-control" name = "commentText" required></textarea>
				<input type = "submit" value = "submit" name = "submitComment">
				</form>
				<c:choose>
				<c:when test = "${liked}">
				<form action = "" method = "post"><input type = "submit" value = "Unlike this post" name = "unlikePost"></form>
				</c:when>
				<c:otherwise>
				<form action = "" method = "post"><input type = "submit" value = "Like this post" name = "likePost"></form>
				</c:otherwise>
				</c:choose>
				<p>${likeCount} person(s) liked this</p>
				</div>
				<hr>
				<div class = "container-fluid">
				<table class="table table-striped table-hover" width="100%">
				<c:forEach items = "${comments}" var = "comm">
				<tr><td colspan = "2"><a href = "TODO">${comm.getUser().getName() }</a></td></tr>
				<tr><td colspan = "2">${comm.getCommentText() }</td></tr>
				<c:forEach items = "${comm.getReplies() }" var = "rep">
				<tr><td>Reply from:</td><td><a href = "TODO">${rep.getUser().getName() }</a></td></tr>
				<tr><td></td><td>${rep.getCommentText() }</td></tr>
				</c:forEach>
				<tr><td colspan = "2">
				<form action ="" method = "post">
				<input class = "d-none form-control" type = "text" name = "cid" value = "${comm.getId()}">
				<input class = "form-control" type = "text" name = "commentText" required><input type = "submit" value = "reply" name = "reply">
				</form>
				</td></tr>
				<tr><td></td></tr>
				</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</section>
	
	        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="widget">
                            <div class="footer-text text-left">
                                <a href="index.jsp"></a>
                                <p>Forum is a forum that let everyone shares their opinions.</p>
                            </div><!-- end footer-text -->
                        </div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h6>Popular Categories</h6>
                            <div class="link-widget">
                                <ul>
                                    <li><a href="#">Tech1 <span>(21)</span></a></li>
                                    <li><a href="#">Tech2 <span>(15)</span></a></li>
                                    <li><a href="#">Tech3 <span>(31)</span></a></li>
                                    <li><a href="#">Tech4 <span>(22)</span></a></li>
                                    <li><a href="#">Tech5 <span>(66)</span></a></li>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->

                    <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12">
                        <div class="widget">
                            <h6>Copyrights</h6>
                            <div class="link-widget">
                                <ul>
                                    <li><a href="#">About us</a></li>
                                    <li><a href="#">Join us</a></li>
                                    <li><a href="#">Trademark</a></li>
                                    <li><a href="#">License & Help</a></li>
                                </ul>
                            </div><!-- end link-widget -->
                        </div><!-- end widget -->
                    </div><!-- end col -->
                </div>

                <div class="row">
                    <div class="col-md-12 text-center">
                        <div class="copyright">&copy; Forum.</div>
                    </div>
                </div>
            </div><!-- end container -->
        </footer><!-- end footer -->    
    </div><!-- end wrapper -->
</body>
</html>