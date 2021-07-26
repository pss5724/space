package com.myspace.space;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.RoomService;
import com.myspace.vo.OptionVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.RoomVO;

@Controller
public class MainController {
	
	@Autowired
	private RoomService roomService;

	@RequestMapping(value="/index.do", method=RequestMethod.GET)
		public ModelAndView index() {
			ModelAndView mv = new ModelAndView();
			ArrayList<Object> addr_list = roomService.getAddrList();
			int reserve_count = roomService.getCount("reserve");
			int room_count = roomService.getCount("room");
			int review_count = roomService.getCount("review");

			ArrayList<RoomVO> roomlist = roomService.getRoomList();
			ArrayList<OptionVO> roomoptionlist = roomService.getRoomOptionList();
			ArrayList<RoomVO> topreservation = roomService.getTopReservation();
			ArrayList<RoomVO> topgrade = roomService.getTopGrade();

			mv.setViewName("index");
	        mv.addObject("addr_list", addr_list);
	        mv.addObject("reserve_count", reserve_count);
	        mv.addObject("room_count", room_count);
	        mv.addObject("review_count", review_count);

			mv.addObject("roomlist", roomlist);
			mv.addObject("roomoptionlist", roomoptionlist);
			mv.addObject("topreservation", topreservation);
			mv.addObject("topgrade", topgrade);
		
			return mv;
	}
}
















