<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
HttpSession existingSession = request.getSession();

try {

	String use = (String) session.getAttribute("u").toString();

} catch (Exception exception) {
	response.sendRedirect("Login.jsp");

}

if (existingSession == null) {

	response.sendRedirect("Login.jsp");
	return;
}

else {
	System.out.println(existingSession);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.maincont .sidepage {
	background-image: url(img/burgundybackground.jpg);
	background-position: center;
	background-size: cover;
	position: relative;
}
</style>
<link rel="stylesheet" href="CSS/Dashboard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous">
</script>

</head>
<body >

	<div class="container-fluid">
		<div class="row maincont">
			<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 sidebar ">
				<div
					class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white  menuhd">
					<a href="#"
						class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
						<span class="fs-5 d-none d-sm-inline"><img alt="img"
							src="img/chef-removebg-preview.png" class="ppmt">Menu</span>
					</a>
					<ul
						class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start"
						id="menu">
						<li class="nav-item list" style="width: 100%";><a
							href="Dashboard.jsp" class="nav-link align-middle px-0"> <i
								class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">Home</span>
						</a></li>
						<li class="list" style="width: 100%";><a href="#submenu2"
							data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
								<i class="fs-4 bi-bootstrap"></i> <span
								class="ms-1 d-none d-sm-inline">Tables</span>
						</a>
							<ul class="collapse nav flex-column ms-1" id="submenu2"
								data-bs-parent="#menu">
								<li class="sublist"><a href="AddTable.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">Add</span>
								</a></li>
								<li class="sublist"><a href="ViewTable.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">View</span>
								</a></li>
							</ul></li>
						
							<li class="list" style="width: 100%";><a href="#submenu1"
							data-bs-toggle="collapse" class="nav-link px-0 align-middle">
								<i class="fs-4 bi-speedometer2"></i> <span
								class="ms-1 d-none d-sm-inline">Customers</span>
						</a>
							<ul class="collapse show nav flex-column ms-1" id="submenu1"
								data-bs-parent="#menu">
								<li class="sublist"><a href="AddCustomer.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline ">Add</span>
								</a></li>
								<li class="sublist"><a href="ViewCustomer.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">View</span>
								</a></li>
							</ul></li>
							
							
						<li class="list" style="width: 100%";><a href="Order.jsp"
							class="nav-link px-0 align-middle"> <i class="fs-4 bi-table"></i>
								<span class="ms-1 d-none d-sm-inline">Orders</span></a></li>
						<li class="list"><a href="#submenu3"
							data-bs-toggle="collapse" class="nav-link px-0 align-middle">
								<i class="fs-4 bi-grid"></i> <span
								class="ms-1 d-none d-sm-inline">Collections</span>
						</a>
							<ul class="collapse nav flex-column ms-1" id="submenu3"
								data-bs-parent="#menu">
								<li class="sublist"><a href="DateWise.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">Daily(DateWise)</span></a></li>
								<li class="sublist"><a href="DailyOrder.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">Total Orders Collection</span></a></li>
								<li class="sublist"><a href="MonthlyCollection.jsp"
									class="nav-link px-0" style="color: black;"> <span
										class="d-none d-sm-inline">Monthly Collection</span></a></li>
							   </ul>
							</li>
							</ul>
							
							<hr>
							<div class="dropdown pb-4">
								<a href="#"
									class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
									id="dropdownUser1" data-bs-toggle="dropdown"
									aria-expanded="false"> <img src="img/human.png"
									alt="hugenerd" width="30" height="30" class="rounded-circle">
									<span class="d-none d-sm-inline mx-1">Account</span>
								</a>
								<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
									<li><a class="dropdown-item" href="#">New project...</a></li>
									<li><a class="dropdown-item" href="#">Settings</a></li>
									<li><a class="dropdown-item" href="#">Profile</a></li>
									<li>
										<hr class="dropdown-divider">
									</li>
									<li><a class="dropdown-item" href="Logout">Sign out</a></li>
								</ul>
							</div>
				</div>
			</div>
			<div class="col py-3 sidepage">