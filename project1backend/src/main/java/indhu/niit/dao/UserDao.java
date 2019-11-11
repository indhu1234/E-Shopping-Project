package indhu.niit.dao;

import java.util.List;

import indhu.niit.models.UserDetail;

public interface UserDao 
{
	public boolean addUserDetail(UserDetail userdetail);
	public boolean deleteUserDetail(UserDetail userdetail);
	public boolean updateUserDetail(UserDetail userdetail);
	public List<UserDetail> listUserDetails();
	public UserDetail getUser(String username);
	public boolean registerUser(UserDetail userdetail);

}
