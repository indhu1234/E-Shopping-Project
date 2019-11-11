package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.CartItem;
import indhu.niit.models.CustomerOrder;
import indhu.niit.models.User;

public interface CartItemDao 
{
/*void addToCart(CartItem cartItem);
User getUser(String email);
List<CartItem> getCart(String email);//select * from cartitem where user_email=?
CartItem getCartById(int cartItemId);
void removeCartItem(int cartItemId);
CartItem updateCart(int quantity);
boolean updateCart(CartItem cartitem);
CartItem cartupdate(int quantity);
CustomerOrder createCustomerOrder(CustomerOrder customerOrder);
*/
	public boolean addToCart(CartItem cartItem);
	public boolean deleteCartItem(CartItem cartItem);
	public boolean updateCartItem(CartItem cartItem);
	public List<CartItem> listCartItems(String username);
	public CartItem getCartItem(int cartItemId);
}
