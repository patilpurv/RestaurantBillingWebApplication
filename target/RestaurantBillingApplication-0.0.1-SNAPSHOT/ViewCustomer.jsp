<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.io.*, java.sql.*" %>
<%@ page import="org.apache.poi.xssf.usermodel.*,org.resbill.services.customerservice, org.resbill.services.customerserviceImpl, org.resbill.model.customermodel" %>
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
        <h2>Customer Details</h2>
        <div class="scrolltable" style="overflow-y:scroll;height:400px"> 
        <table>
            <thead>
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
                    <td><a href="DeleteCustomer?cname=<%=c.getName()%>"><img src="img/bin.png" alt="Delete"></a></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        </div>
    </div>

    <% 
        // JDBC URL, username, and password for your database
        String jdbcUrl = "jdbc:mysql://localhost:3306/Restaurant";
        String username = "root";
        String password = "0808";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Connect to the database
            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);

            // Execute a SQL query to fetch data from the database
            Statement stmt = conn.createStatement();
            String sql = "SELECT * FROM customer";
            ResultSet rs = stmt.executeQuery(sql);
            // Create a new Excel workbook
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Data");            
            // Add column headers
            XSSFRow headerRow = sheet.createRow(0);
            ResultSetMetaData rsmd = rs.getMetaData();
            int numColumns = rsmd.getColumnCount();
            for (int i = 1; i <= numColumns; i++) {
                XSSFCell cell = headerRow.createCell(i - 1);
                cell.setCellValue(rsmd.getColumnName(i));
            }

            // Add data rows
            int rowNum = 1;
            while (rs.next()) {
                XSSFRow row = sheet.createRow(rowNum++);
                for (int i = 1; i <= numColumns; i++) {
                    XSSFCell cell = row.createCell(i - 1);
                    cell.setCellValue(rs.getString(i));
                }
            }
            // Close the result set, statement, and connection
            rs.close();
            stmt.close();
            conn.close();
            // Write the workbook content to a file
            String filepath="C:\\RBAEXCELSHEET/data.xlsx";
            FileOutputStream fileOut = new FileOutputStream(filepath);
            workbook.write(fileOut);
            fileOut.close();
            workbook.close();
            // Provide a link to download the generated Excel file           
          }
            %>
            <div class="download">
            
            <%
            out.println("<a href=\"file:///C:/RBAEXCELSHEET/data.xlsx\" download >Download Excel</a>");
            %>
</div>
        catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        }
    %>  
</body>
</html>
