package org.resbill.repository;

 
import java.io.FileOutputStream;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.List;

import org.resbill.config.DBConfig;
import org.resbill.model.customermodel;

public class customerRepositoryImpl extends DBConfig implements customerRepository  {
	customermodel cmodel=new customermodel();
	int Cid=0;
	public int getCustomerId()
	{
		try {
			stmt=conn.prepareStatement("select max(Cid) from customer");
			rs=stmt.executeQuery();
			if(rs.next())
			{
				Cid=rs.getInt(1);
			}
			++Cid;
			
		}
		catch(Exception ex)
	    {
	      System.out.println(ex);
	     }
		return Cid;
	}
	public boolean isCustomerAdd(customermodel cmodel,int tid) {
		// TODO Auto-generated method stub
		try
		{
			int Cid=this.getCustomerId();
			stmt=conn.prepareStatement("insert into customer values(?,?,?)");
			stmt.setInt(1,Cid);
			stmt.setString(2,cmodel.getName());
			stmt.setString(3,cmodel.getContact());
			int value=stmt.executeUpdate();
			stmt=conn.prepareStatement("update dtable set status='booked' where tid=?");
			stmt.setInt(1,tid);
			int value1=stmt.executeUpdate();
			stmt=conn.prepareStatement("insert into customertablejoin values(?,?)");
			stmt.setInt(1,Cid);
			stmt.setInt(2,tid);
			int value2=stmt.executeUpdate();
			return value>0?true:false;
		}
		catch(Exception ex)
		{
			System.out.println("error in customer repo"+ex);
			return false;
		}
		
	}
	@Override
	public List Viewcustomer() {
		// TODO Auto-generated method stub
		List list=new ArrayList();
		try
		{
			stmt=conn.prepareStatement("select Cname, contact from customer");
			rs=stmt.executeQuery();
			while(rs.next())
			{
				customermodel cmodel=new customermodel();
				cmodel.setName(rs.getString(1));
				cmodel.setContact(rs.getString(2));
				list.add(cmodel);
			}
			return list.size()>0?list:null;
		}
		catch(Exception ex)
		{
			System.out.println("error in customer view repo"+ex);
			return null;
		}
		
	}
	@Override
	public boolean isdeletecustomerbyID(String cname) {
		// TODO Auto-generated method stub
		try
		{
			stmt=conn.prepareStatement("delete from customer where cname=?");
			stmt.setString(1,cname);
			int value=stmt.executeUpdate();
			return value>0?true:false;
			
		}
		catch(Exception ex)
		{
			System.out.println("error in customer delete"+ex);
			return false;
		}
		
	}
//	public int columnname() {
//		
//		String sql=("select * from dtable");
//		String sql = "SELECT * FROM your_table";
//        ResultSet rs = stmt.executeQuery(sql);
//
//        // Create a new Excel workbook
//        XSSFWorkbook workbook = new XSSFWorkbook();
//        XSSFSheet sheet = workbook.createSheet("Data");
//        
//        // Add column headers
//        XSSFRow headerRow = sheet.createRow(0);
//        ResultSetMetaData rsmd = rs.getMetaData();
//        int numColumns = rsmd.getColumnCount();
//        for (int i = 1; i <= numColumns; i++) {
//            XSSFCell cell = headerRow.createCell(i - 1);
//            cell.setCellValue(rsmd.getColumnName(i));
//        }
//
//        // Add data rows
//        int rowNum = 1;
//        while (rs.next()) {
//            XSSFRow row = sheet.createRow(rowNum++);
//            for (int i = 1; i <= numColumns; i++) {
//                XSSFCell cell = row.createCell(i - 1);
//                cell.setCellValue(rs.getString(i));
//            }
//        }
//
//        // Close the result set, statement, and connection
//        rs.close();
//        stmt.close();
//        conn.close();
//
//        // Write the workbook content to a file
//        FileOutputStream fileOut = new FileOutputStream("data.xlsx");
//        workbook.write(fileOut);
//        fileOut.close();
//        workbook.close();
//
//        // Provide a link to download the generated Excel file
//        out.println("<a href=\"data.xlsx\" download>Download Excel</a>");
//
//    } catch (Exception e) {
//        e.printStackTrace();
//        out.println("An error occurred: " + e.getMessage());
//    }
//		return 0;
//	}

}
//<!--  
//
//=============================================
//<%@ page language="java" contentType="text/html; charset=UTF-8"
//    pageEncoding="UTF-8"%>
//<%@ page import="java.sql.*" %>
//<%@ page import="java.io.*" %>
//<%@ page import="org.apache.poi.xssf.usermodel.*" %>
//
//<!DOCTYPE html>
//<html>
//<head>
//<meta charset="UTF-8">
//<title>Download Data as Excel</title>
//</head>
//<body>
//
//<%
//
//    // JDBC URL, username, and password for your database
//    String jdbcUrl = "jdbc:mysql://localhost:3306/your_database";
//    String username = "your_username";
//    String password = "your_password";
//
//    try {
//        // Load the MySQL JDBC driver
//        Class.forName("com.mysql.jdbc.Driver");
//        
//        // Connect to the database
//        Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
//
//        // Execute a SQL query to fetch data from the database
//        Statement stmt = conn.createStatement();
//        String sql = "SELECT * FROM your_table";
//        ResultSet rs = stmt.executeQuery(sql);
//
//        // Create a new Excel workbook
//        XSSFWorkbook workbook = new XSSFWorkbook();
//        XSSFSheet sheet = workbook.createSheet("Data");
//        
//        // Add column headers
//        XSSFRow headerRow = sheet.createRow(0);
//        ResultSetMetaData rsmd = rs.getMetaData();
//        int numColumns = rsmd.getColumnCount();
//        for (int i = 1; i <= numColumns; i++) {
//            XSSFCell cell = headerRow.createCell(i - 1);
//            cell.setCellValue(rsmd.getColumnName(i));
//        }
//
//        // Add data rows
//        int rowNum = 1;
//        while (rs.next()) {
//            XSSFRow row = sheet.createRow(rowNum++);
//            for (int i = 1; i <= numColumns; i++) {
//                XSSFCell cell = row.createCell(i - 1);
//                cell.setCellValue(rs.getString(i));
//            }
//        }
//
//        // Close the result set, statement, and connection
//        rs.close();
//        stmt.close();
//        conn.close();
//
//        // Write the workbook content to a file
//        FileOutputStream fileOut = new FileOutputStream("data.xlsx");
//        workbook.write(fileOut);
//        fileOut.close();
//        workbook.close();
//
//        // Provide a link to download the generated Excel file
//        out.println("<a href=\"data.xlsx\" download>Download Excel</a>");
//
//    } catch (Exception e) {
//        e.printStackTrace();
//        out.println("An error occurred: " + e.getMessage());
//    }
//%>
//
//</body>
//</html>


























