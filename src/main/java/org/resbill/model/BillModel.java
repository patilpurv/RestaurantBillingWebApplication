package org.resbill.model;

import java.sql.Date;

public class BillModel {

	private String Cname;
	private int Oid;
	private Date Odate;
	private String Iname;
	private int qty;
	private int price;

	public String getIname() {
		return Iname;
	}

	public void setIname(String iname) {
		Iname = iname;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	private int Totalamount;

	public String getCname() {
		return Cname;
	}

	public void setCname(String cname) {
		Cname = cname;
	}

	public int getOid() {
		return Oid;
	}

	public void setOid(int oid) {
		Oid = oid;
	}

	public Date getOdate() {
		return Odate;
	}

	public void setOdate(Date odate) {
		Odate = odate;
	}

	public int getTotalamount() {
		return Totalamount;
	}

	public void setTotalamount(int totalamount) {
		Totalamount = totalamount;
	}

}
