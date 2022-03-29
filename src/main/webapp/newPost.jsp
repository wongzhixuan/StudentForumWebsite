<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.dao.PostDao, com.entities.User, java.sql.*"%>
<jsp:useBean id = "p" class = "com.entities.Post"/>
<jsp:setProperty property="*" name="p"/>
<%
	if(session.getAttribute("currentUser") == null){
		response.getWriter().print("Please login to make post");
	}else
	if(request.getParameter("submitPost") != null){
		p.setUserId(((User)session.getAttribute("currentUser")).getId());
		int pid = PostDao.savePost(p);
		if(pid > 0){
			response.sendRedirect("viewpost.jsp?postId=" + pid);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Forum</title>
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">

<link id="dark-theme-style" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="bs5/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
    $(".dropdown-toggle").dropdown();
});</script>
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
     <section class="section">
         <div class="container">
             <div class="row">
             <br><br><br>
				<div class="container-fluid">
					<form action = "" method = "post" class = "form-control">
					<table class = "table table-striped table-hover">
					<tr><td>
						<div class = "">
							<% User u = (User)session.getAttribute("currentUser"); %>
							<input class ="d-none" type = "text" name = "userId" value = "${u.getId()}" disabled/>
						</div>
					</td></tr>
					<tr><td bgcolor="lightblue">Title</td></tr><tr><td>
						<input class = "form-control" type = "text" name = "pTitle"/>
					</td></tr>
						<tr><td bgcolor="lightblue">Description</td></tr><tr><td>
						<textarea class = "form-control" rows="" cols="" name = "pContent"></textarea>
					</td></tr>
					<tr><td colspan = "2">
						<input class = "form-control" type = "submit" name = "submitPost" value = "Submit" >
					</td></tr>
				</table>
				</form>
			</div>
		</div>
	</div>
</section>
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