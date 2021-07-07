package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {
	@RequestMapping(value="/mypage_inquiry_write.do", method=RequestMethod.GET)
	public String mypage_inquiry_write() {
		return "mypage/mypage_inquiry_write";
	}
	
	@RequestMapping(value="/mypage_info.do", method=RequestMethod.GET)
	public String mypage_info() {
		return "mypage/mypage_info";
	}

	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}

	@RequestMapping(value="/mypage_inquiry.do", method=RequestMethod.GET)
	public String mypage_inquiry() {
		return "mypage/mypage_inquiry";
	}

}
