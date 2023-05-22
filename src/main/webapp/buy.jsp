<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>
<%@ page import = "java.text.ParseException" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.time.LocalDate"%>
<%
if(session.getAttribute("username") == null)
{
	response.sendRedirect("cart.jsp");
}
Statement st = null;
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	st = con.createStatement();
    	PreparedStatement ps = con.prepareStatement("select * from "+session.getAttribute("username"));
    	ResultSet rs = ps.executeQuery();
    	LocalDate myObj = LocalDate.now();
        String strDate = myObj.toString();
    	while(rs.next())
    	{
    	st.executeUpdate("insert into reports values('"+strDate+"','"+session.getAttribute("username")+"','"+rs.getString("name")+"',"+rs.getInt("quantity")+","+rs.getInt("price")+")");
    	st.executeUpdate("update items set stock = stock - "+rs.getInt("quantity") + " where name = '"+rs.getString("name")+"'");
    	}
    	st.executeUpdate("truncate "+session.getAttribute("username"));
    	RequestDispatcher rd = request.getRequestDispatcher("cart.jsp");
        rd.include(request,response);
    	out.println("<html><head></head><body onload = \'alert('Successfully Ordered')\"></body></html>");
    	response.sendRedirect("cart.jsp");
    }
}
    catch (Exception e) {
        out.println("E");
    }
%>