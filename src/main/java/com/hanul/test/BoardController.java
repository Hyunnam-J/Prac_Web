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
	
	@RequestMapping("/detail.bo")
	public String detail(int id, Model model, BoardPageVO pageVo) {
		//readcnt + 1
		service.readcnt(id);
		
		//for view when clicked
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("pageVo", pageVo);
		return "board/detail";
	}
	
	@RequestMapping("/reply.bo")
	public String reply(Model model, int id, BoardPageVO pageVo) {
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("pageVo", pageVo);
		return "board/reply";
	}
	
	@RequestMapping("/insertReply.bo")
	public String insertReply(BoardVO vo, BoardPageVO pageVo) {
		service.insertReply(vo);
		return "redirect:list.bo?curPage="+ pageVo.getCurPage();
	}

	

}//class