package org.resbill.services;

import java.util.List;

import org.resbill.model.BillModel;

public interface BillService {
	public List<BillModel> TotalBill(String Cname);
}
