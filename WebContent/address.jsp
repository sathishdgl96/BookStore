<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="jspPrograms.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!doctype html>
<html>
<head>
<html>
<head>

<script type="text/javascript" src="selectitem.js"></script>
<meta charset="utf-8">
<title>Untitled Document</title>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 22px;
	text-align: center;
	margin-left: 200px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a:hover:not (.active ) {
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}

#customers {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr:nth-child(even) {
	background-color: #f2f2f2;
}

#customers tr:nth-child(odd) {
	background-color: white;
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #4CAF50;
	color: white;
}

table {
	margin-top: -13px;
	margin-bottom: 10px;
	padding-right: 2px;
	padding-left: 2px;
}

h3 {
	color: #26A41C;
	font-family: "Gill Sans", "Gill Sans MT", "Myriad Pro",
		"DejaVu Sans Condensed", Helvetica, Arial, sans-serif;
	font-weight: bolder;
	text-align: left;
}

#addItem {
	display: inline-block;
}

#post {
	margin-top: 4px;
	color: #14AA0A;
	font-family: Cambria, "Hoefler Text", "Liberation Serif", Times,
		"Times New Roman", serif;
	font-weight: bold;
	text-align: left;
}

#addItem fieldset {
	margin-left: 349px;
	color: #AF3918;
	margin-top: 10px;
	margin-bottom: 6px;
}

#delete {
	float: right;
	margin-top: 6px;
}
</style>
</head>
<body>
	<header>
		<ul>
			<li><a href="#home">Home</a></li>
			<li><a href="book.jsp">Book Store</a></li>
			<li><a href="address.jsp" class="active">Address</a></li>
			<li><a href="addcart.jsp">Shop</a></li>
			<%
				if (session.getAttribute("username") == null) {
					out.println("<li style='float:right;'><a href='logn.jsp'>Login</a></li>");
				} else {
					out.println("<li style='float:right;'><a>logged in as:");
					String username = (String) session.getAttribute("username");
					out.println(username);

					out.println(
							"<li style='float:right'><a href='logout'>logout<input type='hidden'name='status'value='logout'></input></a>");
				}
			%>
		</ul>

	</header>


	<div id="dashboard">
		<p>6. Write a JSP Program to select record from database</p>
		<h3>Contacts</h3>
		<table id="customers">
			<tr>
				<th>Id</th>
				<th><a>First Name<a></th>
				<th>Last Name</th>
				<th>Phone</th>
				<th>Email</th>
				<%
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
						Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "sathish",
								"sathish");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from address");
						while (rs.next()) {

							out.println("<tr onclick='window.location='hi.html''>");

							out.println("<td>" + rs.getInt(1) + "</td>");
							out.println("<td>" + rs.getString(2) + "</td>");
							out.println("<td>" + rs.getString(3) + "</td>");
							out.println("<td>" + rs.getString(4) + "</td>");
							out.println("<td>" + rs.getString(5));
							out.println("<a href='deliveryfrom'/>");
							out.println("<input type='button'style='float: right' class='button' value='Delete'/>");
							out.println("</a>");
							//   out.println("<a href='../picked?itemid="+itemid+"' > <img id='pick' src='pickeup.jpg' width='40px' height='40px'></a><a href='../delivered?itemid="+itemid+"' > <img id='delivered' src='tick.jpg' width='40px' height='40px'></a></td></tr>");
						}
					} catch (Exception e) {
						out.println(e);
					}
				%>
			
</body>
</html>