package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RoomController {

	@RequestMapping(value="/room_list.do", method=RequestMethod.GET)
	public String room_list() {
		return "room/room_list";
	}

	@RequestMapping(value="/room_content.do", method=RequestMethod.GET)
	public String room_content() {
		return "room/room_content";
	}
	

}
