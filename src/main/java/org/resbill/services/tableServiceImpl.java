package org.resbill.services;

import java.util.List;

import org.resbill.model.tablemodel;
import org.resbill.repository.*;

public class tableServiceImpl implements tableService {
	tableRepository tRepo = new tableRepositoryImpl();

	@Override
	public boolean isAddtable(tablemodel tmodel) {
		// TODO Auto-generated method stub
		return tRepo.isAddtable(tmodel);
	}

	public List viewTable() {
		return tRepo.viewTable();
	}

	@Override
	public boolean istabledeletebyID(int tid) {
		// TODO Auto-generated method stub
		return tRepo.istabledeletebyID(tid);
	}

	@Override
	public boolean istableupdatebyID(int tid) {
		// TODO Auto-generated method stub
		return tRepo.istableupdatebyID(tid);
	}

}
