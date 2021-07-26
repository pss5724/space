package com.myspace.space;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.RoomService;

@Controller
public class IntroduceController {
	
		@Autowired
		private RoomService roomService;
		
		public ModelAndView getCount() {
			ModelAndView mv = new ModelAndView();

			int reserve_count = roomService.getCount("reserve");
			int room_count = roomService.getCount("room");
			int review_count = roomService.getCount("review");
			
			mv.addObject("reserve_count", reserve_count);
			mv.addObject("room_count", room_count);
			mv.addObject("review_count", review_count);
			
			return mv;
		}
	
		@RequestMapping(value="/introduce.do", method=RequestMethod.GET)
		public ModelAndView introduce() {
			ModelAndView mv = getCount();
			mv.setViewName("introduce/introduce");

			return mv;
		}

		@RequestMapping(value="/guide.do", method=RequestMethod.GET)
		public String guide() {
			return "introduce/guide";
		}
		
		@RequestMapping(value="/partner.do", method=RequestMethod.GET)
		public ModelAndView partner() {
			ModelAndView mv = getCount();
			mv.setViewName("introduce/partner");
			
			
			return mv;
		}
		

}
