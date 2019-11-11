package indhu.niit.dao;

import indhu.niit.models.OrderDetail;

public interface OrderDao
{

	public boolean payment(OrderDetail orderDetail);
	public boolean updateCartItemStatus(String username,int orderId);
}
