package com.hanul.test;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.BoardPageVO;
import board.BoardServiceImpl;
import board.BoardVO;

@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model,
			BoardPageVO pageVo) {
		session.setAttribute("category", "bo");
		model.addAttribute("pageVo", service.boardList(pageVo));
		return "board/list";
	}//list
	
	@RequestMapping("/post.bo")
	public String post() {
		return "board/post";
	}
	
	@RequestMapping("/insertPost.bo")
	public String insertPost(BoardVO vo) {
		service.insertPost(vo);
		return "redirect:list.bo";
	}

	

}//class