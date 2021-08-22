<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<div class="row">
  <div class="col-75">
    <div class="container">
    
<html>
<head>
    <%
    if(session.getAttribute("username").equals(null))
{
 
 String loginerror="your'e not logged in ";

  response.sendRedirect("lognbuyer.jsp?error="+loginerror); 
}
    %>
<style>
.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</head>
<body>
    
    <%!
        
  String name="";
  String city="";
  String address="";
  String phone="";
  String pincode="";
  int totalfinal=9999;
  String email="";
        %>
<%
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String driver = "oracle.jdbc.driver.OracleDriver";
  String userName = "sathish"; 
  String password = "sathish";
 
  try {
    Class.forName("oracle.jdbc.driver.OracleDriver");

  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userName,password);
email=(String)session.getAttribute("username");

     name=email;
     city ="Not configured";
      phone="NC";
    address="NC";
     pincode="NC";

//out.println("name"+name+"city:"+city+"phone:"+phone+"address:"+address+"pincode:"+pincode+"email"+email);
  }
  catch(Exception e)
  {
      out.println("Functionality limited.., try again after a few minutes"+e);
      
  }
%> 
            <h3>Billing Address</h3>
            <form>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder=<%=name%>  >
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="<%=email%>"disabled>
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder=<%=address%>>
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder=<%=city%>>

            <div class="row">
              <div class="col-50">
                <label for="state">phone number</label>
                <input type="text" id="state" name="phone" placeholder="<%=phone%>"disabled>
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="<%=pincode%>">
                 <div class="col-51" style="color:green;">
                <label for="amount">Total Amount to be paid</label>
                <input type="text" style="border-color:greenyellow;"id="state" name="totalfinal" placeholder="<%=session.getAttribute("grandtotal")%>"disabled>
              </div>
              </div>
            </div>
          </div>
                <a href="../orderconfirmation?totalfinal=<%=session.getAttribute("grandtotal")%>"> <button type="button" class="btn">Confirm and pay on delivery</button>></a>
      </form>
    </div>
  </div>
 </body>
</html>