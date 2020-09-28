package com.ch.mybatis.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.mybatis.model.Member;
import com.ch.mybatis.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}
	
	@RequestMapping(value = "idChk", produces = "text/html;charset=utf-8")
	@ResponseBody //jsp를 통하지 않고 바로 문자로 전달
	public String idChk(String id) {   //id로 데이터 읽어옴
		String msg = "";
		Member member = ms.select(id);
		if(member == null) msg="사용 가능한 아이디입니다.";
		else msg = "현재 사용중인 아이디입니다.";
		return msg; 
	}
	
	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		Member mem = ms.select(member.getId()); //member->화면입력, mem->읽어온 데이터
		if(mem == null) {
			String fileName = member.getFile().getOriginalFilename();
			member.setFileName(fileName);
			String real = session.getServletContext().getRealPath("/upload");
			FileOutputStream fos = new FileOutputStream(
					new File(real+"/"+fileName));
					fos.write(member.getFile().getBytes());
					fos.close();
					result = ms.insert(member);
			
		}else result=-1; //중복된 아이디
		model.addAttribute("result",result);
		
		return "join";
	}
	
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("login")
	public String login(Member member, Model model, HttpSession session) {
		int result = 0;
		Member mem = ms.select(member.getId());
		if(mem==null || mem.getDel().equals("y")) 
			result = -1; //없거나 탈퇴한 회원
		else if(member.getPassword().equals(mem.getPassword())){
			result = 1; //로그인 성공
			session.setAttribute("id",member.getId());
		}
		model.addAttribute("result",result);
		return "login";
	}
	
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = null;
		if (id != null && !id.equals(""))
			member = ms.select(id);
		model.addAttribute("member", member);
		return "main";
	}
	
	@RequestMapping("view")
	public String view(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "view";
	}
}


























