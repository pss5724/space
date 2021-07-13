package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CorppageController {
	
	@RequestMapping(value="/corppage_insert.do", method=RequestMethod.GET)
	public String corppage_insert() {
		return "corppage/corppage_insert";
	}

	@RequestMapping(value="/corppage.do", method=RequestMethod.GET)
	public String corppage() {
		return "corppage/corppage"; 
	}
	
	@RequestMapping(value="/corppage_inquiry.do", method=RequestMethod.GET)
	public String corppage_inquiry() {
		return "corppage/corppage_inquiry";
	}
	
	@RequestMapping(value="/corppage_inquiry_content.do", method=RequestMethod.GET)
	public String corppage_inquiry_content() {
		return "corppage/corppage_inquiry_content";
	}
	
	
	@RequestMapping(value="/corppage_inquiry_write.do", method=RequestMethod.GET)
	public String corppage_inquiry_write() {
		return "corppage/corppage_inquiry_write";
	}
	
	@RequestMapping(value="/corppage_info.do", method=RequestMethod.GET)
	public String corppage_info() {
		return "corppage/corppage_info";
	}
	
	@RequestMapping(value="/corppage_booked.do", method=RequestMethod.GET)
	public String corppage_booked() {
		return "corppage/corppage_booked";
	}

	@RequestMapping(value="/corppage_update.do", method=RequestMethod.GET)
	public String corppage_update() {
		return "corppage/corppage_update";
	}
}
