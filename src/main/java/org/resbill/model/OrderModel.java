package org.resbill.model;

import java.sql.Date;

public class OrderModel {
	private int Oid;
	private Date Odate;
	private int price;
	private String month;
	private int year;

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getOid() {
		return Oid;
	}

	public void setOid(int oid) {
		Oid = oid;
	}

	public java.sql.Date getDate() {
		return Odate;
	}

	public void setDate(Date Odate) {
		this.Odate = Odate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
