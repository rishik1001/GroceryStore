<%! ResultSet rs; %>
<%@ page import = "java.sql.*"%>
<%
if("POST".equalsIgnoreCase(request.getMethod()))
{
try{
	String from = request.getParameter("From");
	String to = request.getParameter("To");
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	
    	if(from == null || to == null)
    	{
    		PreparedStatement ps = con.prepareStatement("select * from reports");
    		rs = ps.executeQuery();
    	}
    	else
    	{
    		PreparedStatement ps = con.prepareStatement("select * from reports where date >= '"+from+"' and date <= '"+to+"'");
    		rs = ps.executeQuery();
    	}
    	
    }
}
    catch (Exception e) {
        out.println("");
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
     <link rel="stylesheet" href="s4.css" />
    <link rel="stylesheet" href="s1.css" />
    <link rel="stylesheet" href="s2.css" />
    <link rel="stylesheet" href="s3.css" />
    <link rel="stylesheet" href="s5.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <style>
            body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(back1.jpg);
        }
    .center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}       
        a #box-shadow{
        text-decoration: none;
        }
        table{
        border-collapse: collapse;
        }th,td{
        color:white;
        text-align:center;
        }
    </style>
</head>

<body>
     <div class = "bar">
            <input type="checkbox" id="check-side">
            <label for="check-side">
                <i class="fas fa-bars" id="btn" style = "color:white"></i>
                <i class="fas fa-times" id="cancel"></i>
            </label>
            <div class="sidebar-check">
                <header>One8 Groceery</header>
                <a href="home.jsp" class="active">
                    <i class="fa fa-home" aria-hidden="true"></i>
                    <span>Home Page</span>
                </a>
                <a href="category.html">
                    <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                    <span>Categories</span>
                </a>
                <a href="#" onclick = "toggle()">
                    <i class="fa fa-user"
                                aria-hidden="true"></i>
                    <span>Sign In</span>
                </a>
                <a href="#">
                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                    <span>Register</span>
                </a>
            </div>
            <div class = "search">
                <form action="search.jsp" class = "search-bar">
                    <input type="text" placeholder="Search Anything" name="search">
                    <input type="submit" hidden />
                </form>
              </div>
              <nav class=navbar>
                <ul class="menu">
                    <li>
                        <a href="cart.jsp" style="color: white" style="font-size: 1.2rem;"><i class="fa fa-shopping-bag"
                                aria-hidden="true" style="font-size:35px"></i></a>
                    </li>
                </ul>
            </nav>
        </div>
        <br>
        <center>
        <h1 style = "color: white">REPORTS</h1><br>
        </center>
        <center>
        <form method = "post" action = "reports.jsp">
        <input type = "date" name = "From" >
        <input type = "date" name = "To" ><br><br>
        <input type = "submit" name = "Apply" class = "buttonClass">
        </form>
        </center><br><br>
        <center>
        <table width="70%">
        <tr><th> Date </th> <th> User </th> <th> Name </th><th> Quantity </th> <th> Price </th></tr>
        <% while(rs != null && rs.next()){ %>
          <tr><td><%out.println(rs.getString("date")); %></td>
          <td><%out.println(rs.getString("user")); %></td>
          <td><%out.println(rs.getString("name")); %></td>
          <td><%out.println(rs.getInt("quantity"));%></td>
          <td><%out.println(rs.getInt("price"));%></td> </tr>
          
    <%} %>
    </table>
        </center><br><br>
    <div id="popup">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="signin">
            Sign In or Sign Up
        </div>
        <form action="#">
            <div class="data">
                <label>Email or Phone</label>
                <input type="text" required>
            </div>
            <div class="data">
                <label>Password</label>
                <input type="password" required>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit">login</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle()">Close</a>
        </div>
    </div>
    <script type="text/javascript">
        function toggle() {
        	<%
            if(session.getAttribute("username") == null)
            {
            	%>
            	var blur = document.getElementById('blur');
                blur.classList.toggle('active');
            	var popup = document.getElementById('popup');
                popup.classList.toggle('active');
                <%
            }
            else
            {
            	%>
            	alert("Already Logged In");
            	<%
            }
            %>
        }
    </script>
</body>