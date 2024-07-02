<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            height: 100vh; /* Full viewport height */
            overflow:hidden;
        }
        
        fieldset {
            width: 50%;
            border: 1px solid #ccc;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
        }
        
        form {
            text-align: center;
        }
        
        label {
            font-weight: bold;
        }
        
        input[type="text"], input[type="file"] {
            width: calc(100% - 22px); /* Adjust width to fit within the fieldset */
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
            display: inline-block;
        }
        
        /* Style the file input button */
        input[type="file"] {
            border: none; /* Remove default border */
            background-color: #007bff; /* Blue background */
            color: #fff; /* White text color */
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        input[type="file"]:hover {
            background-color: #0056b3; /* Darker blue on hover */
        }
        
        .sub {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        
        .sub:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <fieldset>
      <form action="/category" method="get">
            <label for="category">CATEGORY:</label><br>
            <input type="text" id="category" name="category" placeholder="Enter Category" required autofocus><br><br>
            
            <label for="photo">Upload Photo:</label>
            <input type="file" name="fileToUpload" id="fileToUpload" >
            
            <br><br>
            <input type="submit" value="ADD" class="sub">
        </form>
    </fieldset>
</body>
</html>

