<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.dao.PostDao, com.dao.UserDao, com.entities.Post, java.util.*" %>
<%@page import="com.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.dao.PostDao"%>
<%@page import="com.entities.Message"%>
<%@page import="com.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%-- <%
     User user = (User) session.getAttribute("currentUser");
      if (user == null) {
          response.sendRedirect("login_page.jsp");
      }
%> --%>

<%
	User user = new User(1,"ls","123@gmail.com","1234","female","1999-12-10","hi");

%>

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
          							
          							
          							<div class="tab-details clearfix">
          								<div id="cat01" class="tabcontent active">
                                        	<div class="row">
                                            	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="resources/images/sample.jpeg" alt="" class="img-fluid" >
                                                            	<div class="hovereffect">
                                                       			</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments1</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              				
                              					
                              					
                                                	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="resources/images/study.jpeg" alt="" class="img-fluid">
                                                            	<div class="hovereffect">
                                                            	</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments2</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              					
                              					
                              					
                                                	<div class="blog-box">
                                                    	<div class="post-media">
                                                        	<a href="viewpost.jsp?postId=1" title="">
                                                            	<img src="resources/images/assignment.png" alt="" class="img-fluid">
                                                            	<div class="hovereffect">
                                                            	</div><!-- end hover -->
                                                            	<span class="menucat">Recommended</span>
                                                       	 	</a>
                                                    	</div><!-- end media -->
                                                    	
                                                    	<div class="blog-meta">
                                                        	<h4><a href="viewpost.jsp?postId=1" title="">Top 10 advice for your assignments3</a></h4>
                                                    	</div><!-- end meta -->
                                                	</div><!-- end blog-box -->
                              					
                              				</div></div>
                              					
                              			<div id="cat02" class="tabcontent active">
                                        	<div class="row">	
                              					
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="resources/images/assignment.png" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website1</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                
                                                
                                               
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="resources/images/website.jpg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website2</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                
                                                
                                                
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1"  title="">
                                                                <img src="resources/images/website.jpg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Following</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The secret of making a good website3</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                </div></div>
                                                
                        					<div id="cat03" class="tabcontent active">
                                        	<div class="row">
                              					
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="resources/images/study.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart1</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                
                                                
                                               
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="resources/images/assignment.png" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart2</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                
                                                
                                                
                                                	<div class="blog-box">
                                                        <div class="post-media">
                                                            <a href="viewpost.jsp?postId=1" title="">
                                                                <img src="resources/images/sample.jpeg" alt="" class="img-fluid">
                                                                <div class="hovereffect">
                                                                </div><!-- end hover -->
                                                                <span class="menucat">Trending</span>
                                                            </a>
                                                        </div><!-- end media -->
                                                        <div class="blog-meta">
                                                            <h4><a href="viewpost.jsp?postId=1" title="">The tips for studying smart3</a></h4>
                                                        </div><!-- end meta -->
                                                    </div><!-- end blog-box -->
                                                
                                                        							
                                              </div><!-- end row -->
                                          </div>
                                      </div><!-- end tab-details -->
                                  </div><!-- end menu-content -->
                              </div>
                          </li>
                      </ul>
                  </li>

        		<li class="nav-item">
          			<a class="nav-link" href="contactus.jsp">Contact Us</a>
        		</li>
        		</ul>
        		
        		</div>
    

<div class="theme-toggler">
 <a href="javascript:void()" class="btn btn-outline-info btn-lg ml-auto font-weight-bold" id="theme-toggler" onclick="toggleTheme()"></a> </div>
<div class="d-flex align-items-center">
<div class="flex-shrink-0 dropdown">
          <%
          	if(session.getAttribute("currentUser") != null)
          	{
          %>
          <a href="#" class="d-block link-light text-decoration-none dropdown-toggle" id="dropdownUser2" data-bs-toggle="dropdown" aria-expanded="false">
            <img src="resources/images/sample.jpeg" alt="profile picture" width="32" height="32" class="rounded-circle">
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown2">
            <!-- TODO -->
            <li><a class="dropdown-item" href="./newPost.jsp">New post...</a></li>
            <li><a class="dropdown-item" data-toggle="modal" data-target="#profile-modal">Profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="logout.jsp">Sign out</a></li>
          </ul>
          <%
          	}
          %>
</div>
<form class="searchform" method="post" action="search.jsp">
<input type="text" name="search_text" class="form-control pl-3" placeholder="Search..." aria-label="Search">
</form>
</div>
</nav>
		</div><!-- end container-fluid -->
	</header><!-- end market-header -->
       
</div>

<div class="container">

<div class="row">
<div class="col-md-2">
<h3> Hello, <%=session.getAttribute("Islogin") == null? "Visitor": session.getAttribute("Islogin")%></h3></div>
<div class="col-md-1">
<%
if (session.getAttribute("Islogin")!= null)
{
%>
<a  href="logout.jsp">Log Out</a>
<%
}
else{
%>
<a href="loginform.jsp">Login</a>
<%
} 
%>
</div>
</div>
<div class="container-fluid">
<% List<Post> record = PostDao.getAllPosts();
request.setAttribute("record",record);%>
<table border="1" width="100%" class="table table-hover">
<thead>
<tr>
<th scope="col">Id</th>
<th scope="col">Title</th>
<th scope="col">Time</th>
<th scope="col">PostBy</th>
<th scope="col"></th>
</tr>
</thead>
<tbody>
<!-- TODO fix -->
<c:forEach items="${record}" var="r">
<tr>
<td>${r.getPid()}</td>
<td>${r.getpTitle()}</td>
<td>${r.getpDate() }</td>
<td><a href = "TODO">${UserDao.getUserByUserId(r.getUserId()).getName()}</a></td>
<td><a href="viewpost.jsp?postId=${r.getPid()}" target="_blank">View More</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
        <!--profile modal-->
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


        <!--end of profile modal-->

<script src="resources/js/index.js"></script>
<script
src="https://code.jquery.com/jquery-3.4.1.min.js"
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()

                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()

                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")

                                        }


                                    })
                                });

        </script>

</body>
</html>