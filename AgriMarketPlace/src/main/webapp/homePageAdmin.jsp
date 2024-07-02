<!-- <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	overflow: hidden;
}

header {
	background-color: #333;
	color: #fff;
}

nav {
	padding: 0px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 1.5rem;
	width: 251px;
	position: relative;
	left: -148px;
}

.login-signup {
	display: flex;
	align-items: center;
	position: relative;
	left: 86%;
}

.login-signup a {
	text-decoration: none;
	color: #fff;
	padding: 10px;
}

.login-signup .login {
	margin-right: 10px;
}

.signup {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
}

.signup:hover {
	background-color: #45a049;
}

.content {
	padding: 20px;
}

.header1 {
	background-color: white;
	color: black;
}

.nav-links {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
}

.nav-links li {
	margin-right: 20px;
}

.nav-links li a {
	text-decoration: none;
	color: #000;
	transition: color 0.3s;
}

.nav-links li a:hover {
	color: olive;
}

.dropdown {
	position: relative;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown-content a {
	color: #000;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

h1 {
	position: absolute;
	top: -28px;
	color: #74ab4f;
	left: 403px;
	font-size: 3pc;
}
</style>
<body>

	<header>
		<nav>
			<div class="login-signup">

				<a href="Home1.html">
					<button class="signup">LOGOUT</button>
				</a>
			</div>

		</nav>
	</header>
	<header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="Screenshot (188).png"
				alt="Logo" class="logo"></a>
			<ul class="nav-links">
				<li><a href="homePageAdmin.jsp">Home</a></li>
				<li><a href="/displayUser">User Details</a></li>
				<li><a href="Category.html">Add Category</a></li>
				<li><a href="DisplayCategory">View Category</a></li>
				<li><a href="DisplayProductAdminSide">View Products</a></li>
			</ul>
		</nav>
	</header>
	<h1>AGRIMARKETPLACE</h1>
	<img
		src="https://images.unsplash.com/photo-1573246123716-6b1782bfc499?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
		alt="image" width="100%" height="650" class="img2">
</body>
</html>  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agrimarketplace Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            overflow-x: hidden; /* Prevent horizontal scrollbar */
        }

        .dashboard-container {
            display: grid;
            grid-template-columns: 250px auto;
            grid-template-rows: 100vh; /* Adjust height as needed */
            grid-template-areas: 
                "sidebar main-content";
        }

        .sidebar {
            grid-area: sidebar;
            background:black;
            /* Adjust gradient colors as per your preference */
            color: #fff;
            padding: 20px;
            height: 100vh; /* Adjust height to fit viewport */
            overflow-y: auto; /* Enable scrolling for long content */
            display: flex;
            flex-direction: column; /* Ensure contact details stay at the bottom */
            align-items: center; /* Center items vertically */
        }

        .sidebar .logo {
            margin-bottom: 20px;
        }

        .sidebar .logo img {
            width: 100px; /* Adjust logo size as needed */
            height: auto;
            border-radius: 50%; /* Make logo round */
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            /* Adjust hover background color */
        }

        .sidebar ul li a .fa {
            margin-right: 10px;
        }

        .contact-details {
            margin-top: auto; /* Push contact details to the bottom */
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.2); /* Semi-transparent background */
            border-top: 1px solid rgba(255, 255, 255, 0.1); /* Light border */
            width: 100%; /* Ensure contact details stretch across */
            text-align: center; /* Center text */
        }

        .contact-details h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: white;
        }

        .contact-details p {
            font-size: 14px;
            color: white;
            margin-bottom: 5px;
        }

        .main-content {
            grid-area: main-content;
            padding: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                grid-template-columns: auto;
                grid-template-areas: 
                    "main-content"
                    "sidebar";
            }

            .sidebar {
                height: auto;
                max-height: 60vh; /* Limit height on smaller screens */
                overflow-y: auto;
                overflow-x: hidden;
            }
        }
        .main-content {
            grid-area: main-content;
            padding: 20px;
            background-image: url('pictures/f3.jpg'); /* Replace with your image path */
            background-size: cover; /* Cover the entire area */
            background-position: center; /* Center the background image */
            color: #333; /* Text color for better readability on background */
        }
        
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">
                <img src="pictures/Screenshot (188).png" alt="Agrimarketplace Logo">
            </div>
            <h2>Agrimarketplace</h2>
            <ul>
                <li><a href="/displayUser"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="addCategory.jsp"><i class="fas fa-th"></i> Categories</a></li>
                <li><a href="addProduct.jsp"><i class="fas fa-plus"></i> Add Product</a></li>
                <li><a href="#my-products"><i class="fas fa-box"></i> My Products</a></li>
            </ul>
            <div class="contact-details">
                <h3>Contact Details</h3>
                <p>Email: milan01@admin.com</p>
                <p>Phone: 9987656743</p>
            </div>
        </div>
       <div class="main-content">
            <!-- Main content here -->
           
             </div>
    </div>
   
</body>
</html>




