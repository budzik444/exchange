package com.tnt.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Component("BankDao")
public class BankDao {

	
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session session() {
		return sessionFactory.getCurrentSession();
	}
		
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<BankBalance> getBalances() {
		return session().createQuery("from BankBalance").list();
	}
	
	public void save(BankBalance bank)
	{
		session().save(bank);
		
	}
	
	public void update(BankBalance bank)
	{
		session().update(bank);
		
	}
	
	
}
