package com.infosys.movieSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.movieSystem.bean.MovieUser;
import com.infosys.movieSystem.service.MovieUserService;

@RestController
public class LoginController {

	@Autowired
	private MovieUserService service;
	
	@Autowired
	private BCryptPasswordEncoder bCrypt;
	
	@GetMapping("/index")
	public ModelAndView showIndexpage() {
		String page="";
		String role = service.getRole();
		System.out.println("the user role is:"+ role);
		if(role.equalsIgnoreCase("Admin")){
			page = "indexAdmin";
		}
		else if(role.equalsIgnoreCase("Customer")) {
			page = "indexCustomer";
		}
		return new ModelAndView (page);
	}
		
	@GetMapping("/loginpage")
	public ModelAndView showLoginPage() {
		return new ModelAndView("loginPage");
	}
	
	
	@GetMapping("/loginerror")
	public ModelAndView showLoginErrorPage() {
		return new ModelAndView("loginErrorPage");
	}
	
	@GetMapping("/register")
	public ModelAndView showUserRegisterPage() {
		MovieUser user=new MovieUser();
		ModelAndView mv=new ModelAndView("newUserPage");
		mv.addObject("userRecord",user);
		return mv;
	}
	
	@PostMapping("/register")
	 public ModelAndView saveNewUser(@ModelAttribute("userRecord") MovieUser user) {
		 MovieUser newUser=new MovieUser();
			String encodedPassword = bCrypt.encode(user.getPassword());
			newUser.setName(user.getName());
			newUser.setRole(user.getRole());
			newUser.setEmail(user.getEmail());
			newUser.setUsername(user.getUsername());
			newUser.setPassword(encodedPassword);
			service.save(newUser);
			return new ModelAndView("loginPage");
	 }

}
