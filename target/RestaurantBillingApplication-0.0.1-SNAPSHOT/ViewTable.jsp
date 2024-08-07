<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/Viewtable.css">
</head>
<body>
   <%!tableService tservice= new tableServiceImpl();%>
   <%@ include file="Dashboard.jsp"%>
   <div class="container">
		<br>
		<br>
		<h2>Table Details</h2>
		<table>
		<!-- <div class="thead"> -->
			
				<tr>
					<th scope="col">Sr.No</th>
					<th scope="col">Table Type</th>
					<th scope="col">Table Status</th>
					<th scope="col">Delete</th>
					<th scope="col">Update</th>
				</tr>	
				<%
				List<tablemodel> list = tservice.viewTable();
				for (tablemodel t : list) {
				%>
				<tr>
					<td><%=t.getTid()%></td>
					<td><%=t.getTtype()%></td>
					<td><%=t.getStatus()%></td>
					<td><a href='Deletetable?tid=<%=t.getTid()%>'><img src="img/bin.png"></a></td>
					<td><a href='UpdateTable?tid=<%=t.getTid()%>&status=<%=t.getStatus()%>'><img src="img/refresh.png"></a></td>
				</tr>
				<%
				}
				%>
		
			<!--  </div>-->
		</table>
	</div>
	</div>
	</div>
</body>
</html>