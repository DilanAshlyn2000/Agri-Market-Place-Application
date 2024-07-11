<!DOCTYPE html>
<html lang="en">
<% 
session=request.getSession(false); 
int id=(int)session.getAttribute("user");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Form</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.container {
	max-width: 360px;
	margin: 163px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	line-height: 0.3;
}

h2 {
	text-align: center;
}

form {
	margin-top: 20px;
}

label {
	display: block;
	font-weight: bold;
	margin-bottom: 5px;
}

input[type="text"], input[type="date"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

input[type="submit"] {
	background-color: #4caf50;
	color: white;
	border: none;
	border-radius: 5px;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 16px;
}

input[type="submit"]:hover {
	background-color: #45a049;
}

.inlineimage {
	text-align: center;
}

.images {
	max-width: 60px;
	height: auto;
	margin: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Payment Information</h2>
		<div class="inlineimage">
			<img class="images"
				src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Mastercard-Curved.png">
			<img class="images"
				src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Discover-Curved.png">
			<img class="images"
				src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/Paypal-Curved.png">
			<img class="images"
				src="https://cdn0.iconfinder.com/data/icons/credit-card-debit-card-payment-PNG/128/American-Express-Curved.png">
		</div>
		<form action="/updateStatus" method="get">
		 <input type="hidden" name="customer_id" value="<%= id%>">
			<label for="cardholder_name">Cardholder's Name:</label> <input
				type="text" id="cardholder_name" name="cardholder_name"
				placeholder="Enter Cardholder Name " required> <label
				for="card_number">Card Number:</label> <input type="text"
				id="card_number" name="card_number"
				placeholder="1234 5678 9012 3456" pattern="[0-9]{16}" required>

			<label for="expiration_date">Expiration Date:</label> <input
				type="date" id="expiration_date" name="expiration_date" required>

			<label for="cvv">CVV/CVC:</label> <input type="text" id="cvv"
				name="cvv" maxlength="4" placeholder="123" pattern="[0-9]{3}"
				required>

			<center>
				<button type="submit">Submit Payment</button>
			</center>
		</form>
	</div>
</body>
</html>