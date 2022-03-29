<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.helper.ConnectionProvider" %>
<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.entities.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
//check login session user not access or back to register.jsp page
if (session.getAttribute("Islogin") != null) 
{
	response.sendRedirect("index.jsp");
}
%>
<%
try{
//check register button click event not null
if(request.getParameter("btn_register") != null)
{
	String email = request.getParameter("email");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = ConnectionProvider.getConnection();
	PreparedStatement pst = con.prepareStatement("select count(*) from user where email=?");
	pst.setString(1,email);
	ResultSet rs = pst.executeQuery();
	rs.next();
	String Countrow = rs.getString(1);
	if(Countrow.equals("0")){
	boolean i = UserDao.saveUser(u);
	if(i){
		request.setAttribute("successMsg", "Register Successfull... Please login");
	}else{
		request.setAttribute("errorMsg", "Register Failed... Please try again");
	}
	}else{
		request.setAttribute("errorMsg", "Email already exists!");
	}
}
}catch(Exception ex){
	System.out.println(ex);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bs5/css/bootstrap.min.css" rel="stylesheet">
<title>Register - Forum</title>
<script src="resources/js/register.js"></script>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>

     <section class="section">
         <div class="container">
             <div class="row">
				<a href="index.jsp"><button class="btn btn-outline-info my-4" >Back to Main Page</button></a>
				<form method="post" onsubmit="return validate();" class="form-group">
				<h1>Sign Up</h1>
				<div class="col-md-5">
					<label class="form-label"><span>Username</span></label> <input type="text" name="name" id="name" placeholder="Username" class="form-control"/>
				</div>
				
				<div class="col-md-5">
					<label class="form-label"><span>Email</span></label>
						<input type="email" class="form-control" name="email" id="email" placeholder="Email"/></div>
				
				<div class="col-md-5">
					<label class="form-label"><span>Password</span></label>
						<input type="password" class="form-control" name="password" id="password" placeholder="Password"/>
				</div>
				
				<div class="col-md-5">
					<div id="error_message"></div>
						<input type="submit" class="btn btn-outline-info my-4 float-end" name="btn_register" value="Sign Up"/></div>
				
				<div class="my-3 col-md-5">
				<%
				//error message for email or password 
				if(request.getAttribute("errorMsg") != null)
				{%><p class="alert alert-danger" role="alert">
					<%out.println(request.getAttribute("errorMsg"));
				}
				%></p></div>
				<div class="my-3 col-md-5">
				<%
				//error message for email or password 
				if(request.getAttribute("successMsg") != null)
				{%><p class="alert alert-success" role="alert">
					<%out.println(request.getAttribute("successMsg"));
				}
				%></p></div>
				</form>
				<br><br>
				<a href="loginform.jsp">Log In</a><br>
				<a href="adminlogin.jsp">Login as Admin</a><br>
        
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