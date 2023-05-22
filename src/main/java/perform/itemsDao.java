package perform;
import java.sql.*;
import java.util.*;
public class itemsDao
{
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","","");
		}catch(Exception e){System.out.println(e);}
		return con;
	}

	public static List<items> getRecords(int start,int total){
		List<items> list=new ArrayList<items>();
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("select * from emp limit "+(start-1)+","+total);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				items e=new items();
				e.setId(rs.getInt(1));
				e.setName(rs.getString(2));
				e.setSalary(rs.getFloat(3));
				list.add(e);
			}
			con.close();
		}catch(Exception e){System.out.println(e);}
		return list;
	}
}