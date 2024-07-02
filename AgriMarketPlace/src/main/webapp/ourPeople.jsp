<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title></title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	overflow: hidden;
}
div.gallery {
	border: 1px solid #ccc;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}

* {
	box-sizing: border-box;
}

.responsive {
	padding: 0 6px;
	float: left;
	width: 24.99999%;
}

@media only screen and (max-width: 700px) {
	.responsive {
		width: 49.99999%;
		margin: 6px 0;
	}
}

@media only screen and (max-width: 500px) {
	.responsive {
		width: 100%;
	}
}

.clearfix:after {
	content: "";
	display: table;
	clear: both;
}

nav {
	padding: 0px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: white;
}

.logo {
	font-size: 1.5rem;
	width: 251px;
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

.text4 {
	font-family: cursive;
	text-align: center;
	font-family: bold;
	font-size: 30px;
}
</style>
</head>
<body>
	</nav>
	</header>
	<header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="Screenshot (188).png"
				alt="Logo" class="logo"></a>
			<ul class="nav-links">
				<li><a href="Home1.html">Home</a></li>

				<li><a href="MarketCategory.html">Market</a></li>
				<li class="dropdown"><a href="#">About Us</a>
					<div class="dropdown-content">
						<a href="#">Our Team</a> <a href="OurCompany.html">Our Company</a>
					</div></li>
				<li>
					<div class="dropdown1">
						<a href="DisplayUserServlet" class="logo1"> <i
							class="fa fa-bars" style="font-size: 32px;"> </i></a>
			</ul>
		</nav>
	</header>
	<div class="text4">
		<h2>
			<font color="#6f6e6c">OUR</font> <font color="#74ab4f">TEAM</font></h2>
	</div>
	<div style="padding: 6px;">
		<center>
			<h2>This is our team that works daily to connect farmers with
				the agro-industry. Our proximity, where the transaction is
				completely transparent, allows both parties to access a much broader
				market at no cost.</h2>
		</center>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a target="_blank" href="img_5terre.jpg"> <img
				src="https://images.squarespace-cdn.com/content/v1/5cf0d08d5fc69d000172462a/1642347554523-XJMYFZU9O0CV45T1WAV7/Gabriel+Business+Headshot+for+LinkedIn.jpg"
				alt="Cinque Terre" width="600" height="400">
			</a>
			<div class="desc">Leon Samuel CO-FOUNDER</div>
		</div>
	</div>


	<div class="responsive">
		<div class="gallery">
			<a target="_blank" href="img_forest.jpg"> <img
				src="https://images.squarespace-cdn.com/content/v1/5cf0d08d5fc69d000172462a/1705476712710-LLDP527W5TC7ESW98C8E/Hudhaifa+Headshot+for+LinkedIn+Profile.jpg"
				alt="Forest" width="600" height="400">
			</a>
			<div class="desc">Anderson CO-FOUNDER & CEO</div>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a target="_blank" href="img_lights.jpg"> <img
				src="https://images.squarespace-cdn.com/content/v1/5cf0d08d5fc69d000172462a/1642347554523-XJMYFZU9O0CV45T1WAV7/Gabriel+Business+Headshot+for+LinkedIn.jpg"
				alt="Cinque Terre" width="600" height="400">
			</a>
			<div class="desc">Alberto Silva CO-FOUNDER & CFO</div>
		</div>
	</div>

	<div class="responsive">
		<div class="gallery">
			<a target="_blank" href="img_mountains.jpg"> <img
				src="https://images.squarespace-cdn.com/content/v1/5cf0d08d5fc69d000172462a/1705476712710-LLDP527W5TC7ESW98C8E/Hudhaifa+Headshot+for+LinkedIn+Profile.jpg"
				alt="Forest" width="600" height="400">
			</a>
			<div class="desc">Edward CO-FOUNDER</div>
		</div>

		<div class="clearfix"></div>
</body>
</html>