package com.myspace.space;

import java.io.File;
import java.util.ArrayList;
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
import com.myspace.service.ReviewService;
import com.myspace.service.RoomService;
import com.myspace.vo.InquiryVO;
import com.myspace.vo.MemberVO;
import com.myspace.vo.ReservationVO;
import com.myspace.vo.ReviewVO;
import com.myspace.vo.SessionVO;

@Controller
public class MypageController {

	@Autowired
	private InquiryService inquiryService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/mypage_inquiry_write.do", method=RequestMethod.GET)
	public String mypage_inquiry_write() {
		return "mypage/mypage_inquiry_write"; 
	}
	
	/**
	 *  mypage_inquiry_write.do 1:1문의 글쓰기 처리
	 */
	@RequestMapping(value="/mypage_inquiry_write_proc.do",method=RequestMethod.POST)
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
	  		mv.setViewName("redirect:/mypage_inquiry.do");
	  		
	  		if(vo.getFile1().getSize() != 0) {
	  		//4. DB연동 성공 --> upload 폴더에 저장
	  		File file = new File(root_path+attach_path+vo.getQsfile());
		  	vo.getFile1().transferTo(file);
	  		}
	  	}
		
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView mypage_inquiry_content(String qid) {
		ModelAndView mv = new ModelAndView();
		
		InquiryVO vo = inquiryService.getContent(qid);	
		
		mv.setViewName("mypage/mypage_inquiry_content");
		mv.addObject("vo",vo);
		
		return mv;
		
	}
	@RequestMapping(value="/mypage_pass_change_proc.do", method=RequestMethod.POST)
	public ModelAndView mypage_pass_change_proc(HttpSession session, String new_pass) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");

		
		boolean result = memberService.getPassChangResult(new_pass,svo.getId());
		if(result) {
			mv.setViewName("redirect:/mypage_info.do");
		}else {
			mv.setViewName("redirect:/mypage_info_pass.do");
		}
			
		
		
		
		
		return mv;
	}
	
	
	@RequestMapping(value="/mypage_info.do", method=RequestMethod.GET)
	public ModelAndView mypage_info(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		
		MemberVO vo = memberService.getInfo(svo.getId());		
		
		mv.setViewName("mypage/mypage_info");
		mv.addObject("vo",vo);
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_info_pass.do", method=RequestMethod.GET)
	public ModelAndView mypage_info_pass(HttpSession session) {

		ModelAndView mv = new ModelAndView();	
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		MemberVO vo = memberService.getInfo(svo.getId());
		
		
		mv.setViewName("mypage/mypage_info_pass");
		mv.addObject("vo",vo);
		
		return mv;
	}

	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ArrayList<ReservationVO> list = roomService.getReservationList(svo.getId());
		
		
		
		mv.setViewName("mypage/mypage");
		mv.addObject("list",list);
		
		
		return mv;
	}
	

	@RequestMapping(value="/mypage_inquiry.do", method=RequestMethod.GET)
	public ModelAndView mypage_inquiry(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		ArrayList<InquiryVO> list = inquiryService.getList(svo.getId());
		
		mv.setViewName("mypage/mypage_inquiry");
		mv.addObject("list",list);
		
		
		
		return mv;
	}
	

	@RequestMapping(value="/mypage_review.do", method=RequestMethod.GET)
	public String mypage_review() {
		return "mypage/mypage_review";
	}
	
	@RequestMapping(value="/mypage_review_write.do", method=RequestMethod.GET)
	public ModelAndView mypage_review_write(String id, String rsid) {
		ModelAndView mv = new ModelAndView();
		ReservationVO revo = reviewService.getSearchResult(id,rsid);
		mv.setViewName("mypage/mypage_review_write");
		mv.addObject("revo", revo);
		return mv;
	}
	
	@RequestMapping(value="/mypage_review_update.do", method=RequestMethod.GET)
	public ModelAndView mypage_review_update(String id, String rsid) {
		ModelAndView mv = new ModelAndView();
		ReviewVO vo = reviewService.getReviewContent(id,rsid);
		mv.setViewName("mypage/mypage_review_update");
		mv.addObject("vo", vo);
		return mv;
	}
	
	@RequestMapping(value="/mypage_review_update_proc.do", method=RequestMethod.POST)
	public ModelAndView mypage_review_update_proc(ReviewVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = reviewService.getUpdateResult(vo);
	  	
	  	
	  	if(result){
	  		boolean result2 = reviewService.insertTotallv(vo);
	  		
	  		if(result2) {
	  			mv.setViewName("redirect:/mypage_review.do");
	  			
	  		}
	  	}
		
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_review_write_proc.do", method=RequestMethod.POST)
	public ModelAndView mypage_review_write_proc(ReviewVO vo) {
		ModelAndView mv = new ModelAndView();
		boolean result = reviewService.getInsertResult(vo);
	  	
	  	
	  	if(result){
	  	
	  		boolean result2 = reviewService.insertTotallv(vo);
	  		
	  		if(result2) {
	  			mv.setViewName("redirect:/mypage_review.do");
	  			
	  		}
	  	}
		
		
		return mv;
	}
	
	@RequestMapping(value="/mypage_review_search_proc.do", method=RequestMethod.POST)
	public ModelAndView mypage_review_search_proc(String id, String rsid) {
		ModelAndView mv = new ModelAndView();
		ReservationVO revo = reviewService.getSearchResult(id,rsid);
		if(revo != null) {
			ReviewVO vo = reviewService.getReviewContent(id,rsid);
			mv.setViewName("mypage/mypage_review_content");
			mv.addObject("vo",vo);
			mv.addObject("revo",revo);
			mv.addObject("rsid",rsid);
			
		}else {
			mv.setViewName("redirect:/mypage_review.do");
		}
		
		
		
		return mv;
		
	}
	
	@RequestMapping(value="/mypage_review_delete_proc.do", method=RequestMethod.GET)
	public ModelAndView mypage_review_delete_proc(String id, String rsid) {
		ModelAndView mv = new ModelAndView();
		boolean result = reviewService.getDeleteResult(id, rsid);
	  	
	  	
	  	if(result){
	  		mv.setViewName("redirect:/mypage_review.do");
	  	}
		
		
		return mv;
	}

}
