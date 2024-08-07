<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="CSS/ViewTable.css">
</head>
<body>
	<%!tableService tservice = new tableServiceImpl();%>
	<%@ include file="Dashboard.jsp"%>
	<div class="container">
		<h2 style="text-align: center;">Table Details</h2>
		<div class="scrolltable"
			style="overflow-y: scroll; height: 300px; margin-top: 3em;">
			<table>
				<thead class="position-sticky" style="top: 0;">
					<tr>
						<th scope="col">Sr.No</th>
						<th scope="col">Table Type</th>
						<th scope="col">Table Status</th>
						<th scope="col">Delete</th>
						<th scope="col">Update</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<tablemodel> list = tservice.viewTable();
					for (tablemodel t : list) {
					%>

					<tr>
						<td><%=t.getTid()%></td>
						<td><%=t.getTtype()%></td>
						<td class="st"><%=t.getStatus()%></td>
						<td><a href='Deletetable?tid=<%=t.getTid()%>'><img
								src="img/bin.png"></a></td>
						<td><a
							href='UpdateTable?tid=<%=t.getTid()%>&status=<%=t.getStatus()%>'><img
								src="img/refresh.png"></a></td>
					</tr>

					<%
					}
					%>
				</tbody>
				<!--  </div>-->
			</table>
			
			 <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        const tds = document.querySelectorAll('.st');
                        tds.forEach(td => {
                            if (td.textContent.trim() === "booked") {
                                td.style.backgroundColor = 'rgb(235, 76, 76)';
                                td.style.fontWeight= 'bold';// Change to desired color
                            }
                            else
                            	{
                            	 td.style.backgroundColor= 'rgb(83, 220, 83)';
                            	 td.style.fontWeight= 'bold';
                            	}
                        });
                    });
 </script>
			
		</div>
	</div>
	</div>
	</div>
</body>
</html>