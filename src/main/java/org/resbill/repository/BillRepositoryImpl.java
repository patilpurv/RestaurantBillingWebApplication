package org.resbill.repository;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.resbill.config.DBConfig;
import org.resbill.model.BillModel;
import org.resbill.model.CombineModel;

public class BillRepositoryImpl extends DBConfig implements BillRepository {

	public List<BillModel> TotalBill(String Cname) {
		List<BillModel> SpecificTable = new ArrayList<>();
		try {
			stmt = conn.prepareStatement(
					"select distinct O.oid,c.cname,O.odate,i.Iname,i.qty,i.Price,O.totalamount from customer c  inner join customerorderjoin co on c.cid=co.cid inner join orders O on co.oid=o.oid inner join Orderitemjoin oi on o.oid=oi.oid inner join items i on oi.itid=i.itid  where c.cname=?;");
			stmt.setString(1, Cname);
			
			rs = stmt.executeQuery();
			while (rs.next()) {
				BillModel bm = new BillModel();
				bm.setOid(rs.getInt(1));
				bm.setCname(rs.getString(2));
				bm.setOdate(rs.getDate(3));
				bm.setIname(rs.getString(4));
				bm.setQty(rs.getInt(5));
				bm.setPrice(rs.getInt(6));
				bm.setTotalamount(rs.getInt(7));
				SpecificTable.add(bm);	
				
			}
			//this.billDetails(Cname);
			
			return SpecificTable.size() > 0 ? SpecificTable : null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	
	public void billDetails(String str)
	{
		try {
			stmt = conn.prepareStatement("insert into BillDetails (ttid,ccid,name,oodate,amount)select distinct T.Tid,c.cid,c.cname,O.odate,O.totalamount from dtable T inner join customertablejoin ct on T.tid=ct.Tid inner join customer c on ct.cid=c.cid inner join customerorderjoin co on c.cid=co.cid inner join orders O on co.oid=o.oid where c.cname=?");
			stmt.setString(1,str);
			if(stmt.executeUpdate()>0)
				{
				 System.out.println("inserted into bill details");
				}
		}
		catch(Exception ex)
		{
			System.out.println("error in billdetails method"+ex);
			
		}
		
	}
    
}
