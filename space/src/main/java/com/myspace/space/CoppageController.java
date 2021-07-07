package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CoppageController {
	

	@RequestMapping(value="/corppage.do", method=RequestMethod.GET)
	public String corppage() {
		return "corppage/corppage"; 
	}
	
	@RequestMapping(value="/corppage_inquiry.do", method=RequestMethod.GET)
	public String corppage_inquiry() {
		return "corppage/corppage_inquiry";
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

}
