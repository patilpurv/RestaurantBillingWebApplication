package org.resbill.services;

import java.util.List;

import org.resbill.model.BillModel;
import org.resbill.repository.BillRepository;
import org.resbill.repository.BillRepositoryImpl;

public class BillServiceImpl implements BillService {

	BillRepository bRepo = new BillRepositoryImpl();

	public List<BillModel> TotalBill(String Cname) {
		return bRepo.TotalBill(Cname);
	}

}
