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
import org.resbill.model.tablemodel;

@WebServlet("/AddTable")
public class AddTable extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int tid = Integer.parseInt(request.getParameter("tid"));

		String ttype = request.getParameter("ttype");
		String status = request.getParameter("status");
		tablemodel tmodel = new tablemodel();
		tableService tservice = new tableServiceImpl();
		tmodel.setTid(tid);
		tmodel.setTtype(ttype);
		tmodel.setStatus(status);
		boolean b = tservice.isAddtable(tmodel);
		if (b) {
			request.setAttribute("msg", "Registered");
		} else {
			request.setAttribute("msg", "Failed");
		}
		RequestDispatcher r = request.getRequestDispatcher("AddTable.jsp");
		r.include(request, response);
		// System.out.println(" ");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

//
//
