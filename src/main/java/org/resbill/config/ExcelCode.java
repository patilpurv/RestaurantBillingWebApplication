/*
 * package org.resbill.config;
 * 
 * import java.io.File; import java.io.FileOutputStream; import
 * java.sql.PreparedStatement; import java.sql.SQLException; import
 * java.sql.Statement;
 * 
 * import org.apache.poi.xssf.usermodel.XSSFCell; import
 * org.apache.poi.xssf.usermodel.XSSFRow; import
 * org.apache.poi.xssf.usermodel.XSSFSheet; import
 * org.apache.poi.xssf.usermodel.XSSFWorkbook;
 * 
 * import com.mysql.cj.jdbc.result.ResultSetMetaData;
 * 
 * public class ExcelCode extends DBConfig { String str;
 * 
 * public String excelCode(String str) { this.str = str; // str="customer"; try
 * {
 * 
 * Statement stmt = conn.createStatement(); String sql = "SELECT * FROM " + str
 * + ""; rs = stmt.executeQuery(sql);
 * 
 * // Create a new Excel workbook XSSFWorkbook workbook = new XSSFWorkbook();
 * XSSFSheet sheet = workbook.createSheet("Data"); // Add column headers XSSFRow
 * headerRow = sheet.createRow(0); ResultSetMetaData rsmd = (ResultSetMetaData)
 * rs.getMetaData(); int numColumns = rsmd.getColumnCount(); for (int i = 1; i
 * <= numColumns; i++) { XSSFCell cell = headerRow.createCell(i - 1);
 * cell.setCellValue(rsmd.getColumnName(i)); }
 * 
 * // Add data rows int rowNum = 1; while (rs.next()) { XSSFRow row =
 * sheet.createRow(rowNum++); for (int i = 1; i <= numColumns; i++) { XSSFCell
 * cell = row.createCell(i - 1); cell.setCellValue(rs.getString(i)); } }
 * 
 * // Write the workbook content to a file // String filepath =
 * "C:\\RBAEXCELSHEET\\data.xlsx"; String filepath =
 * " C:\\RBAEXCELSHEET"+File.separator+str+".xlsx";
 * 
 * File targetFile = new File(filepath); System.out.println(filepath);
 * 
 * 
 * FileOutputStream fileOut = new FileOutputStream(targetFile);
 * workbook.write(fileOut); fileOut.close(); workbook.close(); return filepath;
 * } catch (Exception e) { e.printStackTrace();
 * System.out.println("An error occurred: " + e); return null; } finally { //
 * Close the result set, statement, and connection if (rs != null) { try {
 * rs.close(); } catch (SQLException e) { ignored } } if (stmt != null) { try {
 * stmt.close(); } catch (SQLException e) { ignored } } if (conn != null) { try
 * { conn.close(); } catch (SQLException e) { ignored } } } } // path=
 * C:\RBAEXCELSHEET\+str+.xlsx; }
 */
package org.resbill.config;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

public class ExcelCode extends DBConfig {
    String str;

    public String excelCode(String str,String str1) {
        this.str = str;
        // str="customer";
       
        

        try {
//            conn = getConnection();  // Assuming DBConfig provides this method
            stmts = conn.createStatement();
            String sql = str1;
            rs = stmts.executeQuery(sql);

            // Create a new Excel workbook
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet("Data");
            // Add column headers
            XSSFRow headerRow = sheet.createRow(0);
            ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
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

            // Ensure directory exists
            String directoryPath = "C:\\RBAEXCELSHEET";
            File directory = new File(directoryPath);
            if (!directory.exists()) {
                directory.mkdirs();
            }

            // Write the workbook content to a file
            String filepath = directoryPath + File.separator + str + ".xlsx";
            File targetFile = new File(filepath);

            FileOutputStream fileOut = new FileOutputStream(targetFile);
            workbook.write(fileOut);
            fileOut.close();
            workbook.close();
            return filepath;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("An error occurred: " + e);
            return null;
        } finally {
            // Close the result set, statement, and connection
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) { /* ignored */ }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) { /* ignored */ }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) { /* ignored */ }
            }
        }
    }

    // Assuming this method is in DBConfig
}
