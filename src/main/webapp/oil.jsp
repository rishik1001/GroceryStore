<!DOCTYPE html>
<html lang="en">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*"%>

<%! Blob image = null;%>
<%! ResultSet rs2 = null;%>
<%! byte[ ] imgData = null ;%>
<%! int count = 0; %>
<%
Connection con1 = null;
Statement stmt = null;

try {

   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
   String user = "root";
   String pass = "Rishik@123";
   con1 = DriverManager.getConnection(url,user,pass);
   stmt = con1.createStatement();
   rs2 = stmt.executeQuery("select * from items where category = 'FoodGrains, Oil and Masala' and stock > 0");
} 
   catch (Exception e){
   out.println("Unable To Display image");
   out.println("Image Display Error=" + e.getMessage());
   return;
} 

%>
<%
String x = request.getParameter("submit");
if ("POST".equalsIgnoreCase(request.getMethod()))
{
	String name = request.getParameter("drink");
	int qty = Integer.parseInt(request.getParameter("qty"));
	int price = Integer.parseInt(request.getParameter("price"));
	String img = request.getParameter("image");
	String desc = request.getParameter("desc");
	out.println(name + " " + qty + " " + price);
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
    	PreparedStatement ps = con.prepareStatement("select * from "+session.getAttribute("username"));
    	ResultSet rs1 = ps.executeQuery();
    	int k = 0;
    	while(rs1.next())
    	{
    		if(name != "" && name.equals(rs1.getString("name")))
    		{
    			k = 1;
    			st.executeUpdate("update "+session.getAttribute("username")+" set quantity = "+qty+" where name = '"+name+"'");
    			
    			response.sendRedirect("oil.jsp");
    			break;
    		}
    	}
    	if(k == 0)
    	{
    		st.executeUpdate("insert into "+session.getAttribute("username")+" values('"+name+"',"+qty+","+price+",'"+desc+"','"+img+"')");
    		response.sendRedirect("oil.jsp");
    	}
    }
}

%>
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
    </style>
</head>

<body>
<div id = "blur">
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
                    <span style = "color:white">Home Page</span>
                </a>
                <a href="category.jsp">
                    <i class="fa fa-shopping-basket" aria-hidden="true"></i>
                    <span style = "color:white">Categories</span>
                </a>
                <a href="#" onclick = "toggle()">
                    <i class="fa fa-user"
                                aria-hidden="true"></i>
                    <span style = "color:white">Sign In</span>
                </a>
                <a href="#" onclick = "toggle1()">
                    <i class="fa fa-user-plus" aria-hidden="true"></i>
                    <span style = "color:white">Register</span>
                </a>
                <a href="logout.jsp">
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                    <span style = "color:white">LogOut.jsp</span>
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
        </div><br>
        <div class = "type">
            <div class = "type-image">
                <p style = "color:white">FoodGrains, Oil and Masala</p>
            </div>
        </div>
        <div class = "list">
            <% while(rs2.next()){%>
             <%if(count % 4 == 0)
             {%>
            	<a href="#">
                <div class="items" style="margin-left:250px;">
                    <div class="items-indi">
                        <%image = rs2.getBlob("pic");
                          imgData = image.getBytes(1,(int)image.length());;
                          String imgDataBase64=new String(Base64.getEncoder().encode(imgData));%>
                        <img src = "data:image/gif;base64,<%= imgDataBase64 %>">
                    </div>
                    <div class = "item-desc">
                        <b style = "font-size: 1.2rem;"><%out.println(rs2.getString("name")); %><br>Rs: <%out.println(rs2.getInt("price")); %></b><br>
                        <form method = "post" action = "oil.jsp">
                            <label>Qty</label>
                            <input type = "hidden" value = <%out.println(rs2.getString("name")); %> name = "drink">
                            <input type = "hidden" value = <%out.println(rs2.getInt("price")); %> name = "price">
                            <input type = "text" style = "width:50px" name = "qty">
                             <input type = "hidden" value = <%out.println(rs2.getString("description")); %> name = "desc">
                            <input type = "hidden" value = "data:image/gif;base64,<%= imgDataBase64 %>"  name = "image">
                            <input type = "submit" value = "Add to Cart" name = "submit">
                        </form>
                    </div>
                </div>
            </a>
             <%}
            if(count % 4 != 0){ %>
            <a href="#">
                <div class="items">
                    <div class="items-indi">
                        <%image = rs2.getBlob("pic");
                          imgData = image.getBytes(1,(int)image.length());;
                          String imgDataBase64=new String(Base64.getEncoder().encode(imgData));%>
                        <img src = "data:image/gif;base64,<%= imgDataBase64 %>">
                    </div>
                    <div class = "item-desc">
                        <b style = "font-size: 1.2rem;"><%out.println(rs2.getString("name")); %><br>Rs: <%out.println(rs2.getInt("price"));%></b><br>
                        <form method = "post" action = "oil.jsp">
                            <label>Qty</label>
                            <input type = "hidden" value = <%out.println(rs2.getString("name")); %> name = "drink">
                            <input type = "hidden" value = <%out.println(rs2.getInt("price")); %> name = "price">
                            <input type = "text" style = "width:50px" name = "qty">
                            <input type = "hidden" value = <%out.println(rs2.getString("description")); %> name = "desc">
                            <input type = "hidden" value = "data:image/gif;base64,<%= imgDataBase64 %>" name = "image">
                            <input type = "submit" value = "Add to Cart" name = "submit">
                        </form>
                    </div>
                </div>
            </a>
            <%} %>
            <%count++; %>
            <%}
            count = 0;%>
        </div>
       </div>
    <div id="popup" name = "signin">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="signin">
            Sign In or Sign Up
        </div>
        <form action="login1.jsp" method = "post">
            <div class="data">
                <label>Username</label>
                <input type="text" name = "u" required>
            </div>
            <div class="data">
                <label>Password</label>
                <input type="password" name = "p" required>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit" onclick = "return validation()">login</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle()">Close</a>
        </div>
     </div>
    <div id="register">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="signin">
            Register
        </div>
        <form action="register.jsp" method = "post" name = "register">
            <div class="data">
                <label>Username</label>
                <input type="text" name = "u" required>
            </div>
            <div class="data">
                <label>Password</label>
                <input type="password" name = "p" required>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit" onclick = "return validation1()">login</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle1()">Close</a>
        </div>
     </div>
    <script type="text/javascript">
    function validation()
    {
    	let u = document.forms["signin"]["u"].value;
    	if(!/^[a-zA-Z],]+$/.test(u))
    	{
    		
    		alert("Username should not contains spaces");
    		return false;
    	}
    }
    function validation1()
    {
    	let u = document.forms["register"]["u"].value;
    	if(!/^[a-zA-Z],]+$/.test(u))
    	{
    		alert("Username should not contains spaces");
    		return false;
    	}
    }
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
    function toggle1()
    {
    	<%
        if(session.getAttribute("username") == null)
        {
        	%>
        	var blur = document.getElementById('blur');
            blur.classList.toggle('active');
        	var register = document.getElementById('register');
            register.classList.toggle('active');
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