/*
 * package org.resbill.controller;
 * 
 * import java.awt.Color; import java.io.IOException; import
 * java.io.OutputStream; import java.text.SimpleDateFormat;
 * 
 * import javax.servlet.ServletException; import
 * javax.servlet.annotation.WebServlet; import javax.servlet.http.HttpServlet;
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import org.jfree.chart.ChartFactory;
 * import org.jfree.chart.ChartUtils; import org.jfree.chart.JFreeChart; import
 * org.jfree.chart.plot.CategoryPlot; import
 * org.jfree.chart.renderer.category.BarRenderer; import
 * org.jfree.data.category.DefaultCategoryDataset; import
 * org.resbill.services.*; import org.resbill.model.*; import java.util.*;
 *//**
	 * Servlet implementation class BarChart
	 */
/*
 * @WebServlet("/DateWise") public class DateWise extends HttpServlet { private
 * static final long serialVersionUID = 1L;
 * 
 * protected void doGet(HttpServletRequest request, HttpServletResponse
 * response) throws ServletException, IOException {
 * response.setContentType("image/png");
 * 
 * DefaultCategoryDataset dataset = new DefaultCategoryDataset(); ItemService
 * iservice= new ItemServiceImpl(); List<OrderModel> Datewiseorder =
 * iservice.getDatewiseCollection(); SimpleDateFormat sdf = new
 * SimpleDateFormat("dd-MM-yyyy");
 * 
 * for (OrderModel o : Datewiseorder) { String formattedDate =
 * sdf.format(o.getDate()); dataset.addValue(o.getPrice(), "Collection",
 * formattedDate); }
 * 
 * 
 * JFreeChart barChart = ChartFactory.createBarChart(
 * "Orders Collection Over Months", "Day", "Rupees", dataset);
 * 
 * CategoryPlot plot = (CategoryPlot) barChart.getPlot(); BarRenderer renderer =
 * (BarRenderer) plot.getRenderer(); renderer.setMaximumBarWidth(0.1); // Sets
 * the color of the bars for the first series renderer.setSeriesPaint(0,
 * Color.CYAN); // Set solid color for the bars
 * renderer.setDrawBarOutline(false); // Disable bar outlines
 * renderer.setShadowVisible(false); OutputStream out =
 * response.getOutputStream(); ChartUtils.writeChartAsPNG(out, barChart, 640,
 * 400); // Use ChartUtils instead of ChartUtilities out.close(); }
 * 
 *//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *//*
		 * protected void doPost(HttpServletRequest request, HttpServletResponse
		 * response) throws ServletException, IOException { doGet(request, response); }
		 * }
		 */

package org.resbill.controller;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.resbill.services.ItemService;
import org.resbill.services.ItemServiceImpl;
import org.resbill.model.OrderModel;

@WebServlet("/DateWise")
public class DateWise extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/png");

        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        ItemService iservice = new ItemServiceImpl();
        List<OrderModel> Datewiseorder = iservice.getDatewiseCollection();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

        for (OrderModel o : Datewiseorder) {
            String formattedDate = sdf.format(o.getDate());
            dataset.addValue(o.getPrice(), "Collection", formattedDate);
        }

        JFreeChart barChart = ChartFactory.createBarChart(
            "Orders Collection Over Months",
            "Date",
            "Rupees",
            dataset);

        CategoryPlot plot = (CategoryPlot) barChart.getPlot();
        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setMaximumBarWidth(0.1);
        Color customColor = new Color(73, 3, 28);
		renderer.setSeriesPaint(0,customColor ); 
        renderer.setDrawBarOutline(false);
        renderer.setShadowVisible(false);

        CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

        OutputStream out = response.getOutputStream();
        ChartUtils.writeChartAsPNG(out, barChart, 640, 400);
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
