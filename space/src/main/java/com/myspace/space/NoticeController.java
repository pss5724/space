package com.myspace.space;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspace.service.NoticeService;
import com.myspace.vo.FaqVO;
import com.myspace.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	/**
	 *  board_write_proc.do -->글작성 proc
	 */
	@RequestMapping(value="/notice_write_proc.do", method=RequestMethod.POST)
	public ModelAndView notice_write_proc(NoticeVO vo, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		String root_path=""; String attach_path="";
		
		if(vo.getFile1().getSize() !=0) {
			//1. 파일 저장 위치
			root_path = request.getSession().getServletContext().getRealPath("/");
			attach_path = "\\resources\\upload\\";
			
			//2. 파일이름 ---> vo에 저장 
			UUID uuid = UUID.randomUUID();
			vo.setNfile(vo.getFile1().getOriginalFilename());
			vo.setNsfile(uuid+"_" +vo.getFile1().getOriginalFilename());
		}
			//3. DB 연동
			//BoardDAO dao = new BoardDAO();
			boolean result = noticeService.getInsertResult(vo);
			
			if(result){
				mv.setViewName("redirect:/notice.do?rpage=1");
			
				if(vo.getFile1().getSize() !=0) {
					//4. DB 연동 성공 ---->upload 폴더에 저장
					File file= new File(root_path + attach_path + vo.getNsfile());
					vo.getFile1().transferTo(file);
				}
			}
		
		return mv;
	}

	/**
	 * notice_delete_proc.do -->삭제 proc
	 */
	@RequestMapping(value="/notice_delete_proc.do", method=RequestMethod.GET)
	public ModelAndView board_delete_proc(String nid, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		//BoardDAO dao = new BoardDAO();
		String old_nsfile = noticeService.getFile(nid);
		boolean result = noticeService.getDeleteResult(nid);
		
		if(result){
			mv.setViewName("redirect:/notice.do?rpage=1");
			
			//기존 upload 폴더에 존재하는 파일 삭제
			String root_path = request.getSession().getServletContext().getRealPath("/");
			String attach_path="\\resources\\upload\\";
			File old_file= new File(root_path+attach_path+old_nsfile);
			if(old_file.exists()) {
				old_file.delete();
			}
		}
			return mv;
	}
	/**
	 *  notice_update.do -->공지사항 업데이트화면 출력
	 */
	@RequestMapping(value="/notice_update.do", method=RequestMethod.GET)
	public String notice_update() {
		return "notice/notice_update";
	}
	/**
	 *  notice_write.do -->공지사항 글쓰기화면 출력
	 */
	@RequestMapping(value="/notice_write.do", method=RequestMethod.GET)
	public String notice_write() {
		return "notice/notice_write";
	}
	/**
	 *  notice_content.do -->공지사항 상세내용 출력
	 */
	@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content(String nid, int rno) {
		ModelAndView mv = new ModelAndView();
		//NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = (NoticeVO)noticeService.getContent(nid);
		if(vo !=null) noticeService.getUpdateHit(nid);
		String content = vo.getNcontent().replace("\r\n","<br>");
		
		 ArrayList<Object> olist = noticeService.getnextList(rno);
		 ArrayList<NoticeVO> list =new ArrayList<NoticeVO>();
			 for(Object obj :olist) {
				 NoticeVO vo2 = (NoticeVO)obj;
				 list.add(vo2);
			 }
		
		mv.setViewName("notice/notice_content");
		mv.addObject("vo", vo);
		mv.addObject("content", content);
		mv.addObject("list", list);
		return mv;
	}

	/**
	 *  notice_list.do -->공지사항 리스트 출력
	 */
	@RequestMapping(value="/notice.do", method=RequestMethod.GET)
		public ModelAndView notice_list(String rpage) {
			ModelAndView mv = new ModelAndView();
			//NoticeDAO dao = new NoticeDAO();
			 Commons commons= new Commons();
			 HashMap map = commons.getPage(rpage, noticeService, "notice");
			 
			 int start = (Integer)map.get("start");
			 int end =(Integer)map.get("end");
			 ArrayList<Object> olist = noticeService.getList(start, end);
			 ArrayList<NoticeVO> list =new ArrayList<NoticeVO>();
				 for(Object obj :olist) {
					 NoticeVO vo = (NoticeVO)obj;
					 list.add(vo);
				 }
				 
			 mv.setViewName("notice/notice");
			 mv.addObject("list", list);
			 mv.addObject("dbcount", map.get("dbCount"));
			 mv.addObject("rpage", map.get("rpage"));
			 mv.addObject("pagesize", map.get("pagesize"));
			
			return mv;
	}
	


			
}
