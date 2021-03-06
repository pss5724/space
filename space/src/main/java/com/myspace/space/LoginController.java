package com.myspace.space;


import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspace.service.MailService;
import com.myspace.service.MemberService;
import com.myspace.vo.Email;
import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;  
	
	@Autowired
	private MailService emailSender;
	
	@Autowired
	private Email email;
	
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
	/**가입승인이 안되도 로그인이 되지만 login.jsp쪽에서 jquery를 사용해서 강제로 로그아웃시킴(logout.do 이용): 이 로직을 사용하려면 login.jsp 에서 jquery주석처리 된 부분 주석 풀기!**/
	/*@RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo, HttpSession session) {
		
		//로그인 폼에서 넘어오는 데이터 받기
		String result_page = "";
		SessionVO svo = memberService.getLoginResult(vo);
		
		if(svo != null) {
			svo.setId(vo.getId());
			session.setAttribute("svo",svo);
			//result_page = "index";  // -> 이렇게 주려면 index.jsp에 jquery(if문 중 승인대기중)조건문 추가해야함.
			
			if(svo.getChoicein() == 0) {
				result_page = "login/login";
			}else {
				result_page = "index";
			}
			
		} else {
			result_page = "login/loginFail";
		}

		return result_page;
	}*/
	/**가입승인이 안되면 아에 로그인이 안되게 처리하고 controller안에서 alert(경고창)을 띄우게 함**/
	@RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	public String login_check(MemberVO vo, HttpSession session,  HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//로그인 폼에서 넘어오는 데이터 받기
		String result_page = "";
		SessionVO svo = memberService.getLoginResult(vo);
		if(svo != null) {
			if(svo.getChoicein() == 1) {
				svo.setId(vo.getId());
				session.setAttribute("svo",svo);
				result_page = "redirect:/index.do";  // -> 이렇게 주려면 index.jsp에 jquery(if문 중 승인대기중)조건문 추가해야함.
				
			} else {
				result_page = "login/login";
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('승인 대기 중입니다.'); history.go(-1);</script>");  //history.go(-1); :한단계 뒤로가기(id는 내가 쳤던것을 그대로 출력) //생략할 시 그냥 login.jsp 띄워짐
				out.flush();  //안하면 알람 안뜸
			}
		}else {
			result_page = "login/loginFail";
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원정보가 없거나 아이디/비밀번호가 틀렸습니다.'); history.go(-1);</script>");
			out.flush();  //안하면 알람 안뜸
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
		
		return "redirect:/index.do";
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
	public String pass_find_check(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();
	    
		int result = memberService.getMember(vo.getId());
		
		if(result == 1) {
			Random r = new Random();
			int num = r.nextInt(89999) + 10000;
			String npassword = "space" + Integer.toString(num);// 새로운 비밀번호 변경
			
			System.out.println("비번생성"+npassword);
			
			vo.setPass(npassword);
			memberService.newPassword(vo);
			// 이메일로 비밀번호가 전송이된다.
			email.setContent("새로운 비밀번호 " + vo.getPass() + " 입니다." );
			email.setReceiver(vo.getId());
			email.setSubject("안녕하세요 "+vo.getId() +"님  재설정된 비밀번호를 확인해주세요");
			System.out.println("email>>"+emailSender);
			emailSender.SendEmail(email);

			System.out.println("이메일"+email);
			out.println("<script>alert('임시 비밀번호를 이메일로 보냈습니다.');</script>");	
			out.flush();
		} else {
			out.println("<script>alert('회원정보가 존재하지 않습니다.');</script>");	
	    	out.flush();
		}

		return "login/login";

	}

}
