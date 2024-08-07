package org.resbill.repository;

import java.util.List;

import org.resbill.model.customermodel;

public interface customerRepository {
	boolean isCustomerAdd(customermodel cmodel, int tid);

	public List Viewcustomer();

	boolean isdeletecustomerbyID(String cname);

}
