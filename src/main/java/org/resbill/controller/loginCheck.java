package org.resbill.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.resbill.repository.LoginRepository;

/**
 * Servlet implementation class loginCheck
 */
@WebServlet("/loginCheck")
public class loginCheck extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String u = request.getParameter("user");
		String p = request.getParameter("pass");
		// out.println(u);
		// out.println(p);
		// out.println("enter in servlet");

		LoginRepository lRepo = new LoginRepository();
		boolean b = lRepo.verifyAdmin(u, p);
		if (b) {
			HttpSession session = request.getSession(true);
			session.setAttribute("u", u);
			response.sendRedirect("Dashboard.jsp");
		} else {
			request.setAttribute("loginFailed", true);
			RequestDispatcher r = request.getRequestDispatcher("Login.jsp");
			r.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

}
