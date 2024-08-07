<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="org.resbill.services.*,org.resbill.model.*,java.util.*,org.resbill.config.*"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%

   int date=Integer.parseInt(request.getParameter("d"));
   int month=Integer.parseInt(request.getParameter("m"));
   int year=Integer.parseInt(request.getParameter("y"));
   ItemService iservice = new ItemServiceImpl();
%>
<table>
         <tr>
              <th>Month</th>
              <th>Year</th>
              <th>Collection</th>
            </tr>
               <%
				List<OrderModel> Monthlyorder = iservice.searchbydate(date, month, year);
				int count = 0;
				for (OrderModel o : Monthlyorder) {
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
<body>

</body>
</html>