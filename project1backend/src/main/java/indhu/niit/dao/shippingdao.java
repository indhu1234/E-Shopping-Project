package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.CartItem;
import indhu.niit.models.ShippingAddress;
import indhu.niit.models.UserDetail;

public interface shippingdao
{
		public boolean addshipping(ShippingAddress address);
		public List<ShippingAddress> listAddress();
		public ShippingAddress getAddressById(int id);
		public boolean updateAddress(ShippingAddress address);
		public ShippingAddress getAddressbyuser(String username);
		
}
