<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*,org.resbill.config.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/DailyOrder.css">
</head>
<body>
	<%!ItemService iservice = new ItemServiceImpl();%>
	<%@ include file="Dashboard.jsp"%>
	<div class="container">
		<br> <br>
		<h2>Daily Order Collection</h2>
		<div class="scrolltable scrl" style="overflow-y: scroll; height: 400px">
			<table>
             <thead class="position-sticky" style="top:0;">
				<tr>
					<th scope="col">Sr.No</th>
					<th scope="col">Dates</th>
					<th scope="col">Collection</th>
				</tr>
			</thead>
				<%
				List<OrderModel> DailyOrder = iservice.getDailyOrders();
				int count = 0;
				for (OrderModel o : DailyOrder) {
				%>
				<tr>
					<td><%=++count%></td>
					<td><%=o.getDate()%></td>
					<td><%=o.getPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
<%
ExcelCode ex=new ExcelCode();
String str1="select * from orders order by Odate desc";
String filepath=ex.excelCode("Daily",str1);
System.out.println(filepath);
%>   
	<div class="download" style="width:30%">
		<a href="<%=filepath%>" data-download="<%=filepath%>">Download
			Excel</a>
	</div> 
	</div>
	</div>
	</div>		
</body>
</html>