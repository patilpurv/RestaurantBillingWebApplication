package org.resbill.services;

import java.util.ArrayList;
import java.util.List;

import org.resbill.model.ItemModel;
import org.resbill.model.OrderModel;
import org.resbill.repository.ItemRepository;
import org.resbill.repository.ItemRepositoryImpl;

public class ItemServiceImpl implements ItemService {

	ItemRepository iRepo = new ItemRepositoryImpl();

	public boolean isItemAdd(ItemModel imodel) {
		return iRepo.isItemAdd(imodel) ? true : false;
	}

	public boolean isOrderAdd(OrderModel omodel) {
		return iRepo.isOrderAdd(omodel) ? true : false;
	}

	public boolean orderitemjoin(int Oid, int Itid) {
		return iRepo.orderitemjoin(Oid, Itid) ? true : false;
	}

	public int setToatlInorder(ItemModel imodel, int Oid) {
		return iRepo.setToatlInorder(imodel, Oid);
	}

	public List<OrderModel> getDatewiseCollection() {

		List<OrderModel> uOrderList = iRepo.getUniqueOrderList();

		List<OrderModel> OrderList = iRepo.getAllOrderList();
		List<OrderModel> clist = new ArrayList();
		int TotalAllOver = 0;
		// System.out.println("Date-Wise TotalDailyCollection");
		for (OrderModel om : uOrderList) {

			OrderModel o = new OrderModel();
			int TotalDaily = 0;
			for (OrderModel om1 : OrderList) {
				// System.out.println("jj");
				if (om.getDate().equals(om1.getDate())) {
					// System.out.println("ii");
					TotalDaily = TotalDaily + om1.getPrice();
					TotalAllOver = TotalAllOver + TotalDaily;
				}

			}
			o.setDate(om.getDate());
			o.setPrice(TotalDaily);
			clist.add(o);
			// System.out.println(om.getDate()+"---->"+TotalDaily);

		}
		return clist.size() > 0 ? clist : null;
	}

	public int getSpecificOrder(int checkOrderId) {

		return iRepo.getSpecificOrder(checkOrderId);
	}

	public List<OrderModel> getDailyOrders() {
		return iRepo.getAllOrderList();
	}

	public void CustomerorderJoin(int Cid, int Oid) {
		iRepo.CustomerorderJoin(Cid, Oid);
	}

	public List<ItemModel> getorderItems(String Cname) {
		return iRepo.getorderItems(Cname);
	}

	@Override
	public List<OrderModel> getMonthlyCollection() {
		// TODO Auto-generated method stub
		return iRepo.getMonthlyCollection();
	}

	private int ooid;

	public void setOid(int ooid) {
		ooid = this.ooid;
	}

	public int getOid() {
		return ooid;
	}

	@Override
	public List<OrderModel> searchbydate(int d, int m, int y) {
		// TODO Auto-generated method stub
		return iRepo.searchbydate(d, m, y);
	}
}
