import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspPrograms.DbConnect;
@WebServlet("/addbook")
public class AddBook extends HttpServlet {

    public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
        PrintWriter out = res.getWriter();
        int i=0;
        HttpSession session = req.getSession();
        String bookname= req.getParameter("bookname");
        String author = req.getParameter("author");
       String description = req.getParameter("description");
       String url= (String) req.getParameter("url");
        int price = Integer.parseInt(req.getParameter("price"));
        Random rand = new Random(); 
        int uid = rand.nextInt(10000);
             try {
            Connection con = new DbConnect().connect();
            PreparedStatement ps = con.prepareStatement(
                    "insert into book values(?,?,?,?,?,?)");
            ps.setInt(1, uid);
            ps.setString(2, bookname);
            ps.setString(3, author);
            System.out.println("Author Name"+author);
            ps.setString(4, description);
            ps.setInt(5, price);
            ps.setString(6, url);
            try 
            {
               i = ps.executeUpdate();      
            } 
            catch (Exception e)
            {
            	e.printStackTrace();
            }
            if(i>0)
                {
                    out.println("successfully updated");
                    res.sendRedirect("book.jsp");
                }
                else 
                {
                    out.println("updation failed");
                }
            
        } catch(Exception e)
             {
        	e.printStackTrace();
             }
    }
}