//
//
//
//<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
//<%@ page import="java.util.List, java.io.*, java.sql.*" %>
//<%@ page import="org.apache.poi.xssf.usermodel.*,org.resbill.services.customerservice, org.resbill.services.customerserviceImpl, org.resbill.model.customermodel" %>
//<!DOCTYPE html>
//<html>
//<head>
//    <link rel="stylesheet" href="CSS/ViewCustomer.css">
//    <meta charset="UTF-8">
//    <title>Customer Details</title>
//</head>
//<body>
//    <%@ include file="Dashboard.jsp"%>
//    <div class="container">
//        <h2>Customer Details</h2>
//        <table>
//            <thead>
//                <tr>
//                    <th scope="col">Sr.No</th>
//                    <th scope="col">Customer name</th>
//                    <th scope="col">Customer Contact</th>
//                    <th scope="col">Delete</th>
//                </tr>
//            </thead>
//            <tbody>
//                <% 
//                    customerservice cs = new customerserviceImpl();
//                    List<customermodel> list = cs.Viewcustomer();
//                    int count = 0;
//                    for (customermodel c : list) {
//                %>
//                <tr>
//                    <td><%=++count%></td>
//                    <td><%=c.getName()%></td>
//                    <td><%=c.getContact()%></td>
//                    <td><a href="DeleteCustomer?cname=<%=c.getName()%>"><img src="img/bin.png" alt="Delete"></a></td>
//                </tr>
//                <% } %>
//            </tbody>
//        </table>
//    </div>
//
//    <% 
//        // JDBC URL, username, and password for your database
//        String jdbcUrl = "jdbc:mysql://localhost:3306/Restaurant";
//        String username = "root";
//        String password = "0808";
//
//        try {
//            // Load the MySQL JDBC driver
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            
//            // Connect to the database
//            Connection conn = DriverManager.getConnection(jdbcUrl, username, password);
//
//            // Execute a SQL query to fetch data from the database
//            Statement stmt = conn.createStatement();
//            String sql = "SELECT * FROM customer";
//            ResultSet rs = stmt.executeQuery(sql);
//
//            // Create a new Excel workbook
//            XSSFWorkbook workbook = new XSSFWorkbook();
//            XSSFSheet sheet = workbook.createSheet("Data");
//            
//            // Add column headers
//            XSSFRow headerRow = sheet.createRow(0);
//            ResultSetMetaData rsmd = rs.getMetaData();
//            int numColumns = rsmd.getColumnCount();
//            for (int i = 1; i <= numColumns; i++) {
//                XSSFCell cell = headerRow.createCell(i - 1);
//                cell.setCellValue(rsmd.getColumnName(i));
//            }
//
//            // Add data rows
//            int rowNum = 1;
//            while (rs.next()) {
//                XSSFRow row = sheet.createRow(rowNum++);
//                for (int i = 1; i <= numColumns; i++) {
//                    XSSFCell cell = row.createCell(i - 1);
//                    cell.setCellValue(rs.getString(i));
//                }
//            }
//
//            // Close the result set, statement, and connection
//            rs.close();
//            stmt.close();
//            conn.close();
//
//            // Write the workbook content to a file
//            FileOutputStream fileOut = new FileOutputStream("data.xlsx");
//            workbook.write(fileOut);
//            fileOut.close();
//            workbook.close();
//            String path="C:\\RBAEXCELSHEET\\data.xlsx";
//            // Provide a link to download the generated Excel file
//            out.println("<a href=path download>Download Excel</a>");
//
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            out.println("An error occurred: " + e.getMessage());
//        }
//    %>  
//</body>
//</html>


