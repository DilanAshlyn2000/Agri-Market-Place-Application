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
</style>

<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function decrementQuantity(cartId, productId, price, quantity) {
        var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        
        // Ensure minimum quantity is 1
        if (currentQuantity > 1) {
            quantityInput.value = currentQuantity - 1;
            currentQuantity = currentQuantity - 1;

            // AJAX call to update cart in backend
            updateCartItem(cartId, productId, price, currentQuantity);
        } else {
            // Optionally handle minimum quantity reached
            console.log("Minimum quantity reached");
            alert("Minimum quantity reached");
        }
    }

    function incrementQuantity(cartId, productId, price, quantity) {
        var quantityInput = document.getElementById('quantity-' + cartId);
        var currentQuantity = parseInt(quantityInput.value);
        
        // Increment quantity
        quantityInput.value = currentQuantity + 1;
        currentQuantity = currentQuantity + 1;

        // AJAX call to update cart in backend
        updateCartItem(cartId, productId, price, currentQuantity);
    }

    function updateCartItem(cartId, productId, price, quantity) {
        // AJAX call to update cart in backend
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
                updateTotalPrice(); // Update total price after successful update
            },
            error: function(xhr, status, error) {
                console.error("Failed to update cart item:", error);
                window.location.reload(); // Reload page on error
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
            row.cells[4].textContent = total.toFixed(2); // Update total column
            totalSum += total;
        });

        // Update total bill in the footer
        document.getElementById('totalBill').textContent = "Total Bill: " + totalSum.toFixed(2);
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
</html>
