<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chainsys.agrimarketplace.model.Category"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Category Details</title>
<style>
body {
    background-image: url("1111.jpg");
    background-size: cover;
    color: #fff;
    font-family: Arial, sans-serif;
    padding: 50px 20px;
    margin: 0;
}

.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    max-width: 1000px; 
    margin: 0 auto;
}

h1 {
    color: #4CAF50;
    text-shadow: 2px 2px 4px violet;
    text-decoration: underline;
    text-align: center;
    margin-top: 0;
    padding-top: 20px;
    width: 100%;
    box-sizing: border-box;
}

.card {
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    color: black;
    margin: 20px;
    border-radius: 8px;
    overflow: hidden;
    max-width: 300px;
    width: calc(50% - 40px); 
    flex: 1 0 auto;
    box-sizing: border-box;
}

.card-header {
    background-color: #4CAF50;
    color: white;
    padding: 10px;
    text-align: center;
}

.card-body {
    padding: 0px;
    text-align: center;
}

.card-body img {
    max-width: 100%;
    height: 200px;
    width:600px;
    display: block;
    margin: 10px auto;
    border-radius: 5px;
    box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
}

.button1 {
    background-color: #4CAF50;
    color: white;
    border: 1px solid #000;
    padding: 10px 20px;
    text-align: center;
    display: inline-block;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.button1:hover {
    background-color: black;
    color: #fff;
}

.button2 {
    background-color: #2F80ED;
    color: #fff;
    border: none;
    padding: 10px 20px;
    text-align: center;
    display: inline-block;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.button2:hover {
    background-color: #1E63B8;
}
.text5 {
	font-family: cursive;
	text-align: center;
	font-family: bold;
	font-size: 18px;
}
</style>
</head>
<body>
  <div class="text5">
		<h2>
			<font color="black">CATEGORY</font> <font color="#74ab4f">DETAILS</font>
		</h2>
		
	</div>
    <div class="container">
  
        <% List<Category> categories = (ArrayList<Category>) request.getAttribute("lists");
           for (Category category : categories) { %>
               <div class="card">
                   <div class="card-header">
                       CATEGORY ID: <%= category.getCategoryId() %>
                   </div>
                   <div class="card-body">
                    <div class="text5">
                       <h3><%= category.getCategoryName() %></h3>
                       </div>
                       <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(category.getCategoryImage()) %>" alt="Category Image" />
                       <form action="/deleteCategory" method="get">
                           <input type="hidden" value="<%= category.getCategoryId() %>" name="categoryId">
                           <input type="submit" value="DELETE" class="button1" name="action">
                       </form>
                   </div>
               </div>
           <% } %>
    </div>
</body>
</html>
