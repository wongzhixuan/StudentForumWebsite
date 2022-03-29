<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.PostDao, com.dao.UserDao, com.entities.Post, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="page-title lb single-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                        <h2><i class="fa fa-envelope-open-o bg-orange"></i> Contact us </h2>
                    </div><!-- end col -->                  
            	</div><!-- end row -->
            </div><!-- end container -->
        </div><!-- end page-title -->

        <section class="section wb">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="page-wrapper">
                            <div class="row">
                                <div class="col-lg-5">
                                    <h4>Who we are</h4>
                                    <p>Students from XMUM that created this forum</p>
                   
                                    <h4>How we help?</h4>
                                    <p>We will help to investigate the problem to give you the best experience </p>
             
                                    <p></p>
                                </div>
                                <div class="col-lg-7">
                                    <form class="form-wrapper">
                                        <input type="text" class="form-control" placeholder="Your name">
                                        <input type="text" class="form-control" placeholder="Email address">
                                        <input type="text" class="form-control" placeholder="Phone">
                                        <input type="text" class="form-control" placeholder="Subject">
                                        <textarea class="form-control" placeholder="Your message"></textarea>
                                        <button type="submit" class="btn btn-primary">Send</button>
                                    </form>
                                </div>
                            </div>
                        </div><!-- end page-wrapper -->
                    </div><!-- end col -->
                </div><!-- end row -->
            </div><!-- end container -->
        </section>
        <br><br><br><br><br>
        
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

    <!-- Core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>