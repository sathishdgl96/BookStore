

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspPrograms.DbConnect;

@WebServlet("/addtocart")
public class addtocart extends HttpServlet
{
public void service(HttpServletRequest req,HttpServletResponse res) throws IOException
{
    HttpSession session=req.getSession();
    Random rd=new Random();
    String bookname=req.getParameter("bookname");
    String author=req.getParameter("author");
    int quantity=Integer.parseInt(req.getParameter("quantity"));
    int price=Integer.parseInt(req.getParameter("price"));
    int totalprice=price*quantity;
    try {
           Connection con=new DbConnect().connect();
            PreparedStatement ps = con.prepareStatement(
                    "insert into booktemp values(?,?,?,?,?)");
            ps.setInt(1, rd.nextInt(2));
            ps.setString(2, bookname);
            ps.setString(3, author);
            ps.setInt(4, quantity);
            ps.setInt(5, totalprice);
            int i = 0;

            try 
            {
                i = ps.executeUpdate();           
            } 
            catch (SQLException ex) {
            }
            if(i>0)
                {
                   
                    res.sendRedirect("addcart.jsp");
                }
                else 
                {
                	PrintWriter out=res.getWriter();
                    out.println("updation failed");
                }
            
            int grandtotal=0;
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select SUM(total) from booktemp");
            while(rs.next())
            {
            	grandtotal=rs.getInt(1);
            }
            System.out.println("Final total"+grandtotal);
            session.setAttribute("grandtotal", grandtotal);
        } 
    catch(Exception e)
    {
       e.printStackTrace();
    }
    }
}

