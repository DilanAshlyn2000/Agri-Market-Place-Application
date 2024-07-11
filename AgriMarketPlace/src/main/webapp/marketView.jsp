<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Category Selection</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	overflow: hidden;
}
.container {
	max-width: 800px;
	margin: -25px auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.card {
	width: calc(50% - 40px);
	/* Adjust width to fit two cards in a row with some margin */
	height: 236px; /* Set a fixed height for the card */
	margin: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease;
	cursor: pointer;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	overflow: hidden; /* Hide overflow to ensure image fits entirely */
}

.card:hover {
	transform: translateY(-5px);
}

.card img {
	width: 100%;
	height: 100%; /* Make image fill the card */
	object-fit: cover; /* Ensure the entire image is visible */
}

.card p {
	text-align: center;
	padding: 10px 0;
	font-weight: bold;
	color: #333;
	margin: 0; 
	position: absolute; 
	bottom: 0; 
	background-color: rgba(255, 255, 255, 0.8);
	
	width: 100%; 
	box-sizing: border-box;
	
	transition: opacity 0.3s ease; 
	opacity: 0;
}

.card:hover p {
	opacity: 1; 
}

input[type="image"] {
	position: absolute;
	top: 78px;
	height: 58px;
	right: 35px;
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

.text4 {
	font-family: cursive;
	text-align: center;
	font-family: bold;
	font-size: 30px;
}
</style>
</head>
<body>
	<header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="pictures/Screenshot (188).png"
				alt="Logo" class="logo"></a>
			<ul class="nav-links">
				<li><a href="homePageAdmin.jsp">Home</a></li>

				<li><a href="marketView.jsp">Market</a></li>
				<li class="dropdown"><a href="#">About Us</a>
					<div class="dropdown-content">
						<a href="OurPeople.html">Our Team</a> <a href="OurCompany.html">Our
							Company</a>
					</div></li>


			</ul>
		</nav>
	</header>
	<div class="text4">
		<h2>
			<font color="#6f6e6c">C</font> <font color="">A</font> <font
				color="#6f6e6c">T</font> <font color="#74ab4f">E</font> <font
				color="#74ab4f">G</font> <font color="#74ab4f">O</font> <font
				color="#74ab4f">R</font> <font color="#74ab4f">I</font> <font
				color="#74ab4f">E</font> <font color="#74ab4f">S</font>
		</h2>
	</div>

	<div class="container">
		<div class="card" onclick="selectCategory(2)">
			<img src=https://cdn.pixabay.com/photo/2016/10/25/13/16/pumpkin-1768857_1280.jpg alt="Vegetables">
			<p>VEGETABLES</p>
		</div>
		<div class="card" onclick="selectCategory(1)">
			<img src=https://cdn.pixabay.com/photo/2015/12/30/11/57/fruits-1114060_1280.jpg alt="Fruits">
			<p>FRUITS</p>
		</div>
		<div class="card" onclick="selectCategory(4)">
			<img src=https://st5.depositphotos.com/14096468/67729/i/450/depositphotos_677297868-stock-photo-different-types-legumes-bowls-green.jpg alt="Flowers">
			<p>GRAINS & CEREALS</p>
		</div>
		<div class="card" onclick="selectCategory(3)">
			<img src=https://media.istockphoto.com/id/639201332/photo/composition-with-dried-fruits-and-assorted-nuts.jpg?s=612x612&w=0&k=20&c=5Zj_z3volaNDfqWi-qp5_49d-0KWRfVjnnAEYHdE2YI= alt="Grains & Cereals">
			<p>NUTS</p>
		</div>
	</div>
	<form action="CartView" method="get">
		<input type="image" src="pictures/q7.jpg" alt="Submit">
	</form>
	
	<script>
    function selectCategory(categoryId) {
    window.location.href = '/searchCategory?type=' + categoryId;
    }
</script>
</body>
</html> 