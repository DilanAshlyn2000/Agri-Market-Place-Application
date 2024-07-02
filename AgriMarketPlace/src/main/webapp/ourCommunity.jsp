<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f5f5f5;
	overflow: hidden;
}
.container {
    border: 2px solid #ccc;
    background: rgba(231, 224, 219, 0.5);
    border-radius: 5px;
    width: 88%;
    padding: 10px;
    margin: 6px 59px;
    text-align: center;
    color: grey;
}


.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align:center;
  }
}
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
   .text4{
    font-family:  cursive;
    text-align: center;
    font-family: bold;
    font-size:30px;
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
     .header1{
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
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
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
<body>

 </nav>
  </header>
  <header class="header1">
    <nav>
      <a href="#" class="logo">  <img src="Screenshot (188).png" alt="Logo" class="logo"></a>
      <ul class="nav-links">
        <li><a href="Home1.html">Home</a></li>
        <li><a href="MarketCategory.html">Market</a></li>
        <li class="dropdown">
          <a href="#">About Us</a>
          <div class="dropdown-content">
            <a href="#">Our Team</a>
            <a href="OurCompany.html">Our Company</a>    
          </div>
        </li>
            <li> <div class="dropdown1">
  <a href="DisplayUserServlet" class="logo1">  <i class="fa fa-bars" style="font-size:32px;">
    </i></a>

      </ul>
    </nav>
  </header>
<div class="container">
 
  <div class="text4">
    <h2><font color="#6f6e6c">OUR</font>
                <font color="#74ab4f">VISION</font>
              </h2>
                </div>
  <p>To create a sustainable and efficient farm-to-market ecosystem that benefits both farmers and consumers</p></div>

<div class="container">
  <div class="text4">
    <h2><font color="#6f6e6c">OUR</font>
                <font color="#74ab4f">MISSION</font>
              </h2>
                </div>
 
  <p>Our mission is to connect local farmers with markets efficiently, ensuring fair prices for producers and quality products for consumers.</p></div>

<div class="container">
  <div class="text4">
    <h2><font color="#6f6e6c">OUR</font>
                <font color="#74ab4f"> FOCUS</font>
                <font color="#6f6e6c">&</font>
                <font color="#74ab4f"> EXPERIENCE</font></h2>
                </div>
  
  <p>Our focus is on streamlining supply chain logistics, implementing technology-driven solutions for better market access, and providing advisory services to farmers. With over a decade of experience in agricultural innovation and market development, we have successfully facilitated the distribution of fresh produce from farms to markets across the region.</p>

</div>


</body>
</html>