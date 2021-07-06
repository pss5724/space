package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {
	
		@RequestMapping(value="/notice.do", method=RequestMethod.GET)
		public String notice() {
			return "notice/notice";
		}

		@RequestMapping(value="/faq.do", method=RequestMethod.GET)
		public String faq() {
			return "notice/faq";
		}
			
}
