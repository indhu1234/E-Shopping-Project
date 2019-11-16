package indhu.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import indhu.niit.models.UserDetail;

@Repository("userDAO")
@Transactional
public class UserDaoImpl implements UserDao
{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addUserDetail(UserDetail userdetail) {
		
		try {
			sessionFactory.getCurrentSession().save(userdetail);
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}

	@Override
	public boolean deleteUserDetail(UserDetail userdetail)
	{
		try {
			sessionFactory.getCurrentSession().delete(userdetail);
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateUserDetail(UserDetail userdetail) 
	{
	
		try {
			sessionFactory.getCurrentSession().update(userdetail);
			return true;
		}
		catch(Exception e) {
			return false;
		}
	}

	@Override
	public List<UserDetail> listUserDetails() {
		
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from UserDetail");
		List<UserDetail> ListUserDetails=query.list();
		session.close();
		return ListUserDetails;
	}

	@Override
	public UserDetail getUser(String username)
	{
	
		Session session=sessionFactory.openSession();
		UserDetail userdetail=(UserDetail) session.get(UserDetail.class, username);
		session.close();
		return userdetail;
	}

	@Override
	public boolean registerUser(UserDetail userdetail) {
		
		try
		{
			sessionFactory.getCurrentSession().save(userdetail);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

}
