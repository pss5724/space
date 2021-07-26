package com.myspace.space;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.InquiryService;
import com.myspace.service.MemberService;
import com.myspace.service.RoomService;
import com.myspace.vo.InquiryVO;
import com.myspace.vo.MemberVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.RoomVO;
import com.myspace.vo.SessionVO;

@Controller
public class CorppageController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/corppage_insert.do", method=RequestMethod.GET)
	public String corppage_insert() {
		return "corppage/corppage_insert";
	}

	@RequestMapping(value="/corppage.do", method=RequestMethod.GET)
	public ModelAndView corppage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ArrayList<RoomVO> list = roomService.getCorpPageList(svo.getId());
		
		mv.setViewName("corppage/corppage");
		mv.addObject("list",list);
		
		return mv; 
	}
	
	@RequestMapping(value="/corppage_inquiry.do", method=RequestMethod.GET)
	public ModelAndView corppage_inquiry(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ArrayList<InquiryVO> list = inquiryService.getList(svo.getId());
		
		mv.setViewName("corppage/corppage_inquiry");
		mv.addObject("list",list);
		
		
		
		return mv;	
		
	}
	
	@RequestMapping(value="/corppage_inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView corppage_inquiry_content(String qid) {
	ModelAndView mv = new ModelAndView();
		
		InquiryVO vo = inquiryService.getContent(qid);	
		
		mv.setViewName("corppage/corppage_inquiry_content");
		mv.addObject("vo",vo);
		
		return mv;
		
	}
	
	
	@RequestMapping(value="/corppage_inquiry_write.do", method=RequestMethod.GET)
	public String corppage_inquiry_write() {
		return "corppage/corppage_inquiry_write";
	}
	
	/**
	 *  corppage_inquiry_write.do 1:1문의 글쓰기 처리
	 */
	@RequestMapping(value="/corppage_inquiry_write_proc.do",method=RequestMethod.POST)
	public ModelAndView board_write_proc(InquiryVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String root_path ="";
		String attach_path ="";
		if(vo.getFile1().getSize() != 0) {
		//1. 파일저장 위치
		root_path = request.getSession().getServletContext().getRealPath("/");
		attach_path = "\\resources\\upload\\";
		
		//2. 파일이름 --> vo에 저장
		UUID uuid = UUID.randomUUID();
		vo.setQfile(vo.getFile1().getOriginalFilename());
		vo.setQsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
	}	
		//3. DB연동
		//BoardDAO dao = new BoardDAO();
	  	boolean result = inquiryService.getInsertResult(vo);
	  	
	
	  
	  	
	  	if(result){
	  		//response.sendRedirect("board_list.jsp");
	  		mv.setViewName("redirect:/corppage_inquiry.do");
	  		
	  		if(vo.getFile1().getSize() != 0) {
	  		//4. DB연동 성공 --> upload 폴더에 저장
	  		File file = new File(root_path+attach_path+vo.getQsfile());
		  	vo.getFile1().transferTo(file);
	  		}
	  	}
		
		
		return mv;
	}
	
	@RequestMapping(value="/corppage_info.do", method=RequestMethod.GET)
	public ModelAndView corppage_info(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		
		MemberVO vo = memberService.getInfo(svo.getId());		
		
		mv.setViewName("corppage/corppage_info");
		mv.addObject("vo",vo);
		
		return mv;
		
		
	}
	
	@RequestMapping(value="/corppage_info_pass.do", method=RequestMethod.GET)
	public ModelAndView corppage_info_pass(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		
		MemberVO vo = memberService.getInfo(svo.getId());		
		
		mv.setViewName("corppage/corppage_info_pass");
		mv.addObject("vo",vo);
		
		return mv;
	}
	
	@RequestMapping(value="/corppage_pass_change_proc.do", method=RequestMethod.POST)
	public ModelAndView mypage_pass_change_proc(HttpSession session, String new_pass) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");

		
		boolean result = memberService.getPassChangResult(new_pass,svo.getId());
		if(result) {
			mv.setViewName("redirect:/corppage_info.do");
		}else {
			mv.setViewName("redirect:/corppage_info_pass.do");
		}
			
		
		
		
		
		return mv;
	}
	
	@RequestMapping(value="/corppage_booked_cancel_proc.do", method=RequestMethod.GET)
	public ModelAndView corppage_info_pass(String rsid) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = roomService.getCancelResult(rsid);
	  	
	  	
	  	if(result){
	  		mv.setViewName("redirect:/corppage_booked.do");
	  	}
		
		
		
		return mv;
	}
	
	@RequestMapping(value="/corppage_booked.do", method=RequestMethod.GET)
	public ModelAndView corppage_booked(String rpage, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		 Commons commons= new Commons();
		 HashMap map = commons.getPage(rpage, roomService, "room");
		 
		 int start = (Integer)map.get("start");
		 int end =(Integer)map.get("end");
		 
		 ArrayList<RoomVO> rvo = roomService.getRidList(svo.getId());
		 
		 String[] ridList = new String[rvo.size()];
		 
		 for(int i=0;i<rvo.size();i++) {
			 ridList[i] = rvo.get(i).getRid();
		 }
		 
		 
				 
		 ArrayList<Object> olist = roomService.getReserveList(start, end, ridList);
		 ArrayList<ReservationVO> list =new ArrayList<ReservationVO>();
			 for(Object obj :olist) {
				 ReservationVO vo = (ReservationVO)obj;
				 list.add(vo);
			 }
			 
		 mv.setViewName("corppage/corppage_booked");
		 mv.addObject("list", list);
		 mv.addObject("dbcount", map.get("dbCount"));
		 mv.addObject("rpage", map.get("rpage"));
		 mv.addObject("pagesize", map.get("pageSize"));
		
		
		
		
		
		return mv;
		
		
	}

}
