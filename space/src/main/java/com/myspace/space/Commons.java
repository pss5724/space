package com.myspace.space;

import java.util.HashMap;

import com.myspace.service.FaqService;
import com.myspace.service.NoticeService;

public class Commons {
	//페이징 처리 메소드
	public HashMap<String,Integer> getPage(String rpage, Object obj, String name){
		HashMap<String, Integer>map = new HashMap<String, Integer>();
	
	
	//페이징 처리 - startCount, endCount 구하기
	int startCount = 0;
	int endCount = 0;
	int listend = 0;
	int pageSize = 15;	//한페이지당 게시물 수
	int reqPage = 1;	//요청페이지	
	int pageCount = 1;	//전체 페이지 수
	int dbCount = 0;	//DB에서 가져온 전체 행수
	
	if(name.equals("notice")) {
		NoticeService noticeService =(NoticeService)obj;
		dbCount = noticeService.execTotalCount();
	} 
	else if(name.equals("faq")) {
		FaqService faqService =(FaqService)obj;
		dbCount = faqService.execTotalCount();
	} 
	
	//총 페이지 수 계산
	if(dbCount % pageSize == 0){
		pageCount = dbCount/pageSize;
	}else{
		pageCount = dbCount/pageSize+1;
	}
	
	//요청 페이지 계산
	if(rpage != null){
		reqPage = Integer.parseInt(rpage);
		startCount = (reqPage-1) * pageSize+1;
		endCount = reqPage *pageSize;
	}else{
		startCount = 1;
		endCount = 5;
	}
	
	
	System.out.println(startCount);
	map.put("start", startCount);
	map.put("end", endCount);
	map.put("dbCount", dbCount);
	map.put("pageSize", pageSize);
	map.put("rpage", reqPage);
	
	
	//BoardDAO dao = new BoardDAO();
	//ArrayList<BoardVO> list = dao.getList();
	
	return map;
	}
}	
	
	
	
	
	
	
	
	
	
	
	
	
