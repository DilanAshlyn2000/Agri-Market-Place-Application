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
<style>
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
	border-radius: 8px;
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
						<!-- <form action="" method="get"> -->
							<div class="quantity-container">
								<label for="quantity" class="quantity-label">Quantity:</label> 
								  <input type="number" id="quantity" name="quantity" value="1" min="1" class="quantity-input">
								  <input type="hidden" value="<%=product.getProductName()%>" name="productName">
								  <input type="hidden" value="<%=product.getProductId()%>" name="productId">
								  <input type="hidden" value="<%=product.getFarmerId()%>" name="farmerId">
								  <input type="hidden" value="<%=product.getPrice()%>" name="price">
								  <input type="hidden" value="<%=id%>" name="category_id">	
								 <input type="hidden" value="add" name="action">
								<button class="#">Add to Cart</button>
							</div>
					 </form>
				   </div>
				<!-- </form> -->
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
				</select> <input type="submit" value="SORT LOW TO HIGH" class="button2">
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
				</select> <input type="submit" value="SORT HIGH TO LOW" class="button2">
				</form>
			</div>	
			</div>
        </body>
</html>  