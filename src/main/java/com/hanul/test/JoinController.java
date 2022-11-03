package com.hanul.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import join.JoinServiceImpl;
import join.MemberVO;

@Controller
public class JoinController {
	@Autowired private JoinServiceImpl service;

	@RequestMapping("/view.jo")
	public String list(Model model, HttpSession session) {
		session.setAttribute("category", "jo");
		return "join/join";
	}
	
	//For ID duplicate check
	@ResponseBody @RequestMapping("/checkId")
	public boolean checkId(String id) {
		return service.checkId(id)==1 ? false : true;
	}
	
	@ResponseBody
	@RequestMapping(value="/insert.jo", produces="text/html; charset=utf-8")
	public String insert(MemberVO vo, HttpServletRequest req) {
		StringBuffer msg = new StringBuffer("<script>");
		if( service.insert(vo)==1 ) {
			msg.append("alert('success to sign-up'); location='")
				.append(req.getContextPath())
				.append("'");
			req.getSession().setAttribute("loginInfo", vo);
		}else {
			msg.append("alert('fail to sign-up'); history.back();");
		}
		msg.append("</script>");
		return msg.toString();
	}
	
	@RequestMapping("/login.jo")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		return "default/join/login";
	}
	
	//check id and pw for login
	@ResponseBody
	@RequestMapping("/checkLogin.jo")
	public boolean checkLogin(String id, String pw, HttpSession session) {
		MemberVO vo = service.checkLogin(id, pw);
		session.setAttribute("loginInfo", vo);
		return vo == null ? false : true;
	}
	
	@RequestMapping("/logout.jo")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/";
	}
	
	
	
	
}
