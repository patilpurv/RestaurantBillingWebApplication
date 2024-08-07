package org.resbill.services;

import java.util.List;

import org.resbill.model.customermodel;
import org.resbill.repository.*;

public class customerserviceImpl implements customerservice {
	customerRepository cRepo = new customerRepositoryImpl();

	@Override
	public boolean isCustomerAdd(customermodel cmodel, int tid) {
		// TODO Auto-generated method stub
		return cRepo.isCustomerAdd(cmodel, tid);
	}

	public List Viewcustomer() {
		// TODO Auto-generated method stub
		return cRepo.Viewcustomer();
	}

	public boolean isdeletecustomerbyID(String cname) {
		// TODO Auto-generated method stub
		return cRepo.isdeletecustomerbyID(cname);
	}

}
