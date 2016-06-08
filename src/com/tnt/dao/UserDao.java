package com.tnt.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component("UserDao")
public class UserDao {
	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session() {
		return sessionFactory.getCurrentSession();
	}
	
	
	public void addUser(User user)
	{
		session().save(user);
		
	}
	
	public boolean exists(String username) {
		@SuppressWarnings("deprecation")
		Criteria crit = session().createCriteria(User.class);
		crit.add(Restrictions.idEq(username));
		User user = (User)crit.uniqueResult();
		return user != null;
	}
	
	public User getUserByName(String user_name)
	{
		@SuppressWarnings("deprecation")
		Criteria crit = session().createCriteria(User.class);
		crit.add(Restrictions.idEq(user_name));
		User user = (User)crit.uniqueResult();
		return user;
			
		
	}
	
	public void update(User user)
	{
		session().update(user);
	}
	
	

}
