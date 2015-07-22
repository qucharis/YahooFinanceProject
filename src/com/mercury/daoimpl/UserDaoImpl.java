package com.mercury.daoimpl;

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
	public void save(User user) {
		// TODO Auto-generated method stub
		template.save(user);
	}

	@Override
	public User getUserById(int userId) {
		// TODO Auto-generated method stub
		return (User)template.get(User.class, userId);
	}

	@Override
	public User getUserByUsername(String userName) {
		// TODO Auto-generated method stub
		String hql = "from User where userName =" + userName;
		return (User) template.find(hql).get(0);
	}

}
