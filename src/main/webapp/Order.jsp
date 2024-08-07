 <%@page
	import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/Orders.css">
<script>
	function openDiv(divId) {
		// Show the selected div
		var selectedDiv = document.getElementById(divId);
		selectedDiv.classList.remove('hidden');
	}
	function getItem(items) {
		var selectItem = document.getElementById(items).innerHTML;
		console.log(selectItem);
		document.getElementById("Item1").value = selectItem;
	}
	
	 function validateIntegerInput(input) {
         // Replace any non-digit character with an empty string
         input.value = input.value.replace(/\D/g, '');
     }
</script>
</head>
<body>
	<%@ include file="Dashboard.jsp"%>

	<div class=" container-fluid">
		<!-- Our Menu and Search Bar -->
		<div class="row slider">
			<div class="col-sm-6 ourmenu ">
				<h1 class=" pt-5">Our Menu</h1>
				<ul>
					<a href="#veg">
						<li class="me-1"><button onclick="openDiv('veg')">Veg</button></li>
					</a>
					<a href="#nonveg"><li class="me-1"><button
								onclick="openDiv('nonveg')">Non-Veg</button></li></a>
					<a href="#vegan"><li class="me-1"><button
								onclick="openDiv('vegan')">vegan</button></li></a>
				</ul>
			</div>
			<!-- <div class="col-sm-6 search ">
				<input type="text" placeholder="Search">
			</div> -->
		</div>

		<!-- Menu ItemContent -->
		<div class="row containt mt-1 ">

			<!-- Menu Item -->
			<div class="col-md-7 items" id="item"
				style="overflow-y: scroll; height: 70vh;">

				<div id="veg" class="">
					<!-- Contents of div 1 -->
					<div class="row bg-white ">
						<div class="col-md-3 menu">
							<div class="row menuitems">
								<div class="col-md-12 mt-3">
									<img src="img/chef.png" alt="menu">
									<h4>Veg</h4>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#submenu" onclick="openDiv('submenu')"><h5>Marathi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#punjabiVeg" onclick="openDiv('punjabiVeg')"><h5>Punjabi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#SouthIndianVeg" onclick="openDiv('SouthIndianVeg')"><h5>South
											Indian</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#gujratiVeg" onclick="openDiv('gujratiVeg')"><h5>Gujrati</h5></a>
								</div>
							</div>
						</div>
						<div class="col-md-9" style="overflow-y: scroll; height: 65vh;">
							<div id="submenu" class="">

								<div class="row h p-3 position-sticky" style="top: 0;">Maharashtriyan</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/puran2-removebg-preview.png" alt="puranpoli"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="puran">Puran Poli</h4>
										<p>Rs. 250/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('puran')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/besanbhakri-removebg-preview.png"
											alt="pithalBakri" class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="pithal">Pithal Bhakri</h4>
										<p>Rs. 100/-</p>

										<div class="add">
											<a href="#" id='btn' onclick="getItem('pithal')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/aamati-removebg-preview.png" alt="AamtiBhat"
											class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="amti">Aamti Bhat</h4>
										<p>Rs. 80/-</p>

										<div class="add">
											<a href="#" onclick="getItem('amti')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-3 sub_menu">
									<div class="col-md-6">
										<img src="img/kothimbirvadi-removebg-preview.png" alt=""
											class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="vadi">kothimbir Vadi</h4>
										<p>Rs. 50/-</p>

										<div class="add">
											<a href="#" onclick="getItem('vadi')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- punjabiVeg -->
							<div id='punjabiVeg' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">Punjabi</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/balti-paneer-removebg-preview.png"
											alt="baltipaneer" class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="balti">Balti Paneer</h4>
										<p>Rs. 250/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('balti')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/dal-makhni-removebg-preview.png" alt="dalmakhni"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="makhni">Dal Makhni</h4>
										<p>Rs. 200/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('makhni')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/rajma-removebg-preview.png" alt="Rajma"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="rajma">Rajma</h4>
										<p>Rs. 120/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('rajma')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/Chhole-Bhature-removebg-preview.png" alt="Rajma"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="chhole">Chhole-Bhture</h4>
										<p>Rs. 150/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('chhole')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- SouthIndianVeg -->
							<div id='SouthIndianVeg' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">South
									Indian</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/idli-sambar--removebg-preview.png" alt="idli"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="idli">Idali Sambar</h4>
										<p>Rs. 130/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('idli')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/pesarattu-removebg-preview.png" alt="pesarattu"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="pesa">Pesarattu</h4>
										<p>Rs. 100/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('pesa')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/dosa-removebg-preview.png" alt="dosa"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="dosa">Dosa</h4>
										<p>Rs. 60/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('dosa')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/pongal-removebg-preview.png" alt="pongal"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="pongal">Pongal</h4>
										<p>Rs. 100/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('pongal')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>


							</div>

							<!--  gujratiVeg -->
							<div id='gujratiVeg' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">Gujrati</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/undhiyu-removebg-preview.png" alt="undhiyu"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="undhiyu">Undhiyu Puri</h4>
										<p>Rs. 180/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('undhiyu')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/sev.png" alt="sev" class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="sev">Sev Tomato Shak</h4>
										<p>Rs. 160/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('sev')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/kadi-removebg-preview.png" alt="kadi"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="kadi">Kadi</h4>
										<p>Rs. 90/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('kadi')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/khaman-removebg-preview.png" alt="dhokla"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="dhokla">Khaman Dokla</h4>
										<p>Rs. 70/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('dhokla')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>


							</div>

						</div>
					</div>

				</div>

				<!-- non veg -->
				<div id="nonveg" class="hidden">
					<!-- Contents of div 1 -->
					<div class="row bg-white ">
						<div class="col-md-3 menu">
							<div class="row menuitems">
								<div class="col-md-12 mt-3">
									<img src="img/chef.png" alt="menu">
									<h4>Non-Veg</h4>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#sub" onclick="openDiv('sub')"><h5>Marathi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#punjabi-non-veg" onclick="openDiv('punjabi-non-veg')"><h5>Punjabi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#SouthIndian-nonVeg"
										onclick="openDiv('SouthIndian-nonVeg')"><h5>South
											Indian</h5></a>
								</div>
							</div>
						</div>

						<div class="col-md-9" style="overflow-y: scroll; height: 65vh;">
							<div id="sub" class="hidden">

								<div class="row h p-3 position-sticky" style="top: 0;">Maharashtriyan</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/kfish-removebg-preview.png" alt="kfish"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="kfish">Kolhapuri Fish</h4>
										<p>Rs. 250/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('kfish')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/shutterstock_2158268479-removebg-preview.png"
											alt="muttoncurry" class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="muttoncurry">Black Mutton Curry</h4>
										<p>Rs. 150/-</p>

										<div class="add">
											<a href="#" id='btn' onclick="getItem('muttoncurry')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/Spicy_Malvani_Chicken-removebg-preview.png"
											alt="malavni" class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="malavni">Malavni Chicken</h4>
										<p>Rs. 180/-</p>

										<div class="add">
											<a href="#" onclick="getItem('malavni')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-3 sub_menu">
									<div class="col-md-6">
										<img src="img/bombayduck-removebg-preview.png" alt="duck"
											class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="duck">Bombay Duck</h4>
										<p>Rs. 120/-</p>

										<div class="add">
											<a href="#" onclick="getItem('duck')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- punjabi-non-veg -->
							<div id='punjabi-non-veg' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">Punjabi</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/butter-chicken-removebg-preview.png"
											alt="butterchicken" class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="butterchicken">Butter Chicken</h4>
										<p>Rs. 270/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('butterchicken')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/afish-removebg-preview.png" alt="afish"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="afish">Amrutsari Fish</h4>
										<p>Rs. 200/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('afish')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/kharode-removebg-preview.png" alt="kharode"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="kharode">Kharode</h4>
										<p>Rs. 150/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('kharode')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/mutton-champ-removebg-preview.png" alt="muttonc"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="muttonc">Mutton Champ</h4>
										<p>Rs. 120/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('muttonc')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- SouthIndian-nonVeg -->
							<div id='SouthIndian-nonVeg' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;"">South
									Indian</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/thalai_kari-removebg-preview.png" alt="thalai"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="thalai">Thalai Curry</h4>
										<p>Rs. 230/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('thalai')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/moolie-removebg-preview.png" alt="moolie"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="moolie">Fish Moolie</h4>
										<p>Rs. 200/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('moolie')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/Chicken-Salna-removebg-preview.png" alt="salna"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="salna">Chicken Salna</h4>
										<p>Rs. 120/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('salna')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/prawn-coconut-curry-removebg-preview.png"
											alt="prawn" class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="prawn">Kerla Prawn Curry</h4>
										<p>Rs. 200/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('prawn')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>



							</div>
						</div>
					</div>
				</div>

				<!-- vegan -->
				<div id="vegan" class="hidden">
					<!-- Contents of vegan -->
					<div class="row bg-white ">
						<div class="col-md-3 menu">
							<div class="row menuitems">
								<div class="col-md-12 mt-3">
									<img src="img/chef.png" alt="menu">
									<h4>Vegan</h4>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#vegansub" onclick="openDiv('vegansub')"><h5>Marathi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#punjabiVegan" onclick="openDiv('punjabiVegan')"><h5>Punjabi</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#SouthIndianVegan"
										onclick="openDiv('SouthIndianVegan')">
										<h5>SouthIndian</h5></a>
								</div>
							</div>

							<div class="row subrow">
								<div class="col-md-12">
									<a href="#gujratiVegan" onclick="openDiv('gujratiVegan')"><h5>gujrati</h5></a>
								</div>
							</div>
						</div>
						<div class="col-md-9" style="overflow-y: scroll; height: 65vh;">
							<div id="vegansub" class="hidden">

								<div class="row h p-3 position-sticky" style="top: 0;">Maharashtriyan</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/potatocurry-removebg-preview.png" alt="potato"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="potato">Potato Curry</h4>
										<p>Rs. 120/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('potato')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/urad-dal-removebg-preview.png" alt="urad"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="urad">Urad Dal</h4>
										<p>Rs. 150/-</p>

										<div class="add">
											<a href="#" id='btn' onclick="getItem('urad')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/peas-removebg-preview.png" alt="peas"
											class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="peas">Green Peas Curry</h4>
										<p>Rs. 100/-</p>

										<div class="add">
											<a href="#" onclick="getItem('peas')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-3 sub_menu">
									<div class="col-md-6">
										<img src="img/bhat-removebg-preview.png" alt="bhat"
											class="img-fluid">
									</div>
									<div class="col-md-6">
										<h4 id="bhat">Masale Bhat</h4>
										<p>Rs. 70/-</p>

										<div class="add">
											<a href="#" onclick="getItem('bhat')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- punjabiVeg -->
							<div id='punjabiVegan' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">Punjabi</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/tikki-removebg-preview.png" alt="tikki"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="tikki">Aaloo Tikki</h4>
										<p>Rs. 150/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('tikki')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/bhindi-removebg-preview.png" alt="bhindi"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="bhindi">Bhindi Masala</h4>
										<p>Rs. 100/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('bhindi')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/chana-masala-removebg-preview.png" alt="chana"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="chana">Chana Masala</h4>
										<p>Rs. 90/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('chana')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!-- SouthIndianVeg -->
							<div id='SouthIndianVegan' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">South
									Indian</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/vada-removebg-preview.png" alt="vada"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="vada">Masala Vada</h4>
										<p>Rs. 80/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('vada')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/rice-removebg-preview.png" alt="rice"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="rice">Leman Rice</h4>
										<p>Rs. 60/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('rice')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/Appam-removebg-preview.png" alt="appam"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="appam">Appam</h4>
										<p>Rs. 90/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('appam')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>

							<!--  gujratiVegan -->
							<div id='gujratiVegan' class="hidden">
								<div class="row h p-3 position-sticky" style="top: 0;">Gujrati</div>
								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/khakra-removebg-preview.png" alt="khakra"
											class="img-fluid">
									</div>
									<div class="col-md-6 submenu1">
										<h4 id="khakra">Khakra</h4>
										<p>Rs. 100/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('khakra')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/Fafda-removebg-preview.png" alt="fafda"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="fafda">Fafda</h4>
										<p>Rs. 90/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('fafda')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

								<div class="row mt-2 sub_menu">
									<div class="col-md-6">
										<img src="img/thepla-removebg-preview.png" alt="thepla"
											class="img-fluid mt-0">
									</div>
									<div class="col-md-6 submenu1 mt-1">
										<h4 id="thepla">Thepla</h4>
										<p>Rs. 100/-</p>
										<div class="add">
											<a href="#" id="btn" onclick="getItem('thepla')"
												style="background-color: orange; text-decoration: none; color: black; padding: 1vh; border-radius: 5px; box-shadow: 5px 5px 5px rgb(255, 128, 0);">Add
												+</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>

			</div>

			<!-- Cart -->
			<div class="col-md-5 cart" style="overflow-y: hidden; height: 65vh;">
				<form name='frm' action='Orders' method="get">
					<div class="row mt-4 cartitem">
						<%
						String Cname = (String) session.getAttribute("customer");
						%>
						<%
						if(Cname==null)
						{
					   %>
							<h5>First Add Customer</h5>
							<%
						}
						else
						{
						%>
						<h5><%=Cname%>'s Order
						</h5>
						<div class="col-md-6">
							<input class="inpt" type='text' name='Item1' id='Item1' value=''
								placeholder="name" required>
						</div>
						<div class="col-md-3">
							<input class="inpt" type='text' name='Qty' id="Qty" value=''
								placeholder="qty" oninput="validateIntegerInput(this)" pattern="\d*" title="Only integers are allowed" required>
						</div>
						<div class="col-md-3">
							<button class="sub mt-1" type="submit" class="">Order</button>
						</div>
                        <%
                        }
                        %>
					</div>
				</form>

				<div class="row table mt-3"
					style="height: 30vh; overflow-y: scroll;margin-left:5px;">

					<table>
						<thead class="position-sticky" style="top: 0;">
							<tr>
								<th>Item</th>
								<th>Qty</th>
								<th>Price</th>
							</tr>
						</thead>
						<tbody>
							<%!int rno = 0;
	                           int totalAmount = 0;
	                           Date date;
	                        %>
							<%
							BillService bs = new BillServiceImpl();
							List<BillModel> list = bs.TotalBill(Cname);
							//System.out.println(list);
							for (BillModel b : list) {
								rno = b.getOid();
								date = b.getOdate();
							%>
							<tr>
								<td><%=b.getIname()%></td>
								<td><%=b.getQty()%></td>
								<td><%=b.getPrice()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>


				</div>
				<div class=" row bill bg-primary me-5">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						Bill</button>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="staticBackdrop"
					data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
					aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">


								<h5 class="modal-title" id="staticBackdropLabel">
									Receipt No:<%=rno%>
									| <span style="font-weight: light; font-size: 15px">Date:<%=date%></span>
								</h5>


								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<h5><%=Cname%>'s Bill
								</h5>
								<div class="row table mt-3">
									<table>
										<thead>

											<tr>
												<th>Item</th>
												<th>Qty</th>
												<th>Total</th>
											</tr>
										</thead>
										<tbody>
											<%
											for (BillModel b : list) {
												totalAmount = b.getTotalamount();
											%>
											<tr>
												<td><%=b.getIname()%></td>
												<td><%=b.getQty()%></td>
												<td><%=b.getPrice()%></td>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
								<h6>Total:<%=totalAmount%></h6>
								<h6> Gst :3.5%</h6>
								<h5>Total:<%=totalAmount + totalAmount * 3.5 / 100%></h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" onclick="window.print();">Print</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
