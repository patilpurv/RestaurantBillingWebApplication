package org.resbill.services;

import java.util.List;

import org.resbill.model.customermodel;

public interface customerservice {

	boolean isCustomerAdd(customermodel cmodel, int tid);

	public List Viewcustomer();

	boolean isdeletecustomerbyID(String cname);
}
