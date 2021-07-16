package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.FaqVO;

@Repository
public class FaqDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.faq";

	
	//select ---> 페이징을 위한 전체 로우수
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".faqcount");
				
	}

	//select ---> 공지사항 전체리스트
	public ArrayList<Object> getList(int start, int end){
		Map param = new HashMap<String, String>();
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<Object> list= sqlSession.selectList(namespace+".faqlist",param); 
		
		return (ArrayList<Object>)list;
	}

}
