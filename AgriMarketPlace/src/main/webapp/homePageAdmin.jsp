<!DOCTYPE html>
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
</html>