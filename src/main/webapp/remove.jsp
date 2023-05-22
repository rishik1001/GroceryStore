<%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<% 
    String name = request.getParameter("item");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    Statement st = null;
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	st = con.createStatement();
    	st.executeUpdate("delete from "+session.getAttribute("username") + " where name = '"+name+"'");
    	response.sendRedirect("cart.jsp");
    }
%>