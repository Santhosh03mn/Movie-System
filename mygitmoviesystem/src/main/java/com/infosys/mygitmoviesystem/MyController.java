package com.infosys.mygitmoviesystem;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class MyController {
  
	@GetMapping("/index")
	public ModelAndView showIndexPage() {
		return new ModelAndView("index");
	}
	@GetMapping("home")
	public ModelAndView showHomePage() {
		return new ModelAndView("home");
	}
}
