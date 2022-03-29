<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.helper.ConnectionProvider, com.entities.User, com.dao.UserDao" %>  
<%
//check login session user not access or back to index.jsp page
if(session.getAttribute("Islogin")!=null)
{
	response.sendRedirect("index.jsp");
}
%>
<%
if(request.getParameter("btn_login") != null){
User u = UserDao.getUserByEmailAndPassword(request.getParameter("email"), request.getParameter("password"));
if(u != null){
	session.setAttribute("Islogin",u.getName()); 
	session.setAttribute("currentUser", u);
	response.sendRedirect("welcome.jsp");
}
else
{
	request.setAttribute("errorMsg","invalid email or password"); //invalid error message for email or password wrong
}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login - Forum</title>
<script src="resources/js/login.js"></script>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>
     <section class="section">
         <div class="container">
             <div class="row">
				<a href="index.jsp"><button class="btn btn-outline-info my-4" >Back to Main Page</button></a>
				<div class="container-fluid">
				<form class="form-group my-3" name="loginform" method="post" onsubmit="return validate();">
				
				<h1>Login</h1>
				<div class="col-md-5">
					<label class="form-label"><span>Email</span> </label>
						<input class="form-control" type="email" name="email" id="email" placeholder="Email"/>
				</div>
				
				<div class="col-md-5">
					<label class="form-label"><span>Password</span></label>
						<input class="form-control" type="password" name="password" id="password" placeholder="Password"/>
				</div>
				
				<div class="col-md-5 my-4">
					<a href="forgetpwd.jsp">Forget Password</a>
					<input class="btn btn-outline-info float-end" type="submit" name="btn_login" value="Log In"/>
				</div>
				
				</form>
				<div class="col-auto">
				
				<a href="register.jsp"><button class="btn btn-outline-info my-4">Sign Up</button></a>
	
				<a href="adminlogin.jsp"><button class="btn btn-outline-info my-4">Admin Login</button></a><br>
				</div>
				<div class="my-3 col-md-5">
				<%
				//error message for email or password 
				if(request.getAttribute("errorMsg") != null)
				{%><p class="alert alert-danger" role="alert">
					<%out.println(request.getAttribute("errorMsg"));
				}
				%></p></div></div>
			</div>
		</div>
	</section>
	<br><br>
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