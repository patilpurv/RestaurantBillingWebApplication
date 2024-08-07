package org.resbill.controller;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.data.category.DefaultCategoryDataset;
import org.resbill.services.*;
import org.resbill.model.*;
import java.util.*;

/**
 * Servlet implementation class BarChart
 */
@WebServlet("/Monthly")
public class Monthly extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/png");

		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		ItemService iservice = new ItemServiceImpl();
		List<OrderModel> Monthlyorder = iservice.getMonthlyCollection();

		for (OrderModel o : Monthlyorder) {
			dataset.addValue(o.getPrice(), "Collection", o.getMonth());
		}

		JFreeChart barChart = ChartFactory.createBarChart("Orders Collection Over Months", "Month", "Rupees", dataset);

		CategoryPlot plot = (CategoryPlot) barChart.getPlot();
		BarRenderer renderer = (BarRenderer) plot.getRenderer();
		renderer.setMaximumBarWidth(0.1);
		// Sets the color of the bars for the first series
		Color customColor = new Color(73, 3, 28);
		renderer.setSeriesPaint(0,customColor ); // Set solid color for the bars
		renderer.setDrawBarOutline(false); // Disable bar outlines
		renderer.setShadowVisible(false);
		OutputStream out = response.getOutputStream();
		ChartUtils.writeChartAsPNG(out, barChart, 700, 400); // Use ChartUtils instead of ChartUtilities
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
