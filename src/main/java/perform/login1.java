package perform;
import java.lang.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.*;

@WebServlet("/login1")
public class login1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		String userid = req.getParameter("user");
		String pass = req.getParameter("password");
	    out.println(userid + " " + pass);
		String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
        String user = "root";
        String mysqlpassword = "Rishik@123";
	}

}
