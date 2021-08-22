<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
<link href="css/logn.css" rel="stylesheet" type="text/css" />

<style>
    h6
    {
        color:red;
        font-weight: bold;
        font-size:20px;
        text-align: center;
    }
</style>
</head>
<%
String error=request.getParameter("error");
if(error!=null)
{
    out.println("<h6>");
    out.println(error);
    out.println("</h6>");
}
if(session.getAttribute("username")!=null)
{
 
 String loginerror="your'e already logged in ";

  response.sendRedirect("index.jsp?loginerror="+loginerror); 
}
    %>
<body>
<p>5. Write a JSP Program to validate username and password.</p>
   <div class="signin">
<form action="LoginUser">
<h2 style="color:#fff;">Log In-User</h2>
<input type="text" name="username" placeholder="Username"/><br /><br />
<input type="password" name="password" placeholder="Password" /><br /><br />
<input type="submit" value="Log In" /><br /><br />
<div id="container">
<a href="re.html" style=" margin-right:0px; font-size:13px; font-family:Tahoma, Geneva, sans-serif;">Reset password?</a>
    <a href="for.html" style=" margin-left:30px; font-size:13px; font-family:Tahoma, Geneva, sans-serif;">Forget password</a>
    </div><br /><br /><br /><br /><br /><br />
Don't have account?<a href="signup.html" style="font-family:'Play', sans-serif;">&nbsp;Sign Up</a>

</form>
</div>

</body>
</html>
