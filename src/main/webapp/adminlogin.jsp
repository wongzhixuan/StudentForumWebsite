<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, com.helper.ConnectionProvider" %>
  
<%
//check login session user not access or back to index.jsp page
if(session.getAttribute("adminlogin")!=null)
{
	response.sendRedirect("adminindex.jsp");
}
%>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver"); //load driver
	Connection con = ConnectionProvider.getConnection();
	if(request.getParameter("btn_login")!= null) //check login button click event not null
	{
		String dbEmail,dbPassword;
		String email,password;
		email = request.getParameter("email"); //get email
		password=request.getParameter("password"); //get password
		
		PreparedStatement pst = null; //create statement
		pst = con.prepareStatement("select * from admin where email=? and password=?"); //sql select query 
		pst.setString(1,email);
		pst.setString(2,password);
		ResultSet rs=pst.executeQuery(); //execute query and store in resultset object rs.
		if(rs.next())
		{
			dbEmail = rs.getString("email");
			dbPassword = rs.getString("password");
			if(email.equals(dbEmail) && password.equals(dbPassword))
			{
				//session name is Islogin and store fetchable database email address
				session.setAttribute("adminlogin",dbEmail); 
				response.sendRedirect("adminwelcome.jsp"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid email or password"); //invalid error message for email or password wrong
		}
		con.close(); //close connection	
	}
}catch(Exception ex){
	System.out.println(ex);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Login - Forum</title>
<script src="resources/js/login.js"></script>
<link rel="stylesheet" href="bs5/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/index.css">

<script src="bs5/js/bootstrap.min.js"></script>
</head>
<body>

     <section class="section">
         <div class="container">
             <div class="row">
                 <a href="index.jsp"><button class="btn btn-outline-info my-4" >Back to Main Page</button></a>
			<form name="loginform" method="post" onsubmit="return validate();" class="form-group">
			<h1>Admin Login</h1>
				<div class="col-md-5">
					<label class="form-label"><span>Email</span> </label>
						<input type="email" class="form-control" name="email" id="email" placeholder="Email"/>
				</div>
				
				<div class="col-md-5">
					<label class="form-label"><span>Password</span></label>
						<input class="form-control" type="password" name="password" id="password" placeholder="Password"/>
				</div>
				
				<div class="col-md-5 my-4">
					<a href="forgetpwd.jsp">Forget Password</a>
					<input type="submit" class="btn btn-outline-info float-end" name="btn_login" value="Log In"/>
				</div>
			</form>

			<a href="loginform.jsp">Login as User</a><br>
			<div class="my-3 col-md-5">
			<%
			//error message for email or password 
			if(request.getAttribute("errorMsg") != null)
			{%><p class="alert alert-danger" role="alert">
				<%out.println(request.getAttribute("errorMsg"));
			}
			%></p></div>
                 
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