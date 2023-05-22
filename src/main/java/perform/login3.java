package perform;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


@WebServlet("/login3")
public class login3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter out;
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		   res.setContentType("text/html;charset=UTF-8");
	        out = res.getWriter();
	        String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	        String user = "root";
	        String pass = "Rishik@123";
	        String uname = req.getParameter("u");
	    	String password = req.getParameter("p");
	    	
	        
	}

}
<%
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	if(request.getParameter("items") != null)
	{
		taken = Integer.parseInt(request.getParameter("items"));
		pre = 0;
	}
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    Statement st = null;
    Statement st1 = null;
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	st = con.createStatement();
    	rs2 = st.executeQuery("select * from items where category = 'Beverages' and stock > 0 limit pre offset taken");
    	pre = pre + taken;
    }
}
%>
