package indhu.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indhu.niit.models.CartItem;
import indhu.niit.models.CustomerOrder;
import indhu.niit.models.User;
@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {
	@Autowired
private SessionFactory sessionFactory;

	@Override
	public boolean addToCart(CartItem cartItem) 
	{
	
		try
		{
			sessionFactory.getCurrentSession().save(cartItem);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	@Override
	public boolean deleteCartItem(CartItem cartItem) {
		
		try
		{
			sessionFactory.getCurrentSession().delete(cartItem);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	@Override
	public boolean updateCartItem(CartItem cartItem) {
	
		try
		{
			sessionFactory.getCurrentSession().update(cartItem);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}

	@Override
	public List<CartItem> listCartItems(String username) {
	
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from CartItem where username=:uname and status='NP'");
		query.setParameter("uname", username);
		List<CartItem> cartItemList=query.list();
		session.close();
		return cartItemList;
	}

	@Override
	public CartItem getCartItem(int cartItemId) {
		
		Session session=sessionFactory.openSession();
		CartItem cartItem=(CartItem) session.get(CartItem.class, cartItemId);
		session.close();
		return cartItem;
	}
	
	/*public void addToCart(CartItem cartItem) {
		Session session=sessionFactory.getCurrentSession();
		session.saveOrUpdate(cartItem);
	}
	public User getUser(String email) {
		Session session=sessionFactory.getCurrentSession();
		User user=(User)session.get(User.class,email);
		return user;
	}
	public List<CartItem> getCart(String email) {
		Session session=sessionFactory.getCurrentSession();
		//SQL - select * from cartitem where user_email=?
		//cartItem has user, user has email
		Query query=session.createQuery("from CartItem where user.email=?");
		query.setString(0, email);
		List<CartItem> cartItems=query.list();
		return cartItems;
	}
	public void removeCartItem(int cartItemId) {
		Session session=sessionFactory.getCurrentSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId);
		session.delete(cartItem);
		
		
	}
	public CustomerOrder createCustomerOrder(CustomerOrder customerOrder) {
		Session session=sessionFactory.getCurrentSession();
		session.save(customerOrder);
		//customerOrder.user -> user obj
		//user -> customer -> updated shipping address
		return customerOrder;
	}
	
	public boolean updateCart(CartItem cartitem)//quantity) 
	{
		Session session=sessionFactory.getCurrentSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, cartItemId); //quantity);
		session.update(cartItem);
		//Query query=session.createQuery("update CartItem set quantity= :quantity where cartItemId=?");
		//query.setParameter("quantity",quantity);
		
		return cartItem;
		
		try
		{
			sessionFactory.getCurrentSession().update(cartitem);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	
	}
	@Override
	public CartItem getCartById(int cartItemId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		CartItem cartitem=(CartItem) session.get(CartItem.class,cartItemId);
		session.close();
		return cartitem;
	}
	@Override
	public CartItem cartupdate(int quantity) 
	{
		Session session=sessionFactory.getCurrentSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, quantity); //quantity);
		session.update(cartItem);
		//Query query=session.createQuery("update CartItem set quantity= :quantity where cartItemId=?");
		//query.setParameter("quantity",quantity);
		
		return cartItem;
	}
*/
	
	
	
}
