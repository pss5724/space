package com.myspace.space;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.InquiryService;
import com.myspace.service.MemberService;
import com.myspace.vo.InquiryVO;
import com.myspace.vo.MemberVO;

@Controller
public class AdminController { 
	
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private MemberService memberService; 
	
	/**
	 * member_list.do  -->  관리자 - 개인 회원리스트 출력
	 * **/
	@RequestMapping(value="/member_list.do", method=RequestMethod.GET)
	public ModelAndView admin_member_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Commons commons = new Commons();
		HashMap map = commons.getPage(rpage, memberService, "member");
		
		int start = (Integer)map.get("start");
		int end = (Integer)map.get("end");
		ArrayList<MemberVO> plist = memberService.getList0(start, end);
		
		mv.setViewName("admin/member_list");
		mv.addObject("plist", plist);
		mv.addObject("dbcount", map.get("dbCount"));
		mv.addObject("rpage", map.get("rpage"));
		mv.addObject("pageSize", map.get("pageSize"));
		
		return mv;
		//return "admin/member_list"; 
	}
	/**
	 * corp_list.do  -->  관리자 - 개인 회원리스트 출력
	 * **/
	@RequestMapping(value="/corp_list.do", method=RequestMethod.GET)
	public ModelAndView admin_corp_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Commons commons = new Commons();
		HashMap map = commons.getPage(rpage, memberService, "member");
		
		int start = (Integer)map.get("start");
		int end = (Integer)map.get("end");
		ArrayList<MemberVO> clist = memberService.getList1(start, end);
		
		mv.setViewName("admin/corp_list");
		mv.addObject("clist", clist);
		mv.addObject("dbcount", map.get("dbCount"));
		mv.addObject("rpage", map.get("rpage"));
		mv.addObject("pageSize", map.get("pageSize"));
		
		return mv;
	}
	

	@RequestMapping(value="/admin_booked.do", method=RequestMethod.GET)
	public String admin_booked() {
		return "admin/admin_booked";
	}

	@RequestMapping(value="/admin_inquiry.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<InquiryVO> list = inquiryService.getList();
		
		mv.setViewName("admin/admin_inquiry");
		mv.addObject("list",list);
		
		return mv;
	}
	
	@RequestMapping(value="/admin_inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_content(String qid) {
		ModelAndView mv = new ModelAndView();
		
		InquiryVO vo = inquiryService.getContent(qid);	
		
		mv.setViewName("admin/admin_inquiry_content");
		mv.addObject("vo",vo);
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin_inquiry_write.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_write(String qid) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/admin_inquiry_write");
		mv.addObject("qid", qid);
		
		return mv;
	}
	
	@RequestMapping(value="/admin_inquiry_write_proc.do", method=RequestMethod.POST)
	public ModelAndView admin_inquiry_write(String qid,String acontent) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = inquiryService.getUpdateResult(qid,acontent);
	
		if(result) {
		mv.setViewName("redirect:/admin_inquiry.do");
		}
		return mv;
	}

}
