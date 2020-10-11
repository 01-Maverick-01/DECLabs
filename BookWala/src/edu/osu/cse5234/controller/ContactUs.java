package edu.osu.cse5234.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/contactus")
public class ContactUs {
	
	@RequestMapping(method = RequestMethod.GET)
	public String showAboutUsPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "ContactUs";
	}
	
}
