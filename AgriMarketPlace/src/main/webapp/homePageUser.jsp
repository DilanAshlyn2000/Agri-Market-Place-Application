 <!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Image Transition Example</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<style>
main {
	padding-top: 3rem;
	padding-bottom: 2rem;
}
.widget-wrapper {
	padding-bottom: 2rem;
	border-bottom: 1px solid #e0e0e0;
	margin-bottom: 2rem;
}
.extra-margins {
	margin-top: 1rem;
	margin-bottom: 2.5rem;
}
.divider-new {
	margin-top: 0;
}

.navbar {
	background-color: #414a5c;
}

footer.page-footer {
	background-color: #414a5c;
	margin-top: 2rem;
}
.alert{
background-color:orange;
colour:white;
}
</style>
</head>
<body>
	<header>

		<!--Navbar-->
		<nav class="navbar navbar-expand-md navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="#"> <strong>AgriMarketPlace</strong>
				</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav1"aria-controls="navbarNav1" aria-expanded="false"aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav1">
					<ul class="navbar-nav me-auto">
						<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="marketView.jsp">Market</a>
						<li class="nav-item"><a class="nav-link" href="/orderHistory">Order History</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> More info </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown-item" href="ourPeople.jsp">Our Team</a></li>
								<li><a class="dropdown-item" href="ourCommunity.jsp">Our Company</a></li>

							</ul></li>
					</ul>
					<form class="d-flex">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		</nav>		
	</header>
	<main>
		<div class="container">
			<div class="row">
				<div class="col-lg-4">

					<div class="widget-wrapper">
						<h4>Categories:</h4>
						<br>
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action active" aria-current="true">Categories</a> 
							<a href="#"class="list-group-item list-group-item-action"  onclick="selectCategory(2)">Vegetables</a>
							 <a href="#" class="list-group-item list-group-item-action"   onclick="selectCategory(1)">Fruits</a>
							<a href="#" class="list-group-item list-group-item-action"   onclick="selectCategory(4)">Grains & Cereals</a>
							<a href="#" class="list-group-item list-group-item-action"   onclick="selectCategory(3)">Nuts</a>
						</div>
					</div>
					<div class="widget-wrapper">
						<h4>Login form:</h4>
						<br>
						<div class="card">
							<div class="card-body">
								<h5 class="card-title" style="text-align: center;">Login
									Form</h5>
								<form action="/login" method="post">
									<div class="mb-3">
										<label for="form1" class="form-label">Email</label> <input
											type="email" class="form-control" id="email" name="email"
											placeholder="Enter Email" required>
									</div>
									 <div class="mb-3">
										<label for="form2" class="form-label">Your password</label> <input
											type="password" class="form-control" name="password"
											id="form2" placeholder="Enter Password">
									</div>
									<%
									String error=request.getParameter("error");
									if(error!=null){
									%>
										<h6 class="alert"><%= error %></h6>
									<% 	
									}			
									%>
									
									<button type="submit" class="btn btn-primary">
										<center>Submit</center>
									</button>
									<p class="card-text" style="text-align: center;">
										Don't have an account?<a href="registrationPage.jsp">Register</a>
									</p>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="row">
						<div class="col-lg-12">
							<div class="divider-new">
								<h2 class="h2-responsive">What's new?</h2>
							</div>
							<div id="carousel-example-1z"
								class="carousel slide carousel-fade" data-bs-ride="carousel">
								<ol class="carousel-indicators">
									<li data-bs-target="#carousel-example-1z" data-bs-slide-to="0"
										class="active"></li>
									<li data-bs-target="#carousel-example-1z" data-bs-slide-to="1"></li>
									<li data-bs-target="#carousel-example-1z" data-bs-slide-to="2"></li>
								</ol>
									<div class="carousel-inner" role="listbox">								
									<div class="carousel-item active">
										<img src="pictures/ff1.jpg" class="d-block w-100"
											alt="First slide" height="378px">
										<div class="carousel-caption d-none d-md-block">
											<h5>Quality Assurance</h5>
										</div>
									</div>
									<div class="carousel-item">
										<img src="pictures/fg.jpg" class="d-block w-100"
											alt="Second slide" height="378px">
										<div class="carousel-caption d-none d-md-block">
											<h5>Quantity Assurance</h5>
										</div>
									</div>
									<div class="carousel-item">
										<img src="pictures/d11.jpg" class="d-block w-100"
											alt="Third slide" height="378px">
										<div class="carousel-caption d-none d-md-block">
											<h5>Customer Support</h5>
										</div>
									</div>
								</div>
								<a class="carousel-control-prev" href="#carousel-example-1z"
									role="button" data-bs-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"></span> <span
									class="visually-hidden">Previous</span>
								</a> <a class="carousel-control-next" href="#carousel-example-1z"
									role="button" data-bs-slide="next"> <span
									class="carousel-control-next-icon" aria-hidden="true"></span> <span
									class="visually-hidden">Next</span>
								</a>				
							</div>
						</div>
					</div>
				
					<br>
					<hr class="extra-margins">
					<div class="row">
						<div class="col-lg-4">
							<div class="card wow fadeIn" data-wow-delay="0.2s">
								<img src="pictures/e9.webp" class="card-img-top" alt="..."
									height="200px">
								<div class="card-body">
									<h5 class="card-title">Vegetables</h5>
									<p class="card-text">Veggies that pack a punch!</p>
									<a href="#" class="btn btn-primary">Starting from Rs.30</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="card wow fadeIn" data-wow-delay="0.4s">
								<img src="pictures/e11.jpg" class="card-img-top" alt="..."
									height="200px">
								<div class="card-body">
									<h5 class="card-title">Fruits</h5>
									<p class="card-text">Flavors for every season!</p>
									<a href="#" class="btn btn-primary">Starting from Rs.50</a>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="card wow fadeIn" data-wow-delay="0.6s">
								<img src="pictures/hh.jpg" class="card-img-top" alt="..."
									height="200px">
								<div class="card-body">
									<h5 class="card-title">Flowers</h5>
									<p class="card-text">Flowers for every occasion!</p>
									<a href="#" class="btn btn-primary">Starting from Rs.30</a>
								</div>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>	
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/wow/1.1.2/wow.min.js"></script>
	<script>
		new WOW().init();
	</script>
	<script>
    function selectCategory(categoryId) {
    window.location.href = '/searchCategory?type=' + categoryId;
    }
</script>
</body>
</html> 
