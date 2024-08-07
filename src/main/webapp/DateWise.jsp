<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*,org.resbill.config.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/DailyOrder.css">
</head>
<body>
   <%! ItemService iservice= new ItemServiceImpl();%>
   <%@ include file="Dashboard.jsp"%>
   <div class="container">
      <br><br>
      <h2>DateWise Collection</h2>
   <!-- slider -->
   
   <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      
      <div class="bargraph">
		<img src="DateWise" alt="Bar Chart" style="margin:auto;display:block;margin-top:10vh; 
		body, html {
    margin: 0;
    padding: 0;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #f8f9fa; /* Optional: Set a background color */
}

.image-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%; /* Make the container take the full width */
    height: 100%; /* Make the container take the full height */
    padding: 10vh 0; /* Optional: Adjust the padding as needed */
}

.responsive-image {
    max-width: 100%; /* Scale the image to fit within the container */
    height: auto; /* Maintain the aspect ratio */
    margin: auto;
    display: block;
}">
</div>
      
    </div>
    <div class="carousel-item">
      
      <div class="scrolltable" style="overflow-y: scroll; height: 400px">
		<table>
		<thead class="position-sticky" style="top:0;">
				<tr>
					<th scope="col">Sr.No</th>
					<th scope="col">Dates</th>
					<th scope="col">Collection</th>				
				</tr>
				</thead>	
				<%
				List<OrderModel> Datewiseorder = iservice.getDatewiseCollection();
				int count=0;
				for (OrderModel o : Datewiseorder) {
					
					%>
				<tr>
				    <td><%=++count%></td>
					<td><%=o.getDate()%></td>
					<td><%=o.getPrice()%></td>
				</tr>
				<%
				}
				%>
		
			<!--  </div>-->
		</table>
		</div>
      
    </div>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
  <%--  <%
ExcelCode ex=new ExcelCode();
String str1="select monthname(Odate),year(Odate),sum(totalamount) from orders group by year(Odate),monthname(Odate) order by year(Odate) desc,monthname(Odate)desc ";
String filepath=ex.excelCode("Datewise",str1);
System.out.println(filepath);
%>   
	<div class="download">
		<a href="<%=filepath%>" data-download="<%=filepath%>">Download
			Excel</a>
	</div> --%>
   
		
	</div>
	</div>
	</div>
</body>
</html>