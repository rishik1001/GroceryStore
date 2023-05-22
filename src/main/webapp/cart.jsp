<%! ResultSet rs; %>
<%! int sum = 0;%>
<%@ page import = "java.sql.*"%>
<%
try{
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://localhost:3306/itmini?useSSL=false&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    String user = "root";
    String mysqlpassword = "Rishik@123";
    Connection con = DriverManager.getConnection(url, user, mysqlpassword);
    if(!con.isClosed())
    {
    	PreparedStatement ps = con.prepareStatement("select * from "+session.getAttribute("username"));
    	rs = ps.executeQuery();
    }
}
    catch (Exception e) {
        out.println("");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="s4.css" />
    <link rel="stylesheet" href="s1.css" />
    <link rel="stylesheet" href="s2.css" />
    <link rel="stylesheet" href="s3.css" />
    <link rel="stylesheet" href="s4.css" />
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
         .button-buy{
 text-decoration:none; 
 text-align:center; 
 padding:13px 35px; 
 border:solid 8px #004F72; 
 -webkit-border-radius:4px;
 -moz-border-radius:4px; 
 border-radius: 4px; 
 font:18px "Trebuchet MS", Arial, Helvetica, sans-serif; 
 font-weight:bold; 
 color:#061414; 
 background-color:#3BA4C7; 
 background-image: -moz-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -webkit-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -o-linear-gradient(top, #3BA4C7 0%, #1982A5 100%); 
 background-image: -ms-linear-gradient(top, #3BA4C7 0% ,#1982A5 100%); 
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1982A5', endColorstr='#1982A5',GradientType=0 ); 
 background-image: linear-gradient(top, #3BA4C7 0% ,#1982A5 100%);   
 -webkit-box-shadow:0px 0px 2px #bababa, inset 0px 0px 1px #ffffff; 
 -moz-box-shadow: 0px 0px 2px #bababa,  inset 0px 0px 1px #ffffff;  
 box-shadow:0px 0px 2px #bababa, inset 0px 0px 1px #ffffff;  
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
                    <span style = "color:white">LogOut</span>
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
        <table width="70%">
        <tr><th> Item Name </th> <th>Item Price </th> <th> Item Quantity </th><th>Total Price </th> <th>Item Image </th><th>Edit</th></tr>
        <% while(rs != null && rs.next()){ %>
          <%sum = sum + rs.getInt("quantity") * rs.getInt("price"); %>
          <tr><td><%out.println(rs.getString("name")); %></td>
          <td><%out.println(rs.getInt("price")); %></td>
          <td><%out.println(rs.getInt("quantity")); %></td>
          <td><% out.println(rs.getInt("quantity") * rs.getInt("price")); %></td>
          <td><img class = "center" src = "<%out.println(rs.getString("pic")); %>" style = "width:100px" style = "height:100px">
          <td>
          <form action = "remove.jsp"><input type = "hidden" name = "item" value = "<%rs.getString("name");%>"><button class = "buttonClass" onclick = "remove.jsp">Remove</button></form></td></tr><br>
    <%} %>
           <tr><td></td><td></td><td></td><td style = "font-size:1.2rem">Total Amount: </td><td style = "font-size:1.2rem"><%out.println(sum); %></td></tr>
    </table>
        </center><br><br>
    <center>
        <a href = "buy.jsp" class = "button-buy">Buy</a>
        <%sum = 0; %>
    </center>
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
