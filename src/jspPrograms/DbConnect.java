package jspPrograms;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnect 
{
	public Connection connect() throws ClassNotFoundException, SQLException
	{
		  String userName = "sathish"; 
		  String password = "sathish";
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",userName,password);
		return conn;
	}

}
