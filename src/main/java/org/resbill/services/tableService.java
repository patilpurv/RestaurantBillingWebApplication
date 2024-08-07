package org.resbill.services;

import java.util.List;

import org.resbill.model.tablemodel;

public interface tableService {
	boolean isAddtable(tablemodel tmodel);

	public List<tablemodel> viewTable();

	public boolean istabledeletebyID(int tid);

	public boolean istableupdatebyID(int tid);
	
	
}
