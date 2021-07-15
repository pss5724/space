package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.myspace.vo.NoticeVO;

public class FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.faq";

	//select --> 공지사항 상세정보
	public NoticeVO getContent(String nid) {
		return sqlSession.selectOne(namespace+".content", nid);
	}
	
	
	//select ---> 페이징을 위한 전체 로우수
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
				
	}

	//select ---> 공지사항 전체리스트
	public ArrayList<Object> getList(int start, int end){
		Map param = new HashMap<String, String>();
		param.put("start", start);
		param.put("end", end);
		
		List<Object> list= sqlSession.selectList(namespace+".list",param); 
		
		return (ArrayList<Object>)list;
	}

}
