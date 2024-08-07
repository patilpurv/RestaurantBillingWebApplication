package org.resbill.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.resbill.config.DBConfig;
import org.resbill.model.tablemodel;

public class tableRepositoryImpl extends DBConfig implements tableRepository {

	@Override
	public boolean isAddtable(tablemodel tmodel) {
		// TODO Auto-generated method stub
		try {
			stmt = conn.prepareStatement("insert into dtable values (?,?,?)");
			stmt.setInt(1, tmodel.getTid());
			stmt.setString(2, tmodel.getTtype());
			stmt.setString(3, tmodel.getStatus());
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("error in table repo");
			return false;
		}

	}

	@Override
	public List viewTable() {
		// TODO Auto-generated method stub
		try {
			List list = new ArrayList();
			stmt = conn.prepareStatement("select * from dtable");
			rs = stmt.executeQuery();
			while (rs.next()) {
				tablemodel tmodel = new tablemodel();
				tmodel.setTid(rs.getInt(1));
				tmodel.setTtype(rs.getString(2));
				tmodel.setStatus(rs.getString(3));
				list.add(tmodel);
			}
			return list.size() > 0 ? list : null;

		} catch (Exception ex) {
			System.out.println("error in table repo" + ex);
			return null;
		}

	}

	@Override
	public boolean istabledeletebyID(int tid) {
		// TODO Auto-generated method stub
		try {
			stmt = conn.prepareStatement("delete from dtable where tid=?");
			stmt.setInt(1, tid);
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception ex) {
			System.out.println("error in delete table " + ex);
			return false;
		}

	}

	@Override
	public boolean istableupdatebyID(int tid) {
		try {
			// System.out.println(tmodel.getStatus()+" "+tmodel.getTid());
			stmt = conn.prepareStatement("update dtable set status='available' where tid=?");
			stmt.setInt(1,tid);
			int value = stmt.executeUpdate();
			return value > 0 ? true : false;

		} catch (Exception ex) {
			System.out.println("error in update table" + ex);
			return false;
		}
	}

}
