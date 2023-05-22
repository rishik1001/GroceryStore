 <%@ page import = "java.sql.*"%>
<%@ page import="java.io.*" %> 
<!DOCTYPE html>
<html lang="en">
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
    <style>
    .footer {
   left: 0;
   bottom: 0;
   width: 100%;
   color: white;
   text-align: center;
}</style>
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
                 <a href="#" onclick = "toggle2()">
                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                    <span style = "color:white">Add Stock</span>
                </a>
                <a href="#" onclick = "toggle3()">
                    <i class="fa fa-cart-plus" aria-hidden="true"></i>
                    <span style = "color:white">Update Stock</span>
                </a>
                <a href="reports.jsp">
                <i class="fa fa-envelope-open-o" aria-hidden="true"></i>
                    <span style = "color:white">Reports</span>
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
        <center>
        <h1 style = "color: white">Welcome to ONE8 GROCEERY STORE</h1>
        </center><br><br>
    </div>
    <div id="popup" name = "signin">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="signin">
            Sign In or Sign Up
        </div>
        <form action="login1.jsp" method = "post" name = "signin">
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
     <div class="footer">
     <nav class=navbar>
                <ul class="menu">
                    <li>
                        <a href="user.jsp" style="font-size: 1.2rem;"><i class="fa fa-home" style="font-size:35px" aria-hidden="true"></i>Home</a>
                    </li>
                                        <li>
                        <a href="#"  style="font-size: 1.2rem;"><i class="fa fa-user"
                                aria-hidden="true" style="font-size:35px"></i>Sign In</a>
                    </li>
                                        
                                        <li>
                        <a href="cart.jsp" style="font-size: 1.2rem;"><i class="fa fa-shopping-bag"
                                aria-hidden="true" style="font-size:35px"></i>Cart</a>
                    </li>
                </ul>
            </nav>
</div>
     <div id="popupadd">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="Add">
               Add Stock
         </div>
        <form method ="post" enctype="multipart/form-data" action = "uploadImage" name = "stockadd">
            <div class="data">
                <label>Item Name: </label>
                <input type="text" name = "name" required>
            </div>
            <div class="data">
                <label>Item Price: </label>
                <input type="text" name = "price" required>
            </div>
            <div class="data">
                <label>Item Description: </label>
                <input type="text" name = "desc" required>
            </div>
             <div class="formcate">
                <label>Item Category: </label>
                 <select id = "cate" name = "cate">
            <option value = "Fruits and Vegetables">Fruits and Vegetables</option>
            <option value = "FoodGrains, Oil and Masala">FoodGrains, Oil and Masala</option>
            <option value = "Eggs, Meat and Fish">Eggs, Meat and Fish</option>
            <option value = "Diary Products">Diary Products</option>
            <option value = "Snacks">Snacks</option>
            <option value = "Beverages">Beverages</option>
            </select>
            </div>
            <div class="data">
                <label>Item Stock: </label>
                <input type="text" name = "stock" required>
            </div>
            <div class = "formimage">
            <label>Item Image: </label>
           <input type="file" name = "image" required/>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit" onclick = "return validation2()">Add</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle2()">Close</a>
        </div>
    </div>
    <div id="update">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="signin">
            Update Stock
        </div>
        <form action="update.jsp" method = "post" name = "update">
            <div class="data">
                <label>Item Name: </label>
                <input type="text" name = "name" required>
            </div>
            <div class="data">
                <label>Stock</label>
                <input type="text" name = "stock" required>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit" onclick = "return validation3()">Update</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle3()">Close</a>
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
    function validation2()
    {
    	let u = document.forms["stockadd"]["price"].value;
    	let v = document.forms["stockadd"]["stock"].value;
    	if(!isNaN(u))
    	{
    		alert("Only Numbers are allowed in Stock");
    		return false;
    	}
    	if(!isNaN(v))
    	{
    		alert("Only Numbers are allowed in Price");
    		return false;
    	}
    	return true;
    }
    function validation3()
    {
    	let u = document.forms["update"]["stock"].value;
    	if(!isNaN(u))
    	{
    		alert("Only Numbers are allowed in Stock");
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
        	alert("Logged in as admin");
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
        	alert("Logged In");
        	<%
        }
        %>
    }
    function toggle2()
    {
    	var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var popupadd = document.getElementById('popupadd');
        popupadd.classList.toggle('active');
    }
    function toggle3()
    {
    	var blur = document.getElementById('blur');
        blur.classList.toggle('active');
        var update = document.getElementById('update');
        update.classList.toggle('active');
    }
    </script>
</body>

</html>