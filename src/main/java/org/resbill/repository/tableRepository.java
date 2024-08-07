package org.resbill.repository;

import java.util.List;

import org.resbill.model.tablemodel;

public interface tableRepository {

	boolean isAddtable(tablemodel tmodel);

	public List viewTable();

	public boolean istabledeletebyID(int tid);

	public boolean istableupdatebyID(int tid);

}
