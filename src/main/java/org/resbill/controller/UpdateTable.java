package org.resbill.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.resbill.model.tablemodel;
import org.resbill.services.tableService;
import org.resbill.services.tableServiceImpl;

@WebServlet("/UpdateTable")
public class UpdateTable extends HttpServlet {

	tableService tservice = new tableServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int tid = Integer.parseInt(request.getParameter("tid"));
		boolean b=tservice.istableupdatebyID(tid);
		if(b)
		{
			RequestDispatcher r = request.getRequestDispatcher("ViewTable.jsp");
			r.forward(request, response);
		}else
		{
			System.out.println("Table not get updated");
		}
//		String status = request.getParameter("status");
//		RequestDispatcher r = request.getRequestDispatcher("Dashboard.jsp");
//		r.include(request, response);
//
//		out.println("<div class='container'>");
//		out.println("<form class='form-1' name='frm' action='' method='post'>");
//		out.println("<centre>");
//		out.println("<input type='hidden' name='newtid' value='" + tid + "'><br><br>");
//		out.println("<input type='text' name='newstatus' value='" + status + "'><br><br>");
//		out.println("<input type='submit' name='s' value='update table'>");
//		out.println("<centre>");
//		out.println("</div></div></div>");
//
//		String str = request.getParameter("s");
//		if (str != null) {
//			int newtid = Integer.parseInt(request.getParameter("newtid"));
//			String newstatus = request.getParameter("newstatus");
////out.println(status);
//			tablemodel tmodel = new tablemodel();
//			tmodel.setTid(newtid);
//			tmodel.setStatus(newstatus);
//			boolean b = tservice.istableupdatebyID(tmodel);
//			if (b) {
//				RequestDispatcher rd = request.getRequestDispatcher("ViewTable.jsp");
//				rd.forward(request, response);
//			}
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
