package com.myspace.space;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.InquiryService;
import com.myspace.vo.InquiryVO;

@Controller
public class MypageController {

	@Autowired
	private InquiryService inquiryService;
	
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
	
	@RequestMapping(value="/mypage_info.do", method=RequestMethod.GET)
	public String mypage_info() {
		return "mypage/mypage_info";
	}
	
	@RequestMapping(value="/mypage_info_pass.do", method=RequestMethod.GET)
	public String mypage_info_pass() {
		return "mypage/mypage_info_pass";
	}

	@RequestMapping(value="/mypage.do", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}

	@RequestMapping(value="/mypage_inquiry.do", method=RequestMethod.GET)
	public ModelAndView mypage_inquiry() {
		ModelAndView mv = new ModelAndView();
		
		ArrayList<InquiryVO> list = inquiryService.getList();
		
		mv.setViewName("mypage/mypage_inquiry");
		mv.addObject("list",list);
		
		
		
		return mv;
	}

}
