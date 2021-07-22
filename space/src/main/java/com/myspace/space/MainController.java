package com.myspace.space;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.RoomService;

@Controller
public class MainController {
	
	@Autowired
	private RoomService roomService;

	@RequestMapping(value="/index.do", method=RequestMethod.GET)
		public ModelAndView index() {
			ModelAndView mv = new ModelAndView();
			ArrayList<Object> addr_list = roomService.getAddrList();

			mv.setViewName("index");
			mv.addObject("addr_list", addr_list);
		
			return mv;
	}
}
















