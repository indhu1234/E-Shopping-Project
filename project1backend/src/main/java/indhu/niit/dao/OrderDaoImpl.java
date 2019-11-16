package indhu.niit.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indhu.niit.models.OrderDetail;

@Repository("OrderDao")
@Transactional
public class OrderDaoImpl implements OrderDao
{
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public boolean payment(OrderDetail orderDetail) {
		try
		{
			sessionFactory.getCurrentSession().save(orderDetail);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}

	}

	@Override
	public boolean updateCartItemStatus(String username, int orderId) {
		
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update CartItem set status='P',orderId=:ordId where username=:uname and status='NP'");
		query.setParameter("ordId",orderId);
		query.setParameter("uname", username);
		
		int row_eff=query.executeUpdate();
		
		if(row_eff>0)
			return true;
		else
			return false;
	}

}
