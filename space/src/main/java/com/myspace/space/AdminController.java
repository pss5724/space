package com.myspace.space;

import java.util.ArrayList;
import java.util.HashMap;

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
public class AdminController { 
	
	@Autowired
	private InquiryService inquiryService;
	@Autowired
	private MemberService memberService; 
	@Autowired
	private RoomService roomService; 
	
	/**
	 * member_list.do  -->  관리자 - 개인 회원리스트 출력
	 * **/
	@RequestMapping(value="/member_list.do", method=RequestMethod.GET)
	public ModelAndView admin_member_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Commons commons = new Commons();
		HashMap map = commons.getPage(rpage, memberService, "member");
		
		int start = (Integer)map.get("start");
		int end = (Integer)map.get("dbCount");
		ArrayList<MemberVO> plist = memberService.getList0(start, end);
		
		mv.setViewName("admin/member_list");
		mv.addObject("plist", plist);
		//mv.addObject("dbcount", map.get("dbCount"));
		mv.addObject("rpage", map.get("rpage"));
		mv.addObject("pageSize", map.get("pageSize"));
		
		return mv;
		//return "admin/member_list"; 
	}
	/**
	 * corp_list.do  -->  관리자 - 기업 회원리스트 출력
	 * **/
	@RequestMapping(value="/corp_list.do", method=RequestMethod.GET)
	public ModelAndView admin_corp_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Commons commons = new Commons();
		HashMap map = commons.getPage(rpage, memberService, "member");
		
		int start = (Integer)map.get("start");
		int end = (Integer)map.get("dbCount");
		ArrayList<MemberVO> clist = memberService.getList1(start, end);
		
		mv.setViewName("admin/corp_list");
		mv.addObject("clist", clist);
		//mv.addObject("dbcount", map.get("dbCount"));
		mv.addObject("rpage", map.get("rpage"));
		mv.addObject("pageSize", map.get("pageSize"));
		
		return mv;
	}
	
	
	/**
	 * cor_join_proc : 기업고객 가입 승인 처리
	 * **/
	@RequestMapping(value="/cor_join_proc.do", method = RequestMethod.GET)
	public ModelAndView cor_join_proc(String id) {
		
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getJoinIn(id);

		if(result) mv.setViewName("redirect:/corp_list.do");   //controller에서 불러오면 .do 형태

		return mv;
	}
	//db쪽은 바뀌고 넘어가지만 return페이지가 오류남 (멤버리스트 출력안되고 빈칸)
	/*@RequestMapping(value="/cor_join_proc.do", method = RequestMethod.GET)
	public String cor_join_proc(String id) {
		
		System.out.println(id);
		String view_name = ""; 
		boolean result = memberService.getJoinIn(id);
		
		if(result) view_name = "admin/corp_list";      //jsp에서 불러오기때문에 admin/ 써야함
		
		return view_name;
	}*/
	
	/**
	 * joinout_btn_proc : 고객이 탈퇴버튼 누르면 admin쪽 list에 탈퇴 승인 버튼 활성화
	 * **/
	@RequestMapping(value="/joinout_btn_proc.do", method = RequestMethod.GET)
	public ModelAndView joinout_btn_proc(HttpSession session) {
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getJoinBdelete(svo.getId());
		
		if(result) {
			if(svo.getPosition() == 0 ) {
				mv.setViewName("redirect:/mypage_info.do");    
			}else {
				mv.setViewName("redirect:/corppage_info.do"); 
			}
		}
		
		return mv;
	}
	
	/**
	 * joinnotout_btn_proc : 탈퇴 철회 처리
	 * **/
	@RequestMapping(value="/joinnotout_btn_proc.do", method = RequestMethod.GET)
	public ModelAndView joinnotout_btn_proc(HttpSession session) {
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getJoinNBdelete(svo.getId());
		
		if(result) {
			if(svo.getPosition() == 0 ) {
				mv.setViewName("redirect:/mypage_info.do");    
			}else {
				mv.setViewName("redirect:/corppage_info.do"); 
			}
		}    
		
		return mv;
	}
	
	
	/**
	 * member_delete_process : 탈퇴처리(삭제)
	 * **/
	@RequestMapping(value="/member_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView member_delete_proc(String id, String position) {
		
		
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getJoinOut(id);

		if(result) {
			if(position.equals("0") ) {
				mv.setViewName("redirect:/member_list.do");    
			}else {
				mv.setViewName("redirect:/corp_list.do"); 
			}
		}    

		return mv;
	}
	/**
	 * member_delete_process : 탈퇴처리(삭제)
	 * **/
	/*@RequestMapping(value="/member_delete_proc.do", method = RequestMethod.GET)
	public ModelAndView member_delete_proc(String id, HttpSession session) {
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ModelAndView mv = new ModelAndView();
		boolean result = memberService.getJoinOut(id);
		
		if(result) {
			if(svo.getPosition() == 0 ) {
				mv.setViewName("redirect:/member_list.do");    
			}else {
				mv.setViewName("redirect:/corp_list.do"); 
			}
		}    
		
		return mv;
	}*/
	
	/**
	 * clic_Popup.do : corp_list에서 사업자등록증 보기버튼 눌렀을때 열리는 팝업창
	 * **/
	@RequestMapping(value="/clic_Popup.do", method = RequestMethod.GET)
	public ModelAndView clic_Popup(String clic) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/admin/clic_Popup");
		mv.addObject("clic", clic);
		System.out.println("clic=" + clic);
		
		return mv;
	}
	
	

	@RequestMapping(value="/admin_booked.do", method=RequestMethod.GET)
	public ModelAndView admin_booked(String rpage,HttpSession session ) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		 Commons commons= new Commons();
		 HashMap map = commons.getPage(rpage, roomService, "room");
		 
		 int start = (Integer)map.get("start");
		 int end =(Integer)map.get("end");
		 
				 
		 ArrayList<Object> olist = roomService.getReserveList(start, end);
		 ArrayList<ReservationVO> list =new ArrayList<ReservationVO>();
			 for(Object obj :olist) {
				 ReservationVO vo = (ReservationVO)obj;
				 list.add(vo);
			 }
			 
		 mv.setViewName("admin/admin_booked");
		 mv.addObject("list", list);
		 mv.addObject("dbcount", map.get("dbCount"));
		 mv.addObject("rpage", map.get("rpage"));
		 mv.addObject("pagesize", map.get("pageSize"));
		
		return mv;
	}
	
	@RequestMapping(value="/admin_booked_cancel_proc.do", method=RequestMethod.GET)
	public ModelAndView corppage_info_pass(String rsid) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = roomService.getCancelResult(rsid);
	  	
	  	
	  	if(result){
	  		mv.setViewName("redirect:/admin_booked.do");
	  	}
		
		
		
		return mv;
	}

	@RequestMapping(value="/admin_inquiry.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		 Commons commons= new Commons();
		 HashMap map = commons.getPage(rpage, inquiryService, "inquiry");
		 
		 int start = (Integer)map.get("start");
		 int end =(Integer)map.get("end");
		 ArrayList<Object> olist = inquiryService.getListAll(start, end);
		 ArrayList<InquiryVO> list =new ArrayList<InquiryVO>();
			 for(Object obj :olist) {
				 InquiryVO vo = (InquiryVO)obj;
				 list.add(vo);
			 }
			 
		 mv.setViewName("admin/admin_inquiry");
		 mv.addObject("list", list);
		 mv.addObject("dbcount", map.get("dbCount"));
		 mv.addObject("rpage", map.get("rpage"));
		 mv.addObject("pagesize", map.get("pageSize"));
		
		
		
		
		
		return mv;
	}
	
	@RequestMapping(value="/admin_inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_content(String qid) {
		ModelAndView mv = new ModelAndView();
		
		InquiryVO vo = inquiryService.getContent(qid);	
		
		mv.setViewName("admin/admin_inquiry_content");
		mv.addObject("vo",vo);
		
		return mv;
		
	}
	
	@RequestMapping(value="/admin_inquiry_write.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_write(String qid) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("admin/admin_inquiry_write");
		mv.addObject("qid", qid);
		
		return mv;
	}
	
	@RequestMapping(value="/admin_inquiry_write_proc.do", method=RequestMethod.POST)
	public ModelAndView admin_inquiry_write(String qid,String acontent) {
		ModelAndView mv = new ModelAndView();
		
		boolean result = inquiryService.getUpdateResult(qid,acontent);
	
		if(result) {
		mv.setViewName("redirect:/admin_inquiry.do");
		}
		return mv;
	}

}
