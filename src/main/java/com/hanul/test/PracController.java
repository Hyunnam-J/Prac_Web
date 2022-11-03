package com.hanul.test;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import practice.PracServiceImpl;

@Controller
public class PracController {
	@Autowired private PracServiceImpl service;

	@RequestMapping("/test8.pr")
	public String test8(Model model) {
		
		model.addAttribute("jobs", service.test8());
		return "practice/practice";
		
	}
	
	@RequestMapping("/test9.pr")
	public String test9(Model model) {
		model.addAttribute("departments", service.test9());
		return "practice/practice";
	}
	
	@RequestMapping("/practice.pr")
	public String practice(Model model, HttpSession session) {
		session.setAttribute("category", "pr");
		return "practice/practice";
	}
}
