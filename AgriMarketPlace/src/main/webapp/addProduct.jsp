<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert Product</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 400px;
	margin: 50px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	margin-bottom: 20px;
	color: #007bff;
}

form {
	display: grid;
	gap: 10px;
}

label {
	font-weight: bold;
	color: #333;
}

input[type="number"], input[type="text"], textarea, select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-size: 14px;
}

textarea {
	resize: vertical;
}

button[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

.header1 {
	background: linear-gradient(to right, #00c6ff, #0072ff);
	color: white;
	padding: 10px 0;
}

.nav-links {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	align-items: center;
}

.nav-links li {
	margin-right: 20px;
}

.nav-links li a {
	text-decoration: none;
	color: white;
	font-weight: bold;
	transition: color 0.3s;
}

.nav-links li a:hover {
	color: #e5f1ff;
}

nav {
	padding: 0 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-size: 1.5rem;
	width: 150px;
	display: flex;
	align-items: center;
}

.logo img {
	width: 40px;
	height: auto;
	margin-right: 10px;
	border-radius: 50%;
}
</style>
</head>
<body>
	<header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="logo.png" alt="Logo"> BrandName</a>
			<ul class="nav-links">
				<li><a href="home.html">Home</a></li>
				<li><a href="Product.html">Add Product</a></li>
				<li><a href="DisplayProduct">View Product</a></li>
			</ul>
		</nav>
	</header>
	<div class="container">
		<h2>Insert Product</h2>
		<form action="ProductServlet" method="post" enctype="multipart/form-data">
			<label for="productName">Product Name:</label>
			<input type="text" id="productName" name="productName" placeholder="Enter Product Name" required>
			
			<label for="farmerId">Farmer ID:</label>
			<input type="number" id="farmerId" name="farmerId" placeholder="Enter Farmer ID" pattern="[0-9]+" required>
			
			<label for="photo">Upload Photo:</label>
			<input type="file" name="fileToUpload" id="fileToUpload">
			
			<label for="description">Description:</label>
			<textarea id="description" name="description" placeholder="Enter Description" required></textarea>
			
			<label for="price">Price (PER KG):</label>
			<input type="number" id="price" name="price" step="0.01" placeholder="Enter Price" pattern="[0-9]+" required>
			
			<label for="stockQuantity">Stock Quantity:</label>
			<input type="number" id="stockQuantity" name="stockQuantity" placeholder="Enter Stock Quantity" pattern="[0-9]+" required>
			
			<label for="categoryId">Category:</label>
			<select id="categoryId" name="categoryId" required>
				<option value="">Select Category</option>
				<option value="1">Vegetables</option>
				<option value="5">Fruits</option>
				<option value="6">Flowers</option>
				<option value="7">Nuts</option>
			</select>
			
			<button type="submit">Submit</button>
		</form>
	</div>
</body>
</html>

