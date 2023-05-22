<%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
 <%
try{
	String uname = (String)request.getParameter("u");
	String pass = (String)request.getParameter("p");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	PreparedStatement ps = con.prepareStatement("select * from login");
    	ResultSet rs = ps.executeQuery();
    	RequestDispatcher rd = request.getRequestDispatcher("user.jsp");
        rd.include(request,response);
    	while(rs.next() && uname != null)
    	{
    		if(rs.getString("username").equals(uname))
    		{
    			if(rs.getString("password").equals(pass))
    			{
                     session.setAttribute("username",uname);
                     session.setAttribute("taken",10);
                	 session.setAttribute("pre",0);
                	 session.setAttribute("sum",0);
                     String connectionURL = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
         Connection connection = null;
                     
         Statement statement = null;
                     try {
                         
             Class.forName("com.mysql.jdbc.Driver");
             connection = DriverManager.getConnection(connectionURL, "root", "Rishik@123");
             statement = connection.createStatement();
             String QueryString = "create table "+session.getAttribute("username")+"(name varchar(20),quantity int,price int,description varchar(40),pic longblob)";
             statement.executeUpdate(QueryString);
    			}
    			finally {
                    statement.close();
                    connection.close();
                }
                     
                     if(uname.equals("root"))
                     {
                    	 session.setAttribute("user","admin");
                         out.println("<html><head></head><body onload = \"alert('Logged in as admin')\"></body></html>");
                    	 response.sendRedirect("home.jsp");
                     }
                     else
                     {
                    	 out.println("<html><head></head><body onload = \"alert('Logged in as user')\"></body></html>");
                         session.setAttribute("user","user");
                         response.sendRedirect("user.jsp");
                     }
    			}
    			else
    			{
    				
                    out.println("<html><head></head><body onload = \"alert('Wrong Password')\"></body></html>");
               	    response.sendRedirect("user.jsp");
    			}
    		}
    		else
    		{
    			
                out.println("<html><head></head><body onload = \"alert('User Not Found')\"></body></html>");
           	    response.sendRedirect("user.jsp");
    		}
    	}
    }
}
catch (Exception e) {
    out.println("Error");
}
%>