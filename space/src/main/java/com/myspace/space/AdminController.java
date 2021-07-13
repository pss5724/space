package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController { 
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
	public String admin_inquiry() {
		return "admin/admin_inquiry";
	}
	
	@RequestMapping(value="/admin_inquiry_content.do", method=RequestMethod.GET)
	public String admin_inquiry_content() {
		return "admin/admin_inquiry_content";
	}
	
	@RequestMapping(value="/admin_inquiry_write.do", method=RequestMethod.GET)
	public String admin_inquiry_write() {
		return "admin/admin_inquiry_write";
	}

}
