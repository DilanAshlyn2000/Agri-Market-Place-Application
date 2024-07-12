 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.agrimarketplace.model.Product"%>
<%@ page import="java.util.*"%>
<% 
session=request.getSession(false); 
int id=(int)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>
  <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        /* Add your custom styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            overflow: auto; /* Allow scrolling */
        }
      
.navbar {
    max-height: 62px;
    background-color: #414a5c;
}
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	overflow: hidden;
}

html {
	overflow-y: auto;
}

.container {
	max-width: 1200px;
	margin: 20px auto;
	padding: 0 20px;
}
.card-container {
    position: relative;
    left: 40px;
}
.card {
	width: calc(25% - 20px);
	margin: 10px;
	background-color: #fff;
	border-radius: 0px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	display: inline-block;
	width: 276px;
}

.card img {
	width: 100%;
	height: 200px; 
	object-fit: cover;
	border-bottom: 1px solid #ddd;
}

.card-content {
	padding: 15px;
}

.card-content h2 {
	margin: 0 0 10px;
	font-size: 20px;
	text-align: center;
}

.card-content p {
	margin: 0 0 10px;
	font-size: 14px;
	text-align: left; 
}

.add-to-cart {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 10px; 
	top: -5px;
	position: relative;
}

.add-to-cart:hover {
	background-color: #45a049;
}

.quantity-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
}

.quantity-label {
	margin-right: 10px;
}

.quantity-input {
	width: 50px;
	padding: 5px;
	text-align: center;
}

input[type="image"] {
	position: absolute;
	top: 78px;
	height: 58px;
	right: 35px;
}
.text4 {
	font-family: cursive;
	text-align: left;
	font-family: bold;
	font-size: 30px;
	position:relative;
	left:40px;
}

select {
    font-size: 16px;
    padding: 8px;
    margin-bottom: 10px;
    width: 15%;
    box-sizing: border-box;
}
.button1{
  background-color: white; 
    border: line;
    border-color:#4CAF50;
    color: black;
}
.button2 {
    background-color: #4CAF50; 
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 5px;
    width: 19%;
    box-sizing: border-box; 
}

.button2:hover {
    background-color: #45a049; 
}
.container1 {
    position: relative;
    top: -900px;
    left: 765px;
    }
 

</style>
</head>
<body>

 <!--  <header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="pictures/Screenshot (188).png"
				alt="Logo" class="logo"></a>
			<ul class="nav-links">
				<li><a href="homePageUser.jsp">Home</a></li>

				<li><a href="marketView.jsp">Market</a></li>
				
				<li class="dropdown"><a href="#">About Us</a>
					<div class="dropdown-content">
						<a href="OurPeople.html">Our Team</a> <a href="OurCompany.html">Our
							Company</a>
							
					</div></li>


			</ul>
		</nav>
	</header> -->
	  <header>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">AgriMarketPlace</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav1"
                        aria-controls="navbarNav1" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav1">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link" href="homePageUser.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="marketView.jsp">Market</a></li>
                        <li class="nav-item"><a class="nav-link"  onclick="toggleOrderHistory()">Order History</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                               data-bs-toggle="dropdown" aria-expanded="false">More info</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <li><a class="dropdown-item" href="ourPeople.jsp">Our Team</a></li>
                                <li><a class="dropdown-item" href="ourCommunity.jsp">Our Company</a></li>
                            </ul>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </header>
	

