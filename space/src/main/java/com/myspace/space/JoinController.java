package com.myspace.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspace.dao.MemberDAO;
import com.myspace.service.MemberService;
import com.myspace.vo.MemberVO;

@Controller
public class JoinController {
	
	@Autowired
	private MemberService memberService; 
	
	/**
	 * join_main.do ---> 메인 회원가입 화면
	 * **/
	@RequestMapping(value="/join_main.do", method = RequestMethod.GET)
	public String join_main() {
		return "join/join_main";
	}
	
	/**
	 * join_personal.do ---> 개인 회원가입 화면
	 * **/
	@RequestMapping(value="/join_personal.do", method = RequestMethod.GET)
	public String join_personal() {
		return "join/join_personal";
	}
	
	/**
	 * join_cor.do ---> 기업 회원가입 화면
	 * **/
	@RequestMapping(value="/join_cor.do", method = RequestMethod.GET)
	public String join_cor() {
		return "join/join_cor";
	}
	
	/**
	 * join_per_proc.do   --> 개인 회원가입 처리
	 * **/
	@RequestMapping(value="/join_per_proc.do", method = RequestMethod.POST)
	public String join_per_proc(MemberVO vo) {
		String result_page = "";
		
		MemberDAO dao = new MemberDAO();
		boolean join_result = memberService.getInsertResult0(vo);
		
		if(join_result == true) {
			result_page = "join/joinSuccess";
		} else {
			result_page = "join/joinFail";
			//result_page = "errorPage";
		}
		return result_page;
	}
	/**
	 * join_cor_proc.do   --> 기업 회원가입 처리
	 * **/
	@RequestMapping(value="/join_cor_proc.do", method = RequestMethod.POST)
	public String join_cor_proc(MemberVO vo) {
		String result_page = "";
		
		MemberDAO dao = new MemberDAO();
		boolean join_result = memberService.getInsertResult1(vo);
		
		if(join_result == true) {
			result_page = "join/joinSuccess";
		} else {
			result_page = "join/joinFail";
			//result_page = "errorPage";
		}
		return result_page;
	}
	
	
	
}
