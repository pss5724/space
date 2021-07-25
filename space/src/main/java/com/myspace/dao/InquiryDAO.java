package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.InquiryVO;

@Repository
public class InquiryDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.inquiry";
	
	//전체 로우수
	
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
	}
	
	//문의 사항 답변
	public boolean getUpdateResult(String qid, String acontent){
		boolean result = false;
		
		Map param = new HashMap<String, String>();
		param.put("qid", qid);
		param.put("acontent",acontent);
	
		int value = sqlSession.update(namespace+".inquiryupdate", param);
		if(value != 0) result = true;
		return result;
	}
	//문의사항 리스트
	
	public ArrayList<InquiryVO> getList(String id){
		List<InquiryVO> list = sqlSession.selectList(namespace+".list",id);
		
		return (ArrayList<InquiryVO>)list;
	}
	
	public ArrayList<Object> getListAll(int start, int end){
		Map param = new HashMap<String, String>();
		param.put("start", start);
		param.put("end", end);
		
		List<Object> list = sqlSession.selectList(namespace+".listall",param);
		
		return (ArrayList<Object>)list;
	}
	
	//문의사항 상세페이지
	public InquiryVO getContent(String qid) {
		return sqlSession.selectOne(namespace+".content",qid);
	}
	
	//insert 문의사항 글쓰기
		public boolean getInsertResult(InquiryVO vo){
			boolean result = false;
			int value = sqlSession.insert(namespace+".insert", vo);
			if(value != 0) result = true;
			return result;
		}
}
