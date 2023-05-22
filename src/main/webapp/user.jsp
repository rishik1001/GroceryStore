 <%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="s1.css" />
    <link rel="stylesheet" href="s4.css" />
    <link rel="stylesheet" href="s2.css" />
    <link rel="stylesheet" href="s3.css" />
    <link rel="stylesheet" href="s5.css" />
    <link rel="stylesheet" href="s6.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
</head>

<body>
    <div class = "parent" id = "blur">
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
        </div><br><br>
        <div style = "padding-top: 200px;">
        <center>
        <h1 style = "color: white" style = "font-size: 5rem;">Welcome to ONE8 GROCEERY STORE</h1>
        </center><br>
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

</html>