package org.resbill.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.resbill.services.*;
import org.resbill.model.OrderModel;
import org.resbill.model.customermodel;

@WebServlet("/customer")
public class customer extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		final Pattern NAME_PATTERN = Pattern.compile("^[a-zA-Z\\s]+$");
		final Pattern CONTACT_PATTERN = Pattern.compile("^[6-9]{1}\\d{9}$");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		customermodel cmodel = new customermodel();
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
        
		HttpSession session = request.getSession();
		if (!NAME_PATTERN.matcher(name).matches()) {
			request.setAttribute("errorMessage", "Invalid name. Only letters are allowed.");
			forwardToForm(request, response);
			return;
		}

		if (!CONTACT_PATTERN.matcher(contact).matches()) {
			request.setAttribute("errorMessage", "Invalid Mobile Number. It should be a 10-digit number.");
			forwardToForm(request, response);
			return;
		}
		int tid = Integer.parseInt(request.getParameter("tid"));
		int Oid = Integer.parseInt(request.getParameter("Oid"));

		cmodel.setName(name);
		cmodel.setContact(contact);

		customerservice cservice = new customerserviceImpl();
		boolean b = cservice.isCustomerAdd(cmodel, tid);

		if (b) {
			request.setAttribute("successMessage", "Customer added successfully");

			session.setAttribute("customer", name);
			session.setAttribute("Oid", Oid);
			RequestDispatcher rd = request.getRequestDispatcher("Order.jsp");
			rd.forward(request, response);
		} else {
			request.setAttribute("successMessage", "Failed to add customer");
			RequestDispatcher r = request.getRequestDispatcher("AddCustomer.jsp");
			r.include(request, response);
		}
	}

	private void forwardToForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("AddCustomer.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}

//with onload method() to body for pop up message
