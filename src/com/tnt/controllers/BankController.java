package com.tnt.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tnt.dao.BankBalance;
import com.tnt.dao.User;
import com.tnt.jsons.Trans;
import com.tnt.service.BankService;
import com.tnt.service.UserService;

@Controller
public class BankController {

	private BankService bankService;
	
	private UserService userService;
	
	
	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Autowired
	public void setBankService(BankService bankService) {
		this.bankService = bankService;
	}

	@RequestMapping("/wallet")
	public String showHome(Model model, Principal prince) {
		String user_name = prince.getName();
		
		User user = userService.getUserByName(user_name);
		
		model.addAttribute("logged_as", user_name);
		model.addAttribute("user", user);
		
		
		BankBalance bank = bankService.getCurrentBalance();
		
		model.addAttribute("bank", bank);
		

		return "wallet";
	}

	
	
	
	@RequestMapping(value="/makeTrans",method=RequestMethod.POST)
	   public  String  getSearchUserProfiles(Trans trans, Principal prince, Model model) {
		    
		//little debug
		    String user_name = prince.getName();
			
			System.out.println("from user: " + user_name);
      
			User user = userService.getUserByName(user_name);
			BankBalance bank = bankService.getCurrentBalance();
			
			bankService.makeTransaction(trans, user_name, user, bank);
			model.addAttribute("logged_as", user_name);
			model.addAttribute("bank", bank);
			model.addAttribute("user", user);
					
			
			return "wallet";
	   }

}
