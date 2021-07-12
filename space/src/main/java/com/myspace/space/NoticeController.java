package com.myspace.space;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
		/**
		 *  notice_write_proc.do -->공지사항 쓰기 Proc
		 */
		@RequestMapping(value="/notice_write.do", method=RequestMethod.POST)
		public String notice_write_proc() {
			return "notice/notice";
		}
		/**
		 *  notice_write.do -->공지사항 쓰기
		 */
		@RequestMapping(value="/notice_write.do", method=RequestMethod.GET)
		public String notice_write() {
			return "notice/notice_write";
		}
		
		/**
		 *  notice_content.do -->공지사항 상세내용 출력
		 */
		@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
		public String notice_content() {
			return "notice/notice_content";
		}
		
		/**
		 * notice.do ---> 공지사항
		 */
		@RequestMapping(value="/notice.do", method=RequestMethod.GET)
		public String notice() {
			return "notice/notice";
		}
		
		/**
		 * faq.do --->자주 묻는 질문
		 */
		@RequestMapping(value="/faq.do", method=RequestMethod.GET)
		public String faq() {
			return "notice/faq";
		}
			
}
