<!DOCTYPE html>
<html lang="en">

<head>
    <title>one8 Groceery Store</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap">
    <link rel="stylesheet" href="s2.css" />
    <link rel="stylesheet" href="s1.css" />
    <link rel="stylesheet" href="s3.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap">
</head>

<body>
    <div class="parent" id="blur">
        <div>
            <div class="logo">
                <img src="logo1.jpg">
            </div>
            <nav class=navbar>
                <ul class="menu">
                    <li><a href="#2" style="color: white" onclick="toggle1()"><i class="fa fa-plus" aria-hidden="true" style="font-size:35px"></i></a></li>
                    <li>
                        <a href="#4" style="color: white" style="font-size: 1.2rem;"><i class="fa fa-search"
                                aria-hidden="true" style="font-size:35px"></i></a>
                    </li>
                    <li><a href="#" style="color: white" onclick="toggle()"><i class="fa fa-user" style="font-size:35px"
                                aria-hidden="true"></i></a></li>
                    <li>
                        <a href="cart.jsp" style="color: white" style="font-size: 1.2rem;"><i class="fa fa-shopping-bag"
                                aria-hidden="true" style="font-size:35px"></i></a>
                    </li>
                    <li><a href="#2" style="color: white"><i class="fa fa-list" style="font-size:35px"
                                aria-hidden="true"></i></a></li>
                </ul>
            </nav>
        </div>
        <div>
            <div class="sidebar">
                <a class="active" href="#home">Category</a>
                <a href="#fruveg">Fruits and Vegetables</a>
                <a href="#spices">FoodGrains, Oil and Masala</a>
                <a href="#meat">Eggs, Meat and Fish</a>
                <a href="#diary">Diary Products</a>
                <a href="snacks.jsp">Snacks</a>
                <a href="beverages.jsp">Beverages</a>
            </div>
        </div>
   </div>
        <div id="popup">
            <label for="show" class="close-btn fas fa-times" title="close"></label>
            <div class="signin">
                Sign In or Sign Up
            </div>
            <form method = "post" action = "login1.jsp">
                <div class="data">
                    <label>Email or Phone</label>
                    <input type="text" name = "u" required>
                </div>
                <div class="data">
                    <label>Password</label>
                    <input type="password" name = "p" required>
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
        <div id="popupadd">
        <label for="show" class="close-btn fas fa-times" title="close"></label>
        <div class="Add">
               Add Stock
         </div>
        <form method ="post" enctype="multipart/form-data" action = "uploadImage">
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
            </div><br>
            <div class = "formimage">
            <label>Item Image: </label>
           <input type="file" name = "image" required/>
            </div>
            <div class="btn">
                <div class="inner"></div>
                <button type="submit">Add</button>
            </div>
        </form>
        <div style="text-align: center;">
            <a href="#" style="text-align: center" onclick="toggle1()">Close</a>
        </div>
    </div>
        <script type="text/javascript">
            function toggle() {
                var blur = document.getElementById('blur');
                blur.classList.toggle('active');
                var popup = document.getElementById('popup');
                popup.classList.toggle('active');
            }
            function toggle1() {
                var blur = document.getElementById('blur');
                blur.classList.toggle('active');
                var popupadd = document.getElementById('popupadd');
                popupadd.classList.toggle('active');
            }
        </script>
</body>