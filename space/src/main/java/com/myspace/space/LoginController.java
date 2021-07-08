package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
	
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
	/*@RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo) {
		String result_page = "";
		
		//로그인 폼에서 넘어오는 데이터 받기
		MemberDAO dao = new MemberDAO();
		SessionVO svo = dao.getLoginResult(vo);
		
		if(svo.getResult() == 1) {
			result_page = "index";
		} else {
			result_page = "login/loginFail";
		}
		
		return result_page;
	}*/

}
