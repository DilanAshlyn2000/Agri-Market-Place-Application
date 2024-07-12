<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.agrimarketplace.model.Product"%>
<%@ page import="com.chainsys.agrimarketplace.model.Cart"%>
<%@ page import="java.util.*"%>
<% 
session=request.getSession(false); 
int id=(int)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cart Details</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
}
table {
    width: 72%;
    border-collapse: collapse;
    position: relative;
    left: 202px;
}
th, td {
	border: 1px solid #dddddd;
	text-align: center;
	padding: 8px;
}

th {
    background-color: #74ab4f;
    color: white;
}

.buy-now-button {
	padding: 10px 20px;
	background-color: #74ab4f;
	color: white;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.buy-now-button:hover {
	background-color: grey;
}

.quantity-input {
	width: 50px;
	text-align: center;
}

.quantity-controls button {
	margin: 0 5px;
	padding: 5px 10px;
	font-size: 14px;
	cursor: pointer;
}

.content {
	padding: 20px;
}

.content1 {
	color: white;
	position: absolute;
	top: 180px;
	left: 28px;
	width: 603px;
	font-size: large;
	background-color: rgba(0, 21, 14, 0.2);
	line-height: 1.3;
}
.text4{
    font-family:  cursive;
    text-align: center;
    font-family: bold;
    font-size:30px;
    }
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function decrementQuantity(cartId, productId, price, quantity) {
    	var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        console.log(currentQuantity);
        quantityInput.value = currentQuantity - 1;
        currentQuantity = (currentQuantity-1)-quantity;

        // AJAX call to update cart in backend
        console.log("Starting AJAX request...");
        console.log("URL:", "/insertCart");
        console.log("Data:", {
        	category_id: cartId,
            productId: productId,
            price: price,
            quantity: currentQuantity,
        });

        $.ajax({
            url: "/insertCart",
            type: "GET",
            data: {
            	category_id: cartId,
                productId: productId,
                price: price,
                quantity: currentQuantity,
                action: "add" // Optional: You can add an action parameter if needed
            },
            success: function(response) {
                console.log("AJAX request successful:", response);
                window.location.reload();
            },
            error: function(xhr, status, error) {
                console.error("AJAX request failed:", error);
                window.location.reload();
            }
        });
    } 

    function incrementQuantity(cartId, productId, price, quantity) {
        var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        console.log(currentQuantity);
        quantityInput.value = currentQuantity + 1;
        currentQuantity = (currentQuantity+1)-quantity;

        // AJAX call to update cart in backend
        console.log("Starting AJAX request...");
        console.log("URL:", "/insertCart");
        console.log("Data:", {
        	category_id: cartId,
            productId: productId,
            price: price,
            quantity: currentQuantity,
        });

        $.ajax({
            url: "/insertCart",
            type: "GET",
            data: {
            	category_id: cartId,
                productId: productId,
                price: price,
                quantity: currentQuantity,
                action: "add" // Optional: You can add an action parameter if needed
            },
            success: function(response) {
                console.log("AJAX request successful:", response);
                window.location.reload();
            },
            error: function(xhr, status, error) {
                console.error("AJAX request failed:", error);
                window.location.reload();
            }
        });
    }
</script>

</head>

<body>
    <div class="text4">
        <h2><font color="#6f6e6c">CART</font><font color="#74ab4f">DETAILS</font></h2>
    </div>

    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
            float sum = 0;
            List<Cart> list = (List<Cart>) request.getAttribute("productList");
            if (list != null) {
                for (Cart cartPojo : list) {
                    int productId = cartPojo.getProduct().getProductId();
                    float price = cartPojo.getProduct().getPrice();
                    int quantity = cartPojo.getQuantity();
                    float total = quantity * price;
                    sum += total; 
            %>
            <tr>
                <td><%=cartPojo.getProduct().getProductName()%></td>
                <td><img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(cartPojo.getProduct().getProductImage())%>"
                        alt="Product Image" style="width: 100px; height: 100px;"></td>
                <td><%=price%></td>
                <td>
                    <div class="quantity-controls">
                        <button type="button" onclick="decrementQuantity(<%=cartPojo.getCartId()%>, '<%=productId%>', <%=price%>, <%=quantity%>)">-</button>
                        <input type="number" id="quantity-<%=cartPojo.getCartId()%>" class="quantity-input" name="quantity" min="1"
                            value="<%=quantity%>" readonly>
                        <button type="button" onclick="incrementQuantity(<%=cartPojo.getCartId()%>, '<%=productId%>', <%=price%>, <%=quantity%>)">+</button>
                    </div>
                </td>
                <td id="total-<%=cartPojo.getCartId()%>" class="total"><%=total%></td>
                <td>
                    <form action="/deleteCart" method="get">
                        <input type="hidden" value="<%=cartPojo.getCartId()%>" name="cartId">
                        <button class="buy-now-button" value="<%=cartPojo.getCartId()%>" name="Id">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6">No items in the cart</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>

    <table border="1">
        <thead>
            <tr>
                <th id="totalBill">Total Bill: <%=sum%></th>
            </tr>
        </thead>
    </table>

    <form action="/confirmPage" method="get">
     <input type="hidden" name="customer_id" value="<%= id%>">
        <center>
            <button type="submit" class="buy-now-button">BUY NOW</button>
        </center>
    </form>
</body>
</html>  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.agrimarketplace.model.Product"%>
<%@ page import="com.chainsys.agrimarketplace.model.Cart"%>
<%@ page import="java.util.*"%>
<% 
session=request.getSession(false); 
int id=(int)session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cart Details</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f5f5f5;
}
table {
    width: 72%;
    border-collapse: collapse;
    position: relative;
    left: 202px;
}
th, td {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 8px;
}

th {
    background-color: #74ab4f;
    color: white;
}

.buy-now-button {
    padding: 10px 20px;
    background-color: #74ab4f;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.buy-now-button:hover {
    background-color: grey;
}

.quantity-input {
    width: 50px;
    text-align: center;
}

.quantity-controls button {
    margin: 0 5px;
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
}

.content {
    padding: 20px;
}

.content1 {
    color: white;
    position: absolute;
    top: 180px;
    left: 28px;
    width: 603px;
    font-size: large;
    background-color: rgba(0, 21, 14, 0.2);
    line-height: 1.3;
}
.text4{
    font-family:  cursive;
    text-align: center;
    font-family: bold;
    font-size:30px;
    }
.container1 {
    position: relative;
    top: -900px;
    left: 765px;
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
 
</style>

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function decrementQuantity(cartId, productId, price, quantity) {
        var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
            currentQuantity = currentQuantity - 1;
            updateCartItem(cartId, productId, price, currentQuantity);
        } else {
            console.log("Minimum quantity reached");
            alert("Minimum quantity reached");
        }
    }

    function incrementQuantity(cartId, productId, price, quantity) {
        var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        quantityInput.value = currentQuantity + 1;
        currentQuantity = currentQuantity + 1;
        updateCartItem(cartId, productId, price, currentQuantity);
    }
    function updateCartItem(cartId, productId, price, quantity) {
        $.ajax({
            url: "/insertCart",
            type: "GET",
            data: {
                category_id: cartId,
                productId: productId,
                price: price,
                quantity: quantity,
                action: "update"
            },
            success: function(response) {
                console.log("Cart item updated successfully:", response);
                updateTotalPrice(); 
            },
            error: function(xhr, status, error) {
                console.error("Failed to update cart item:", error);
                window.location.reload(); 
            }
        });
    }

    function updateTotalPrice() {
        var totalSum = 0;
        var rows = document.querySelectorAll('tbody tr');
        
        rows.forEach(function(row) {
            var price = parseFloat(row.cells[2].textContent);
            var quantity = parseInt(row.cells[3].querySelector('.quantity-input').value);
            var total = price * quantity;
            row.cells[4].textContent = total.toFixed(2); 
            totalSum += total;
        });
        document.getElementById('totalBill').textContent = "Total Bill: " + totalSum.toFixed(2);
    }
</script>
</head>
<body>
<header class="header1">
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
	</header>
    <div class="text4">
        <h2><font color="#6f6e6c">CART</font><font color="#74ab4f">DETAILS</font></h2>
    </div>
    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Product Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% 
            float sum = 0;
            List<Cart> list = (List<Cart>) request.getAttribute("productList");
            if (list != null) {
                for (Cart cartPojo : list) {
                    int productId = cartPojo.getProduct().getProductId();
                    float price = cartPojo.getProduct().getPrice();
                    int quantity = cartPojo.getQuantity();
                    float total = quantity * price;
                    sum += total; 
            %>
            <tr>
                <td><%=cartPojo.getProduct().getProductName()%></td>
                <td><img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(cartPojo.getProduct().getProductImage())%>"
                        alt="Product Image" style="width: 100px; height: 100px;"></td>
                <td><%=price%></td>
                <td>
                    <div class="quantity-controls">
                        <button type="button" onclick="decrementQuantity(<%=cartPojo.getCartId()%>, '<%=productId%>', <%=price%>, <%=quantity%>)">-</button>
                        <input type="number" id="quantity-<%=cartPojo.getCartId()%>" class="quantity-input" name="quantity" min="1"
                            value="<%=quantity%>" readonly>
                        <button type="button" onclick="incrementQuantity(<%=cartPojo.getCartId()%>, '<%=productId%>', <%=price%>, <%=quantity%>)">+</button>
                    </div>
                </td>
                <td id="total-<%=cartPojo.getCartId()%>" class="total"><%=total%></td>
                <td>
                    <form action="/deleteCart" method="get">
                        <input type="hidden" value="<%=cartPojo.getCartId()%>" name="cartId">
                        <button class="buy-now-button" value="<%=cartPojo.getCartId()%>" name="Id">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="6">No items in the cart</td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
    <table border="1">
        <thead>
            <tr>
                <th id="totalBill">Total Bill: <%=sum%></th>
            </tr>
        </thead>
    </table>
    <form action="/confirmPage" method="get">
     <input type="hidden" name="customer_id" value="<%= id%>">
        <center>
            <button type="submit" class="buy-now-button">BUY NOW</button>
        </center>
    </form>
</body>
</html>
