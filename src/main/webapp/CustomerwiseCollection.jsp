<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/DailyOrder.css">
</head>
<body>
	<%!ItemService iservice = new ItemServiceImpl();%>
	<%@ include file="Dashboard.jsp"%><div class="container">
		<br> <br>
		<h2>Bill Details</h2>
		<div class="scrolltable" style="overflow-y: scroll; height: 400px">
			<table>
				<thead class="position-sticky" style="top: 0;">
					<tr>
					    <th scope="col">Table Id</th>
						<th scope="col">Cust. Id</th>
						<th scope="col">Name</th>
						<th scope="col">Order Id</th>
						<th scope="col">Collection</th>
					</tr>
				</thead>
				<%
				List<OrderModel> customer = iservice.getMonthlyCollection();
				int count = 0;
				for (OrderModel o : customer) {
				%>
				<tr>
					<td><%=++count%></td>
					<td><%=o.getMonth()%></td>
					<td><%=o.getYear()%></td>
					<td><%=o.getPrice()%></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
	</div>
	</div>
	</div>
</body>
</html> --%>