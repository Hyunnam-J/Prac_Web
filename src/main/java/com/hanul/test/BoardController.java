package com.hanul.test;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.BoardPageVO;
import board.BoardServiceImpl;
import board.BoardVO;

@Controller
public class BoardController {
	@Autowired private BoardServiceImpl service;
	
	//show board's list
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model,
			BoardPageVO pageVo) {
		session.setAttribute("category", "bo");
		model.addAttribute("pageVo", service.boardList(pageVo));
		return "board/list";
	}//list
	
	//go for post in board
	@RequestMapping("/post.bo")
	public String post() {
		return "board/post";
	}
	
	//save dataBase after post
	@RequestMapping("/insertPost.bo")
	public String insertPost(@RequestParam("file") MultipartFile file, BoardVO vo, HttpServletRequest req) {
		
		//if if the file exists
		if( ! file.isEmpty() ) {
			vo.setFilename(file.getOriginalFilename());
			fileUpload("board", file, req);
		}
			
		service.insertPost(vo);
		return "redirect:list.bo";
	}
	
	//method fileUpload for save dataBase 
	public void fileUpload(String category, 
			MultipartFile file, HttpServletRequest req) {
		String filepath = 
				"d://app" + req.getContextPath()
				+ "/upload/" + category
				+ new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
		
		File folder = new File( filepath );
		if( ! folder.exists() ) folder.mkdirs();
		
		try {
			file.transferTo( new File(filepath, file.getOriginalFilename()) );
		} catch (Exception e) {}
	}
	
	@RequestMapping("/detail.bo")
	public String detail(int id, Model model, BoardPageVO pageVo) {
		//readcnt + 1
		service.readcnt(id);
		
		//for view when clicked
		model.addAttribute("vo", service.detail(id));
		model.addAttribute("crlf", "\r\n");
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