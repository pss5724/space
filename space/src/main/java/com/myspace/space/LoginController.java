package com.myspace.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspace.service.MemberService;
import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;  
	
	/**
	 * login.do: 로그인 화면
	 * **/
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}
	
	/**
	 * login_check.do: 로그인 처리
	 * **/
	@RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo) {
		
		//로그인 폼에서 넘어오는 데이터 받기
		String result_page = "";
		SessionVO svo = memberService.getLoginResult(vo);
		
		if(svo != null) {
			result_page = "index";
		} else {
			result_page = "login/loginFail";
		}

		return result_page;
	}

	/**
	 * pass_find.do: 비밀번호 찾기 화면
	 * **/
	@RequestMapping(value="/pass_find.do", method = RequestMethod.GET)
	public String pass_find() {
		return "login/pass_find";
	}
	
	/**
	 * pass_find_check.do: 비밀번호 찾기 처리
	 * **/
	@RequestMapping(value="/pass_find_check.do", method = RequestMethod.POST)
	public String pass_find_check(MemberVO vo) {
		return "login/login_find";
	}
	
}
