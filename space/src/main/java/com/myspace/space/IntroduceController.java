package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class IntroduceController {
		@RequestMapping(value="/introduce.do", method=RequestMethod.GET)
		public String introduce() {
			return "introduce/introduce";
		}

		@RequestMapping(value="/guide.do", method=RequestMethod.GET)
		public String guide() {
			return "introduce/guide";
		}
		@RequestMapping(value="/partner.do", method=RequestMethod.GET)
		public String partner() {
			return "introduce/partner";
		}
		

}
