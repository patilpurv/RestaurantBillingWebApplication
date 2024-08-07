<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.List,org.resbill.config.*, java.io.*, java.sql.*, org.apache.poi.xssf.usermodel.*, org.resbill.services.*, org.resbill.services.customerserviceImpl.*, org.resbill.model.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/ViewCustomer.css">
<meta charset="UTF-8">
<title>Customer Details</title>
<style>
</style>
</head>
<body>
	<%@ include file="Dashboard.jsp"%>
	<div class="container">
		<h2 style="text-align: center;">Customer Details</h2>
		<div class="scrolltable scrl"
			style="overflow-y: scroll; height: 300px; margin-top: 3em;">
			<table>
				<thead class="position-sticky" style="top: 0;">
					<tr>
						<th scope="col">Sr.No</th>
						<th scope="col">Customer name</th>
						<th scope="col">Customer Contact</th>
						<th scope="col">Delete</th>
					</tr>
				</thead>
				<tbody>
					<%
					customerservice cs = new customerserviceImpl();
					List<customermodel> list = cs.Viewcustomer();
					int count = 0;
					for (customermodel c : list) {
					%>
					<tr>
						<td><%=++count%></td>
						<td><%=c.getName()%></td>
						<td><%=c.getContact()%></td>
						<td><a href="DeleteCustomer?cname=<%=c.getName()%>"><img
								src="img/bin.png" alt="Delete"></a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	<%
	ExcelCode ex = new ExcelCode();
	String filepath = ex.excelCode("customer", "select * from customer");
	System.out.println(filepath);
	%>

	<div class="download">
		<a href="<%=filepath%>" data-download="<%=filepath%>">Download
			Excel</a>
	</div>

</body>
</html>
