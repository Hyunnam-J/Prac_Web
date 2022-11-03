package com.hanul.test;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cus.CusServiceImpl;
import cus.CustomerVO;

@Controller
public class CusController {
	@Autowired CusServiceImpl service;

	@RequestMapping("/list.cus")
	public String list(Model model, HttpSession session) {
		List<CustomerVO> list = service.cus_list();
		model.addAttribute("list", list);
		session.setAttribute("category", "cus");
		
		
		return "cus/list";
	}
}
