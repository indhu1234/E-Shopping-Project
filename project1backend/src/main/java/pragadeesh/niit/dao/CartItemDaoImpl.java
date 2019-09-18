package pragadeesh.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pragadeesh.niit.models.CartItem;
import pragadeesh.niit.models.CustomerOrder;
import pragadeesh.niit.models.User;
@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {
	@Autowired
private SessionFactory sessionFactory;
	public void addToCart(CartItem cartItem) {
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
	
	public CartItem updateCart(int quantity) 
	{
		Session session=sessionFactory.getCurrentSession();
		CartItem cartItem=(CartItem)session.get(CartItem.class, quantity);
		//session.update(cartItem);
		Query query=session.createQuery("update CartItem set quantity= :quantity where cartItemId=?");
		query.setParameter("quantity",quantity);
		return cartItem;
			
	
	}
	@Override
	public CartItem getCartById(int cartItemId) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		CartItem cartitem=(CartItem) session.get(CartItem.class,cartItemId);
		session.close();
		return cartitem;
	}

}
