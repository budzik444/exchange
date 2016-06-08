package com.tnt.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tnt.dao.User;
import com.tnt.service.UserService;

@Controller
public class LoginController {
	
		
	private UserService userService;
	
	
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	
	@RequestMapping("/denied")
	public String showDenied() {
		return "denied";
	}
	
	
	
	@RequestMapping("/createUser")
	public String createUser() {
		
		
		return "createUser";
	}
	
	@RequestMapping("/doCreate")
	public String doCreate(Model model, User user) {
		
		//test
		boolean succ = userService.addUser(user);
		
		if(!succ)
		{
			model.addAttribute("create_error","user with this login already exist");
			return "createUser";
		}
		
		
		System.out.println(user);
				
			
		return "userCreated";
	}
	

}
