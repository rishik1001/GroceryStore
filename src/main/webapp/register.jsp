 <%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %> 
<%
      String connectionURL = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
      Connection connection = null;         
      Statement statement = null;
try {
	String uname1 = request.getParameter("u");
    String pass1 = request.getParameter("p");
    Class.forName("com.mysql.jdbc.Driver");
    connection = DriverManager.getConnection(connectionURL, "root", "Rishik@123");
    statement = connection.createStatement();
    if(!connection.isClosed())
    {
    	PreparedStatement ps = connection.prepareStatement("select * from login");
    	ResultSet rs = ps.executeQuery();
    	while(rs.next())
    	{
    		if(uname1 == rs.getString("username"))
    		{
    			RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
    			rd.forward(request, response);
    			out.println("<html><head></head><body onload = \"alert('User Already Exists Registered');window.location = 'register.jsp';\"></body></html>");
    			
    		}
    	}
    }
    String QueryString = "insert into login values('"+uname1+"','"+pass1+"','user')";
    statement.executeUpdate(QueryString);
			 response.sendRedirect("home.jsp");
		}
		finally {
           statement.close();
           connection.close();
       }
%>