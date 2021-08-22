import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;
import jspPrograms.DbConnect;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		int active = 1;
		int count = 0;
		PrintWriter out = response.getWriter();
		Connection conn = null;
		HttpSession session = request.getSession(true);
		try {
			conn = new DbConnect().connect();
			String username = request.getParameter("username");
			String password1 = request.getParameter("password");
			String strQuery = "select * from authuser where username='" + username + "' and  password='" + password1
					+ "'";
			System.out.println(strQuery);
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(strQuery);
			while (rs.next()) {
				active = rs.getInt("isactive");
				System.out.println(active);
				if (active == 1) {
					session.setAttribute("username", rs.getString(1));
				}

				count++;
			}
			if (count > 0 && active == 1) {
				response.sendRedirect("address.jsp");
				st.execute("delete from booktemp");
				String s = rs.getString("username");
			} else if (count > 0 && active == 0) {
				String error = "Account is deactivated";
				response.sendRedirect("logn.jsp?error=account is deactivated contact admin");
			} else {
				String error = "invalid username or password";
				response.sendRedirect("logn.jsp?error=invalid username or password");

			}
		}

		catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
