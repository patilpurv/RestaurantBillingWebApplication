package org.resbill.model;

import java.sql.Date;

public class CombineModel {

	private int ttid;
	private int ccid;
	private int ooid;
	private Date oodate;
	private String name;
	private int amount;
	public int getTtid() {
		return ttid;
	}
	public void setTtid(int ttid) {
		this.ttid = ttid;
	}
	public int getCcid() {
		return ccid;
	}
	public void setCcid(int ccid) {
		this.ccid = ccid;
	}
	public int getOoid() {
		return ooid;
	}
	public void setOoid(int ooid) {
		this.ooid = ooid;
	}
	public Date getOodate() {
		return oodate;
	}
	public void setOodate(Date oodate) {
		this.oodate = oodate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
