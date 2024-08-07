package org.resbill.repository;

import java.util.List;

import org.resbill.model.ItemModel;
import org.resbill.model.OrderModel;

public interface ItemRepository {
	public int findPriceofItem(String Iname, int qty);

	public boolean isItemAdd(ItemModel imodel);

	public boolean isOrderAdd(OrderModel omodel);

	public int getTotalpriceoforder(ItemModel imodel, int Oid);

	public int setToatlInorder(ItemModel imodel, int Oid);

	public boolean orderitemjoin(int Oid, int Itid);

	public List<OrderModel> getUniqueOrderList();

	public List<OrderModel> getAllOrderList();

	public List<OrderModel> getMonthlyCollection();

	public int getSpecificOrder(int checkOrderId);

	public void CustomerorderJoin(int cid, int oid);

	public List<ItemModel> getorderItems(String cname);

	public int getCidbyCname(String cname);
	
	public List<OrderModel> searchbydate(int d,int m,int y);
}
