<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.agrimarketplace.model.Cart" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }
        .order-container {
            width: 26%;
            margin-top: 99px;
            border: 1px solid #dddddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .order-header {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .product {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
        }
        .product-image {
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
        .product-details {
            flex: 1;
        }
        .total-bill {
            margin-top: 20px;
            text-align: center;
    font-weight: bold;
    color:#74ab4f;
        }
        .payment-options {
            margin-top: 20px;
        }
        .payment-option {
            margin-right: 20px;
        }
        .confirm-order-button {
            padding: 10px 20px;
            background-color: black;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .confirm-order-button:hover {
            background-color: grey;
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
	position: relative;
    
}

.content {
	padding: 20px;
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
	position:relative;
	left:-179px;
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
.link {
    position: relative;
    left: 293px;
    }
    .text4{
    font-family:  cursive;
    text-align: center;
    font-family: bold;
    font-size:20px;
    }
    </style>
</head>
<body>
<header class="header1">
		<nav>
			<a href="#" class="logo"> <img src="pictures/Screenshot (188).png"
				alt="Logo" class="logo"></a>
			<div class="link">
			<ul class="nav-links">
			
				<li><a href="homePageUser.jsp">Home</a></li>

				<li><a href="marketView.jsp">Market</a></li>
				<li class="dropdown"><a href="#">About Us</a>
					<div class="dropdown-content">
						<a href="OurPeople.html">Our Team</a> <a href="OurCompany.html">Our
							Company</a>
					</div></li>
					</div>
                   

			</ul>
		</nav>
	</header>

    <div class="order-container">
     <div class="text4">
        <h2><font color="#6f6e6c">CONFIRM</font> <font color="#74ab4f">ORDER</font></h2>
    </div>
       <!--  <div class="order-header">Confirm Order</div> -->
        <div class="order-details">
            <% 
            float sum = 0;
            List<Cart> list = (List<Cart>) request.getAttribute("productList");
            if (list != null) {
                for (Cart lists : list) {
            %>
            <div class="product">
                <img class="product-image" src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(lists.getProduct().getProductImage()) %>" alt="Product Image">
                <div class="product-details">
                    <div><strong>Product Name:</strong> <%= lists.getProduct().getProductName() %></div>
                    <div><strong>Price:</strong> <%= lists.getProduct().getPrice() %></div>
                    <div><strong>Quantity:</strong> <%= lists.getQuantity() %></div>
                    <div><strong>Total:</strong> <%= lists.getTotal() %></div>
                </div>
            </div>
            <% 
                sum += lists.getTotal();
                }
            } else {
            %>
            <div>No items in the cart</div>
            <% } %>
        </div>
        <div class="total-bill">Total Bill: <%= sum %></div>
        <div class="payment-options">
            <span class="payment-option">
                <input type="radio" id="cod" name="payment_method" value="cod" checked>
                <label for="cod">Cash on Delivery</label>
            </span>
            <span class="payment-option">
                <input type="radio" id="debit_card" name="payment_method" value="debit_card">
                <label for="debit_card">Debit Card Payment</label>
            </span>
        </div>
        <form id="paymentForm" method="post">
            <input type="hidden" name="total_bill" value="<%= sum %>">
            <input type="hidden" name="payment_method" id="payment_method" value="cod"> <!-- Default to COD -->
            <center><button type="button" class="confirm-order-button" onclick="submitForm()">Confirm Order</button></center>
        </form>
    </div>
    <script>
        function submitForm() {
            var paymentMethod = document.querySelector('input[name="payment_method"]:checked').value;
            var form = document.getElementById('paymentForm');
            if (paymentMethod === 'cod') {
                form.action = 'COD.html';
            } else if (paymentMethod === 'debit_card') {
                form.action = 'debitCardPayment.jsp';
            }
            form.submit();
        }
    </script>
</body>
</html>