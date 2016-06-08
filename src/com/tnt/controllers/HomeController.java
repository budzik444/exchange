package com.tnt.controllers;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

		
	
	
	@RequestMapping("/")	
	public String showHome(Model model, Principal prince)
	{
		if(prince!=null)
		{
		String logged_as = prince.getName();
		
		model.addAttribute("logged_as", logged_as);
		}
		
		return "home";
	}
	
	@RequestMapping("/loggedout")
	public String showLoggedOut() {
		return "home";
	}

}
