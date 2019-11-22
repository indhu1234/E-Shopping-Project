package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.ShippingAddress;
import indhu.niit.models.UserDetail;

public interface shippingdao
{
		public boolean addshipping(ShippingAddress address);
		public List<ShippingAddress> listAddress();
}
