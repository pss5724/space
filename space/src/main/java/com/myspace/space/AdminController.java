package com.myspace.space;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.InquiryService;
import com.myspace.vo.InquiryVO;

@Controller
public class AdminController { 
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping(value="/member_list.do", method=RequestMethod.GET)
	public String member_list() {
		return "admin/member_list"; 
	}
	
	@RequestMapping(value="/corp_list.do", method=RequestMethod.GET)
	public String corp_list() {
		return "admin/corp_list";
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
