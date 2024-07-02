<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	overflow: hidden;
	position: relative;
}

.video-background {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
	overflow: hidden;
}

video {
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: -1;
}

.form-container {
	max-width: 330px;
	margin: 0 auto;
	padding: 20px;
	background-color: white;
	border-radius: 0px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	position: absolute;
	color: black;
	left: 41%;
	top: 107px;
	line-height: 0.5;
	/* background-image: url('q4.jpg');
	background-size: cover;
	background-position: center; */
}

/* Style for the form heading */
.form-container h2 {
	margin-bottom: 20px;
	text-align: center;
	color: black;
}

/* Style for labels */
.form-container label {
	display: block;
	margin-bottom: 6px;
	color: black;
	font-weight: bold;
}

/* Style for input fields */
.form-container input[type="text"], .form-container input[type="tel"],
	.form-container input[type="email"], .form-container input[type="password"],
	.form-container select, .form-container textarea {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	/* Ensure padding and border are included in the width */
}

/* Style for submit button */
.form-container input[type="submit"] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	background-color: #4CAF50;;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
}

/* Style for submit button on hover */
.form-container input[type="submit"]:hover {
	background-color: black;
}

img.img2 {
	height: 582px;
	top: 93px;
	position: absolute;
	left: 682px;
	width: 400px;
	opacity: 0.5;
}

.pic1 {
	position: relative;
	color: white;
	background-color: #4CAF50;
	top: 21pc;
	left: 47pc;
	width: 250px;
	font-size: large;
	text-align: center;
}

.text5 {
	font-family: cursive;
	text-align: left;
	font-family: bold;
	font-size: 18px;
}

.text6 {
	font-family: cursive;
	text-align: left;
	font-family: bold;
	font-size: 18px;
	color: #74ab4f;
}
</style>
</head>
<body>


	<div class="form-container">
		<div class="text5">
			<h2>
				<font color="#6f6e6c">REGISTRATION</font> <font color="#74ab4f">FORM</font>
			</h2>
		</div>
		<form action="/register" method="get">
			<div class="text6">
				<label for="name">Name:</label> 
				<input type="text" id="name" name="name" placeholder="Enter Name" required> 
				<label for="type">Type:</label>
				 <select name="type" id="type"="[0-9]+">

					<option value="user">BUYER</option>
					<option value="farmer">AGRICULTURAL PRODUCERS</option>
					<option value="admin">OTHERS</option>

				</select> <br> <br>
				 <label for="phone">Phone Number:</label> 
				 <input type="tel" id="phone" name="phone" placeholder="Enter Phone Number" pattern="[796][0-9]{9}" required>
				  <label for="email">Email:</label>
				<input type="email" id="email" name="email" placeholder="Enter Email" required>
				 <label for="address">Address:</label>
				<textarea id="address" name="address" rows="2" placeholder="Enter Address" required></textarea>
				<label for="password">Password:</label> 
				<input type="password" id="password" name="password" placeholder="Enter Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
				 <input type="submit" value="Register"  onclick="validation()">
			</div>
		</form>

	</div>
	<div class="video-background">
		<video autoplay loop muted>
			<source src=6701387-hd_1920_1080_30fps.mp4 type="video/mp4">
			<!-- Include additional source tags for other video formats if needed -->
			Your browser does not support the video tag.
		</video>
	</div>
	<script type="text/javascript">
function validation(){
	var name=document.getElementById("name");
var grade=document.getElementById("phone");
var grade=document.getElementById("password");

if(!name.checkValidity())
{
    alert("Name should be alphabet.");
    return;
}
if(!phone.checkValidity())
{
    alert("Phone number should be 10 digits starting with 9,7 or 6");
    return;
}
if(!password.checkValidity())
{
    alert("Password should consist of atleast 1 Uppercase, 1 Lowercase, 1 Speacial character, 1 digit and minimun 8 characters");
    return;
}
}
</script>
</body>
</html>
