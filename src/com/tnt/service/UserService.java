package com.tnt.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tnt.dao.User;
import com.tnt.dao.UserDao;

@Service("UserService")
public class UserService {

	private UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public boolean exists(User user)
	{
		String user_name = user.getUsername();
		
		return userDao.exists(user_name);
		
		
	}

	public boolean addUser(User user) {
		
		
		boolean exist = exists(user);
		
		if(!exist) //not existing ! 
		{
			userDao.addUser(user);
			return true;
			
		}
		else
		{
			return false;
		}
		
	}

	public User getUserByName(String user_name) {
		// TODO Auto-generated method stub
		return userDao.getUserByName(user_name);
	}
	
}
