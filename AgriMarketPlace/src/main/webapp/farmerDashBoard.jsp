<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Farmer Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        .dashboard {
            display: flex;
            justify-content: stretch; 
        }

        .sidebar {
            width: 250px;
            background: linear-gradient(to bottom, #4CAF50, #388E3C);
            padding: 20px;
            color: white;
            height: 100vh;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            color: white;
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .sidebar ul li a:hover {
            color: #f0f0f0;
        }

        .main-content {
            flex: 1;
            padding: 20px;
            display: flex;
            justify-content: center; 
            align-items: center; 
        }

        .main-content .image-container {
            text-align: center;
            max-width: 100%; 
            height: auto; 
        }

        .main-content .image-container img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="sidebar">
            <h2>Dashboard</h2>
            <ul>
                <li><a href="/displayUser"><i class="fas fa-user"></i> Profile</a></li>
                <li><a href="/displayCategory"><i class="fas fa-list"></i> View Categories</a></li>
                <li><a href="addProduct.jsp"><i class="fas fa-plus"></i> Add Products</a></li>
                <li><a href="/displayProduct"><i class="fas fa-eye"></i> View Products</a></li>
                <li><a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
        </div>
        <div class="main-content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="image-container">
                            <img src="pictures/q1.jpg" alt="Your Image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

