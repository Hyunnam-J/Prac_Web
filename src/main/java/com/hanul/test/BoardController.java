package com.hanul.test;


import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
			vo.setFilepath(fileUpload("board", file, req));
		}
			
		service.insertPost(vo);
		return "redirect:list.bo";
	}
	
	//method fileUpload for save dataBase 
	public String fileUpload(String category, 
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
		return filepath + "/" + file.getOriginalFilename();
	}//fileUpload
	
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
	
	@RequestMapping("/delete.bo")
	public String delete(int id, BoardPageVO pageVo
			, HttpServletRequest req) {
		
		BoardVO vo = service.detail(id);
		
		if( service.delete(id)==1 ) {
			fileDelete(vo.getFilepath());
		}
		return "redirect:list.bo?curPage="+ pageVo.getCurPage();
	}
	//method fileDelete for delete at localServel 
	public void fileDelete(String filepath) {
		if( filepath != null ) {
			File file = new File( filepath );
			if( file.exists() ) file.delete();
		}
	}
	
	//download file when click attached file (icon)
	@ResponseBody @RequestMapping(value="/fileDownload.no"
			, produces="text/html; charset=utf-8")
	public String fileDownload(int id, String url,
			HttpServletRequest req,
			HttpServletResponse res) throws Exception{
		BoardVO vo = service.detail(id);
		boolean fileDownload = fileDownload(vo.getFilename(), vo.getFilepath(), req, res);
		
		if( ! fileDownload ) {
			
			//if you can't download
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('file does not exist'); location='")
				.append(url).append("'; ");
			msg.append("</script>");
			return msg.toString();
		}else
			return null;
	}
	
	//method fileDownload for download my PC 
	public boolean fileDownload(String filename, String filepath
			, HttpServletRequest req
			, HttpServletResponse res) throws Exception{
		
		File file = new File( filepath );
		if( ! file.exists() ) return false;
		
		String mime 
		= req.getSession().getServletContext().getMimeType(filepath);
		res.setContentType(mime);	
		
		filename = URLEncoder.encode( filename, "utf-8" );
		//filename = filename.replaceAll("\\+", "%20"); //.replaceAll("?", "%36");
		
		//download
		res.setHeader("content-disposition"
				, "attachment; filename="+ filename); 
		
		ServletOutputStream out = res.getOutputStream();
		FileCopyUtils.copy( new FileInputStream(file), out );
		out.flush();
		return true;
	}
	

}//class