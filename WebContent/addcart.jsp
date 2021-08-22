<%@page import="java.sql.SQLException"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<link href="css/stylebuyer.css" rel="stylesheet" type="text/css">
<%
	if (session.getAttribute("username").equals(null)) {

		String loginerror = "Login to continue ";

		response.sendRedirect("logn.jsp?error=" + loginerror);
	}
%>
<style>
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

h6 {
	color: red;
	font-weight: bold;
	font-size: 20px;
	text-align: center;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 10px 22px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 5px;
	cursor: pointer;
	position: right;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
}

.button2:hover {
	box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0
		rgba(0, 0, 0, 0.19);
}
</style>
</head>
<body bgcolor="lavender">

	<ul>
		<li><a href="#home">Home</a></li>
		<li><a href="address.jsp">Address</a></li>
		<li><a href="book.jsp">Book Store</a></li>
		<li><a href="addcart.jsp" class="active">Shop</a></li>
		<li style="float: right"><a href="logout">Logout</a></li>
	</ul>
	<p>8. Create a catalogue page containing the book’s details</p>

	<header>
		<h3>Cart</h3>
		<table id="customers">
			<tr>
				<th>Book Name</th>
				<th>Author</th>
				<th>Description</th>
				<th>Price</th>
				<th>status</th>

			</tr>
			<%
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				String driver = "oracle.jdbc.driver.OracleDriver";
				String userName = "sathish";
				String password = "sathish";
				try {
					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", userName,
							password);
					String email = (String) session.getAttribute("email");
					String strQuery = "select * from booktemp";
					System.out.println(strQuery);
					Statement st = conn.createStatement();
					ResultSet rs = st.executeQuery(strQuery);
					while (rs.next()) {
						out.println("<tr>");
						out.println("<td>" + rs.getString(2) + "</td>");
						out.println("<td>" + rs.getString(3) + "</td>");
						out.println("<td>" + rs.getInt(4) + "</td>");
						out.println("<td>" + rs.getInt(5) + "</td>");
						out.println("<td>");
						out.print("incart");
						out.println("<a href='../deleteproductbuyercart?itemid=" + rs.getInt(1)
								+ "' > <img id='delete' src='delete.png' width='10px' height='10px'></a></td></tr>");
					}
				} catch (Exception e) {
					System.out.println(e);
				}
			%>

		</table>
		<a href="checkout.jsp"><button class="button button2">Confirm
				and proceed</button></a>
	</header>
	<h3>Books Available</h3>
	<%
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", userName,
					password);
			//String username =(String)session.getAttribute("email");
			String strQuery = "select * from book";
			System.out.println(strQuery);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(strQuery);

			while (rs.next()) {
				String imageurl = rs.getString(6);
				String sid = rs.getString(1);
				String bookname = rs.getString(2);
				String author = rs.getString(3);
				String description = rs.getString(4);
				int price = rs.getInt(5);
				out.println("<div class='veg'>");
				out.println("<figure> <img src='" + imageurl + "'width='100%' height='100%' alt='download'/><br>");
				out.println("<figure-caption>" + bookname + "- written by: " + author + "</br>" + description
						+ "<h6>Rs" + price
						+ " per book</h6><form action='addtocart'> <input type='submit' class='cart' value='Add to Cart'/>");
				out.println("<input type='number' name='quantity' class='quan'/>");
				out.println("<input type='hidden' name='bookname' value='" + bookname
						+ "'/><input type='hidden' name='author' value='" + author
						+ "'/><input type='hidden' name='price' value='" + price + "'/></form> </figure-caption>");
				out.println("</figure>");
				out.println("</div>");
			}
		} catch (Exception e) {

		}
	%>

</body>
</html>
