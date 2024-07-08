<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agrimarketplace Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
      
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            overflow-x: hidden; 
        }

        .dashboard-container {
            display: grid;
            grid-template-columns: 250px auto;
            grid-template-rows: 100vh; 
            grid-template-areas: "sidebar main-content";
        }

        .sidebar {
            grid-area: sidebar;
            background:black;
            color: #fff;
            padding: 20px;
            height: 100vh; 
            overflow-y: auto; 
            display: flex;
            flex-direction: column; 
            align-items: center; 
        }

        .sidebar .logo {
            margin-bottom: 20px;
        }

        .sidebar .logo img {
            width: 100px; 
            height: auto;
            border-radius: 50%; 
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
            padding: 10px;
            transition: background-color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: rgba(255, 255, 255, 0.2);
          
        }

        .sidebar ul li a .fa {
            margin-right: 10px;
        }

        .contact-details {
            margin-top: auto; 
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.2); 
            border-top: 1px solid rgba(255, 255, 255, 0.1); 
            width: 100%; 
            text-align: center; 
        }

        .contact-details h3 {
            font-size: 18px;
            margin-bottom: 10px;
            color: white;
        }

        .contact-details p {
            font-size: 14px;
            color: white;
            margin-bottom: 5px;
        }

        .main-content {
            grid-area: main-content;
            padding: 20px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                grid-template-columns: auto;
                grid-template-areas: 
                    "main-content"
                    "sidebar";
            }

            .sidebar {
                height: auto;
                max-height: 60vh;
                overflow-y: auto;
                overflow-x: hidden;
            }
        }
        .main-content {
            grid-area: main-content;
            padding: 20px;
            background-image: url('pictures/f3.jpg');
            background-size: cover;
            background-position: center; 
            color: #333; 
        }      
    </style>
</head>
<body>
    <div class="dashboard-container">
        <div class="sidebar">
            <div class="logo">
                <img src="pictures/Screenshot (188).png" alt="Agrimarketplace Logo">
            </div>
            <h2>Agrimarketplace</h2>
            <ul>
                <li><a href="/displayUser"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="addCategory.jsp"><i class="fas fa-th"></i> Add Categories</a></li>
               <!--  <li><a href="addProduct.jsp"><i class="fas fa-plus"></i> Add Product</a></li> -->
                <li><a href="/displayCategory"><i class="fas fa-box"></i> View Categories</a></li>
                <li><a href="/displayProduct"><i class="fas fa-box"></i>View Products</a></li>
             </ul>
            <div class="contact-details">
                <h3>Contact Details</h3>
                <p>Email: milan01@admin.com</p>
                <p>Phone: 9987656743</p>
            </div>
        </div>
       <div class="main-content">
      </div>
    </div> 
</body>
</html>




