package com.myspace.space;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView join_cor_proc(MemberVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String root_path="", attach_path="";
		
		if(vo.getFile1().getSize() != 0) {
			//1. 파일 저장 위치
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\upload\\";
			
			//2. 파일 이름 >>> vo에 저장
			UUID uuid = UUID.randomUUID();
			//vo.setClic(vo.getFile1().getOriginalFilename());
			vo.setClic(uuid + "_" + vo.getFile1().getOriginalFilename());
		}
		
		//3. DB 연동
		//MemberDAO dao = new MemberDAO();
		//boolean result = memberDAO.getInsertResult1(vo);
		boolean join_result = memberService.getInsertResult1(vo);
		
		if(join_result) {
			mv.setViewName("join/joinSuccess");
			
			if(vo.getFile1().getSize() != 0) {
				//4 DB 연동 성공 >>> upload 폴더에 저장
				File file = new File(root_path + attach_path + vo.getClic());
				vo.getFile1().transferTo(file);
			}
		}else {
			mv.setViewName("join/joinFail");
		}
		return mv;
	}
	/**
	 * join_cor_proc.do   --> 기업 회원가입 처리
	 * **/
	/*@RequestMapping(value="/join_cor_proc.do", method = RequestMethod.POST)
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
	}*/
	
	
	
}
