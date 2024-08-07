package org.resbill.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.resbill.model.customermodel;
import org.resbill.services.*;

@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	customerservice cService = new customerserviceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String Cname = (request.getParameter("cname"));

		boolean b = cService.isdeletecustomerbyID(Cname);
		if (b) {
			RequestDispatcher rd = request.getRequestDispatcher("ViewCustomer.jsp");
			rd.forward(request, response);
		} else {
			out.println("customer not get deleted");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
