package org.resbill.services;

import java.util.List;

import org.resbill.model.ItemModel;
import org.resbill.model.OrderModel;

public interface ItemService {

	public boolean isItemAdd(ItemModel imodel);

	public boolean isOrderAdd(OrderModel omodel);

	public int setToatlInorder(ItemModel imodel, int Oid);

	public boolean orderitemjoin(int Oid, int Itid);

	public int getSpecificOrder(int checkOrderId);

	public void CustomerorderJoin(int cid, int oid);

	public List<OrderModel> getDatewiseCollection();

	public List<OrderModel> getMonthlyCollection();

	public List<OrderModel> getDailyOrders();

	public List<ItemModel> getorderItems(String cname);
	
	public List<OrderModel> searchbydate(int d,int m,int y);

}
