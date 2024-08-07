package org.resbill.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.resbill.services.*;

@WebServlet("/Deletetable")
public class Deletetable extends HttpServlet {

	tableService tservice = new tableServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int tid = Integer.parseInt(request.getParameter("tid"));

		boolean b = tservice.istabledeletebyID(tid);
		if (b) {
			RequestDispatcher r = request.getRequestDispatcher("ViewTable.jsp");
			r.forward(request, response);
		} else {
			out.println("Table not get deleted");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
