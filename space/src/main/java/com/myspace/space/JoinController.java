package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * DB연동은 Controller에서 처리한다
 * **/
@Controller
public class JoinController {
	
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
	 * join_partner.do ---> 파트너 회원가입 화면
	 * **/
	@RequestMapping(value="/join_partner.do", method = RequestMethod.GET)
	public String join_partner() {
		return "join/join_partner";
	}
	
	/**
	 * join_proc.do   --> 회원가입 처리
	 * **/
	/*@RequestMapping(value="/join_proc.do", method = RequestMethod.POST)
	public String join_proc(MemberVO vo) {
		String result_page = "";
		
		MemberDAO dao = new MemberDAO();
		boolean join_result = dao.getInsertResult(vo);
		
		if(join_result == true) {
			result_page = "join/joinSuccess";
		} else {
			result_page = "errorPage";
		}
		return result_page;
	}*/
	
	
	
}
