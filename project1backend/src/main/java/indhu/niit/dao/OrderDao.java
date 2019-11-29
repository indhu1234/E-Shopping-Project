package indhu.niit.dao;

import indhu.niit.models.OrderDetail;
import indhu.niit.models.UserDetail;

public interface OrderDao
{
	public OrderDetail getOrder(int orderid);
	public boolean payment(OrderDetail orderDetail);
	public boolean updateCartItemStatus(String username,int orderId);
	public boolean updateOrder(OrderDetail orderdetail);
	
}
