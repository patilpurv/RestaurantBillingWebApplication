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
import org.resbill.model.ItemModel;
import org.resbill.model.OrderModel;
import org.resbill.repository.ItemRepositoryImpl;
import org.resbill.services.*;

@WebServlet("/Orders")
public class Orders extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("customer");
		String iname = request.getParameter("Item1");
		int qty = Integer.parseInt(request.getParameter("Qty"));

		ItemService iservice = new ItemServiceImpl();
		ItemRepositoryImpl iRepo = new ItemRepositoryImpl();

		int Cid = iRepo.getCidbyCname(name);
		boolean b = iRepo.isCidPresent(Cid);

		ItemModel imodel = new ItemModel();
		imodel.setIname(iname);
		imodel.setQty(qty);

		iservice.isItemAdd(imodel);
		int itid = imodel.getItid();

		int Oid = (int) session.getAttribute("Oid");
    //    out.println(Oid);
		OrderModel omodel = new OrderModel();
		omodel.setOid(Oid);
//         int a=omodel.getOid();
//         out.println("setter "+a);
		iservice.isOrderAdd(omodel);
		//out.println(Oid);
		iservice.orderitemjoin(Oid, itid);
		iservice.setToatlInorder(imodel, Oid);
		iservice.CustomerorderJoin(Cid, Oid);
		RequestDispatcher rd = request.getRequestDispatcher("Order.jsp");
		rd.include(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}