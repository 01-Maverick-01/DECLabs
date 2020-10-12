package edu.osu.cse5234.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.osu.cse5234.model.ContactUs;


@Controller
@RequestMapping("/")
public class Store {
	
	@RequestMapping(method = RequestMethod.GET)
	public String viewStore(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "Home";
	}
	
	@RequestMapping(path = "/aboutus", method = RequestMethod.GET)
	public String showAboutUsPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "AboutUs";
	}
	
	@RequestMapping(path = "/contactus", method = RequestMethod.GET)
	public String showContactUsPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("contactInfo", new ContactUs());
		return "ContactUs";
	}
	
	@RequestMapping(path = "/submitContactForm", method = RequestMethod.POST)
	public String submitContactForm(@ModelAttribute("contactInfo") ContactUs contactInfo, HttpServletRequest request) {
		return "redirect:/";
	}
}