<!-- done -->

	<div class="text4">
		<h2>
			<font color="#6f6e6c">PRODUCT</font> <font color="#74ab4f">DETAILS</font> 
		</h2>
	</div>
		
		<form action="/displayCart" method="get">
		  <input type="hidden" name="customer_id" value="<%= id%>">
			<input type="image" src="pictures/q7.jpg" alt="Submit">
		</form>
		<div class="card-container">
			<%
			List<Product> productList = (List<Product>) request.getAttribute("productList");
			for (Product product : productList) {
			%>
			<div class="card">
				<form action="/insertCart?product=<%= product%>">
					<img
						src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(product.getProductImage())%>"
						alt="Product Image">
					<div class="card-content">
						<h2><%=product.getProductName()%></h2>

						<%-- <p>
						<strong>Product ID           :</strong>
						<%=product.getProductId()%></p>
							
					<p>
						<strong>Farmer ID            :</strong>
						<%=product.getFarmerId()%></p>
					<p> --%>
`
						<p>
							<strong>Description :</strong>
							<%=product.getDescription()%></p>
						<p>
							<strong>Price :</strong>
							<%=product.getPrice()%></p>
						<p>
							<strong>Stock Quantity(in Kgs):</strong>
							<%=product.getStockQuantity()%></p>
							<div class="quantity-container">
								<label for="quantity" class="quantity-label">Quantity:</label> 
								  <input type="number" id="quantity" name="quantity" value="1" min="1" class="quantity-input">
								  <input type="hidden" value="<%=product.getProductName()%>" name="productName">
								  <input type="hidden" value="<%=product.getProductId()%>" name="productId">
								  <input type="hidden" value="<%=product.getFarmerId()%>" name="farmerId">
								  <input type="hidden" value="<%=product.getPrice()%>" name="price">
								  <input type="hidden" value="<%=id%>" name="category_id">	
								 <input type="hidden" value="add" name="action">
								<button class="button1">Add to Cart</button>
							</div>
					 </form>
				   </div>
			</div>
			<%
            }
			%>
			<div class="container">
			<div class="low">
			<form action="/displayProductsLowToHigh" method="get">
				<% for (Product product : productList) { %>
				<input type="hidden" value="<%= product.getPrice() %>" name="price1">
				<% } %>
			<!-- 	<select id="type" name="type" required autofocus>
					<option value="2">VEGETABLES</option>
					<option value="1">FRUITS</option>
					<option value="4">GRAINS & CEREALS</option>
					<option value="3">NUTS</option> -->
			       <input type="submit" value="SORT LOW TO HIGH" class="button2">
			</form>
			<form action="/displayProductsHighToLow" method="get">
				<% for (Product product : productList) { %>
				<input type="hidden" value="<%= product.getPrice() %>" name="price1">
				<% } %>
				<!-- <select id="type" name="type" required autofocus>
					<option value="2">VEGETABLES</option>
					<option value="1">FRUITS</option>
					<option value="4">GRAINS & CEREALS</option>
					<option value="3">NUTS</option> -->
				 <input type="submit" value="SORT HIGH TO LOW" class="button2">
				</form>
			</div>	
			</div>
			
        </body>
</html>  
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.chainsys.agrimarketplace.model.Product"%>
<%@ page import="java.util.*"%>
<%
    session=request.getSession(false); 
    int id=(int)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
      overflow-x: hidden;
}

.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 0 20px;
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

.card {
    position: relative;
    width: calc(25% - 20px);
    margin: 10px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease;
}

.card:hover {
    transform: translateY(-10px);
}

.card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-bottom: 1px solid #ddd;
    cursor: pointer;
    transition: transform 0.3s ease;
}

.card:hover img {
    transform: scale(1.1);
}
input[type="image"] {
	position: absolute;
	top: 78px;
	height: 58px;
	right: 35px;
}
.card-content {
    padding: 15px;
}

.card-content h2 {
    margin: 0;
    font-size: 20px;
    text-align: center;
}

.card-content p {
    margin: 10px 0;
    font-size: 14px;
    text-align: left;
}

.add-to-cart {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
    display: block;
    margin: 10px auto 0;
    transition: background-color 0.3s ease;
}

.add-to-cart:hover {
    background-color: #45a049;
}

.quantity-container {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-top: 10px;
}

.quantity-label {
    margin-right: 10px;
}

.quantity-input {
    width: 50px;
    padding: 5px;
    text-align: center;
}

.text4 {
	font-family: cursive;
	text-align: left;
	font-family: bold;
	font-size: 30px;
	position:relative;
	left:40px;
}

.popup {
    display: none;
    position: fixed;
    z-index: 999;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.8);
    text-align: center;
    overflow: auto;
}

.popup-content {
    display: inline-block;
    margin: 20px auto;
    position: relative;
    background-color: #fefefe;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.popup img {
    max-width: 100%;
    height: auto;
    border-radius: 8px;
}

.close {
    position: absolute;
    top: 10px;
    right: 20px;
    color: #aaa;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s ease;
}

.close:hover,
.close:focus {
    color: #fff;
}

.button2 {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin-top: 10px;
    cursor: pointer;
    border-radius: 5px;
    width: 150px; /* Adjust width here */
    box-sizing: border-box;
}

.button2:hover {
    background-color: #45a049;
}


</style>
</head>
<body>

<div class="text4">
		<h2>
			<font color="#6f6e6c">PRODUCT</font> <font color="#74ab4f">DETAILS</font> 
		</h2>
	</div>
<form action="/displayCart" method="get">
		  <input type="hidden" name="customer_id" value="<%= id%>">
			<input type="image" src="pictures/q7.jpg" alt="Submit">
		</form>
<div class="container">
    <div class="card-container">
        <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        for (Product product : productList) {
        %>
        <div class="card">
            <!-- Product details -->
            <div class="card-content">
                <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(product.getProductImage()) %>" alt="Product Image" class="product-image">
                <h2><%= product.getProductName() %></h2>
                <p><strong>Description :</strong> <%= product.getDescription() %></p>
                <p><strong>Price :</strong> <%= product.getPrice() %></p>
                <p><strong>Stock Quantity (in Kgs):</strong> <%= product.getStockQuantity() %></p>
                <div class="quantity-container">
                    <label for="quantity" class="quantity-label">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" class="quantity-input">
                    <input type="hidden" value="<%= product.getProductName() %>" name="productName">
                    <input type="hidden" value="<%= product.getProductId() %>" name="productId">
                    <input type="hidden" value="<%= product.getFarmerId() %>" name="farmerId">
                    <input type="hidden" value="<%= product.getPrice() %>" name="price">
                    <input type="hidden" value="<%= id %>" name="category_id">
                    <input type="hidden" value="add" name="action">
                    <button class="add-to-cart">Add to Cart</button>
                </div>
            </div>
            <!-- End Product details -->

            <!-- Hidden pop-up container -->
            <div class="popup">
                <div class="popup-content">
                    <span class="close">&times;</span>
                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(product.getProductImage()) %>" alt="Product Image">
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
</div>

<div class="container">
    <div class="low">
        <form action="/displayProductsLowToHigh" method="get">
            <% for (Product product : productList) { %>
            <input type="hidden" value="<%= product.getPrice() %>" name="price1">
            <% } %>
            <input type="submit" value="SORT LOW TO HIGH" class="button2">
        </form>
        <form action="/displayProductsHighToLow" method="get">
            <% for (Product product : productList) { %>
            <input type="hidden" value="<%= product.getPrice() %>" name="price1">
            <% } %>
            <input type="submit" value="SORT HIGH TO LOW" class="button2">
        </form>
    </div>  
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var cards = document.querySelectorAll('.card');
    
    cards.forEach(function(card) {
        var image = card.querySelector('.product-image');
        var popup = card.querySelector('.popup');
        var closeBtn = card.querySelector('.close');
        
        image.addEventListener('click', function() {
            popup.style.display = 'block';
        });
        
        closeBtn.addEventListener('click', function() {
            popup.style.display = 'none';
        });
    });
});
</script>

</body>
</html>
 --%>