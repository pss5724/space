package com.myspace.space;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.FaqService;
import com.myspace.vo.FaqVO;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService faqService;
	
	/**
	 *  faq_list.do -->자주묻는 질문 리스트 출력
	 */
	@RequestMapping(value="/faq.do", method=RequestMethod.GET)
	public ModelAndView faq_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		//NoticeDAO dao = new NoticeDAO();
		Commons commons= new Commons();
		HashMap map = commons.getPage(rpage, faqService, "faq");
		
		int start = (Integer)map.get("start");
		int end =(Integer)map.get("end");
		ArrayList<Object> olist = faqService.getList(start, end);
		ArrayList<FaqVO> list =new ArrayList<FaqVO>();
		for(Object obj :olist) {
			FaqVO vo = (FaqVO)obj;
			list.add(vo);
		}
		
		mv.setViewName("notice/faq");
		mv.addObject("list", list);
		mv.addObject("dbcount", map.get("dbCount"));
		mv.addObject("rpage", map.get("rpage"));
		mv.addObject("pagesize", map.get("pagesize"));
		
		return mv;
	}

			
}
