package org.resbill.repository;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.resbill.config.DBConfig;
import org.resbill.model.ItemModel;
import org.resbill.model.OrderModel;

public class ItemRepositoryImpl extends DBConfig implements ItemRepository {
	int itid = 0;
	int Oid = 0;

	public int maualItid() {
		try {
			stmt = conn.prepareStatement("select max(Itid)from items");
			rs = stmt.executeQuery();
			while (rs.next()) {
				itid = rs.getInt(1);
				++itid;
			}
			return itid;
		} catch (Exception ex) {
			System.out.println(ex);
			return 0;
		}

	}

	public int maualOid() {
		try {
			stmt = conn.prepareStatement("select max(Oid)from orders");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Oid = rs.getInt(1);
				++Oid;
			}
			return Oid;
		} catch (Exception ex) {
			System.out.println(ex);
			return 0;
		}

	}

	public int findPriceofItem(String Iname, int qty) {
		int price = 0;
		try {
			stmt = conn.prepareStatement("select price from menu where Mname=?");
			stmt.setString(1, Iname);
			rs = stmt.executeQuery();
			while (rs.next()) {
				price = rs.getInt(1);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}
		int total = price * qty;
		return total;

	}

	public boolean isItemAdd(ItemModel imodel) {
		try {
			int total = this.findPriceofItem(imodel.getIname(), imodel.getQty());
			int itid = this.maualItid();
			if (total != 0 && itid != 0) {
				stmt = conn.prepareStatement("insert into items values(?,?,?,?)");
				stmt.setInt(1, itid);
				imodel.setItid(itid);
				stmt.setString(2, imodel.getIname());
				stmt.setInt(3, total);
				stmt.setInt(4, imodel.getQty());
				return stmt.executeUpdate() > 0 ? true : false;
			} else {
				System.out.println("Not able to fetch price from menu");
				return false;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean isOrderAdd(OrderModel omodel) {
		System.out.println("==+++="+omodel.getOid());
		try {
			stmt = conn.prepareStatement("insert into orders(Oid,totalamount) values(?,'0')");
			stmt.setInt(1, omodel.getOid());
			System.out.println("==="+omodel.getOid());
			return stmt.executeUpdate() > 0 ? true : false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	public int getTotalpriceoforder(ItemModel imodel, int Oid) {
		int total = 0;
		// stmt=conn.prepareStatement("select sum()");
		try {
			stmt = conn.prepareStatement(
					"select sum(i.price) from items i inner join orderitemjoin oj on i.Itid=oj.Itid inner join orders o on oj.Oid=o.Oid where oj.Oid=?;");
			stmt.setInt(1, Oid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
			return total;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}

	public int setToatlInorder(ItemModel imodel, int Oid) {
		try {
			int total = this.getTotalpriceoforder(imodel, Oid);
			if (total != 0) {
				stmt = conn.prepareStatement("update orders set TotalAmount=? where Oid=?");
				stmt.setInt(1, total);
				stmt.setInt(2, Oid);
				return stmt.executeUpdate() > 0 ? total : 0;
			} else {
				System.out.println("Total not get calculated in getTotalofOrder");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	public boolean orderitemjoin(int Oid, int Itid) {
		try {

			stmt = conn.prepareStatement("insert into orderitemjoin values(?,?)");
			stmt.setInt(1, Oid);
			stmt.setInt(2, Itid);

			return stmt.executeUpdate() > 0 ? true : false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public List<OrderModel> getUniqueOrderList() {
		List<OrderModel> uOrderList = new ArrayList();
		try {
			stmt = conn.prepareStatement("select Odate from orders  group by Odate order by Odate desc");
			rs = stmt.executeQuery();
			while (rs.next()) {
				OrderModel omodel = new OrderModel();

				omodel.setDate(rs.getDate(1));

				uOrderList.add(omodel);
			}
			return uOrderList.size() > 0 ? uOrderList : null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	public List<OrderModel> getAllOrderList() {
		List<OrderModel> OrderList = new ArrayList();
		try {
			stmt = conn.prepareStatement("select * from orders order by Odate desc");
			rs = stmt.executeQuery();
			while (rs.next()) {
				OrderModel omodel = new OrderModel();
				omodel.setOid(rs.getInt(1));
				omodel.setDate(rs.getDate(2));
				omodel.setPrice(rs.getInt(3));
				OrderList.add(omodel);
			}
			return OrderList.size() > 0 ? OrderList : null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public int getSpecificOrder(int checkOrderId) {

		int TotalAmount = 0;
		try {
			stmt = conn.prepareStatement("select TotalAmount from orders where Oid=?");
			stmt.setInt(1, checkOrderId);
			rs = stmt.executeQuery();
			while (rs.next()) {
				TotalAmount = rs.getInt(1);
			}
			return TotalAmount;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return 0;
	}

	public void CustomerorderJoin(int Cid, int Oid) {
		try {

			stmt = conn.prepareStatement("insert into customerorderjoin values(?,?)");
			stmt.setInt(1, Cid);
			stmt.setInt(2, Oid);
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public List<ItemModel> getorderItems(String Cname) {
		int cid = 0, oid = 0;
		List<ItemModel> itemList = new ArrayList();
		try {
			stmt = conn.prepareStatement("select cid from customer where cname=?");
			stmt.setString(1, Cname);
			rs = stmt.executeQuery();
			while (rs.next()) {
				cid = rs.getInt(1);
			}
			stmt = conn.prepareStatement("select oid from customerorderjoin where cid=?");
			stmt.setInt(1, cid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				oid = rs.getInt(1);
			}
			stmt = conn.prepareStatement(
					"select Iname,qty,price from items i inner join orderitemjoin o on i.itid=o.itid where oid=?");
			stmt.setInt(1, oid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				ItemModel imodel1 = new ItemModel();
				imodel1.setIname(rs.getString(1));
				imodel1.setQty(rs.getInt(2));
				imodel1.setPrice(rs.getInt(3));
				itemList.add(imodel1);
			}
			return itemList.size() > 0 ? itemList : null;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<OrderModel> getMonthlyCollection() {
		// TODO Auto-generated method stub

		List<OrderModel> list = new ArrayList();
		try {
			stmt = conn.prepareStatement(
					"select monthname(Odate),year(Odate),sum(totalamount) from orders group by year(Odate),monthname(Odate) order by year(Odate) desc,monthname(Odate)desc ");
			rs = stmt.executeQuery();
			while (rs.next()) {
				OrderModel o = new OrderModel();
				o.setMonth(rs.getString(1));
				o.setYear(rs.getInt(2));
				o.setPrice(rs.getInt(3));
				list.add(o);
				//System.out.println(o.getMonth());
			}
			System.out.println();
			return list.size() > 0 ? list : null;
		} catch (Exception ex) {
			System.out.println(ex + "error in ItemRepo");
			return null;
		}

	}

	@Override
	public int getCidbyCname(String cname) {
		// TODO Auto-generated method stub
		try {
			int cid = 0;
			stmt = conn.prepareStatement("select cid from customer where cname=?");
			stmt.setString(1, cname);
			rs = stmt.executeQuery();
			while (rs.next()) {
				cid = rs.getInt(1);
			}
			return cid;
		} catch (Exception ex) {
			System.out.println("error in getCidbyname" + ex);
			return 0;
		}

	}

	public boolean isCidPresent(int Cid) {
		try {
			stmt = conn.prepareStatement("select Cid from customer where Cid=?");
			stmt.setInt(1, Cid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Cid = rs.getInt(1);
			}
			return Cid > 0 ? true : false;
		} catch (SQLException e) {
			System.out.println("error inisCidpresent" + e);
			return false;
		}

	}

	public int maxOidPresent() {
		int Oid = 0;
		try {
			stmt = conn.prepareStatement("select max(Oid) from orders");
			rs = stmt.executeQuery();
			while (rs.next()) {
				Oid = rs.getInt(1);
			}
			return Oid;
		} catch (Exception ex) {
			System.out.println("error in maxoid" + ex);
			return 0;
		}

	}

	@Override
	public List<OrderModel> searchbydate(int d, int m, int y) {
		// TODO Auto-generated method stub
		
		List<OrderModel> list=new ArrayList<OrderModel>();
		try
		{
			stmt=conn.prepareStatement("select monthname(Odate),year(Odate),sum(totalamount) from orders where  month(Odate)=? && year(Odate)=? group by year(Odate),monthname(Odate) order by year(Odate) desc  ");
		    //stmt.setInt(1, d);
		    stmt.setInt(1, m);
		    stmt.setInt(2, y);
		    rs=stmt.executeQuery();
		    while(rs.next())
		    {
		    	OrderModel o=new OrderModel();
		    	o.setMonth(rs.getString(1));
				o.setYear(rs.getInt(2));
				o.setPrice(rs.getInt(3));
				list.add(o);
		    }
		    return list.size()>0?list:null;
		}
		catch(Exception ex)
		{
			System.out.println("error in searchmonthrepo"+ex);
			return null;
		}
		
	}
	
	
}

//select sum(o.totalamount) from orders o inner join customerorderjoin cj on o.oid=cj.oid inner join customer c on cj.cid=c.cid where c.cid=1068;
