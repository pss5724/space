package com.myspace.space;


import javax.servlet.http.HttpSession;

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
	/*@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		return "login/login";
	}*/
	
	
	/**
	 * login_check.do: 로그인 처리
	 * **/
	@RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo, HttpSession session) {
		
		//로그인 폼에서 넘어오는 데이터 받기
		String result_page = "";
		SessionVO svo = memberService.getLoginResult(vo);
		
		if(svo != null) {
			svo.setId(vo.getId());
			session.setAttribute("svo",svo);
			//result_page = "index";   -> 이렇게 주려면 index.jsp에 jquery(if문 중 승인대기중)조건문 추가해야함.
			
			if(svo.getChoicein() == 0) {
				result_page = "login/login";
			}else {
			result_page = "index";
			}
			
		} else {
			result_page = "login/loginFail";
		}

		return result_page;
	}
	
	/**
	 * logout.do : 로그아웃 처리
	 * **/
	@RequestMapping(value="logout.do", method=RequestMethod.GET)    //클릭해서 넘어오기떄문에 GET
	public String logout(HttpSession session) {
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		if(svo != null)
			session.invalidate();
		
		return "/index";
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
