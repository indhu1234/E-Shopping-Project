package indhu.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indhu.niit.models.ShippingAddress;
import indhu.niit.models.UserDetail;
@Repository("shippingdao")
@Transactional
public class shippingdaoimpl implements shippingdao 
{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addshipping(ShippingAddress address) 
	{
		try {
			sessionFactory.getCurrentSession().save(address);
			return true;
		}
		catch(Exception e) {
			return false;
		}
		
	}

	@Override
	public List<ShippingAddress> listAddress() {
		
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from ShippingAddress");
		List<ShippingAddress> Listaddress=query.list();
		session.close();
		return Listaddress;
	}

}
