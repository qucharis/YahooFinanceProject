package com.mercury.daoimpl;

<<<<<<< HEAD
=======
import java.util.List;

>>>>>>> pr/18
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.mercury.beans.User;
import com.mercury.daos.UserDao;

public class UserDaoImpl implements UserDao {
	private HibernateTemplate template;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		template = new HibernateTemplate(sessionFactory);
	}
	
	@Override
<<<<<<< HEAD
	public void save(User user) {
=======
	public void addUser(User user) {
>>>>>>> pr/18
		// TODO Auto-generated method stub
		template.save(user);
	}

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
<<<<<<< HEAD
		return (User)template.load(User.class, userId);
=======
		return (User)template.get(User.class, userId);
>>>>>>> pr/18
	}

	@Override
	public User getUserByUsername(String userName) {
		// TODO Auto-generated method stub
<<<<<<< HEAD
		String hql = "from User where userName =" + userName;
		return (User) template.find(hql).get(0);
=======
		String hql = "from User as user where user.userName ='" + userName + "'";
		@SuppressWarnings("unchecked")
		List<User> users = template.find(hql);
		return users.get(0);
>>>>>>> pr/18
	}

}
