<%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<% 
    String name = request.getParameter("name");
	int stock = Integer.parseInt(request.getParameter("stock"));
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    Statement st = null;
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	st = con.createStatement();
    	PreparedStatement ps = con.prepareStatement("select * from items");
    	ResultSet rs1 = ps.executeQuery();
    	int k = 0;
    	while(rs1.next())
    	{
    		if(name != "" && name.equals(rs1.getString("name")))
    		{
    			st.executeUpdate("update items set stock = stock + "+stock+" where name = '"+name+"'");
    			response.sendRedirect("home.jsp");
    		}
    	}
    }
%>