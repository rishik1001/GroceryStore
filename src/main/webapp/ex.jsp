<%@ page import = "java.sql.*"%>
<%
try{
	String from = request.getParameter("From");
	String to = request.getParameter("To");
	out.println(from + " " + to);
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	
    	if(from == "" || to == "")
    	{
    		PreparedStatement ps = con.prepareStatement("select * from reports");
    		ResultSet rs = ps.executeQuery();
    	}
    	else
    	{
    		PreparedStatement ps = con.prepareStatement("select * from reports where date >= '"+from+"' and date <= '"+to+"'");
    		ResultSet rs = ps.executeQuery();
    	}
    	
    }
}
    catch (Exception e) {
        out.println("");
    }
 %>