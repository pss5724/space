package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "mapper.notice";
	
	//Delete 진행시 upload된 파일 삭제를 위해 파일명 가져오기
	public String getFile(String nid){
		return sqlSession.selectOne(namespace+".nsfile", nid);
	}
	
	//delete --> 공지사항 삭제
	public boolean getDeleteResult(String nid) {
		boolean result = false ;
		int value = sqlSession.delete(namespace+".delete", nid);
		if(value != 0) result=true;
		return result;
	}
	
	//update ---> 공지사항 업데이트 : 기존파일 유지
	public boolean getUpdateResultNofile(NoticeVO vo){
		boolean result = false;
		int value = sqlSession.update(namespace+".updatenofile", vo);
		if(value != 0) result= true;
		
		return result;
	}


	//update ---> 공지사항 업데이트 : 새로운 파일 선택
	public boolean getUpdateResult(NoticeVO vo){
		boolean result = false;
		int value = sqlSession.update(namespace+".updatefile", vo);
		if(value != 0) result= true;
		
		return result;
	}
	
	
	//update-- > 공지사항 조회수 업데이트
	public void getUpdateHit(String nid){
		sqlSession.update(namespace+".updatehit", nid);
	}
	
	//select --> 공지사항 상세정보
	public NoticeVO getContent(String nid) {
		return sqlSession.selectOne(namespace+".content", nid);
	}
	
	
	//select ---> 페이징을 위한 전체 로우수
	public int execTotalCount() {
		return sqlSession.selectOne(namespace+".count");
				
	}
	//select ---> 공지사항 상세페이지 이전글
	public ArrayList<Object> getnextList(int rno){
		List<Object> list= sqlSession.selectList(namespace+".nextlist", rno); 
		
		return (ArrayList<Object>)list;
	}

	//select ---> 공지사항 전체리스트
	public ArrayList<Object> getList(int start, int end){
		Map param = new HashMap<String, String>();
		param.put("start", start);
		param.put("end", end);
		
		List<Object> list= sqlSession.selectList(namespace+".list",param); 
		
		return (ArrayList<Object>)list;
	}
	
	
	// insert --> 공지사항 글쓰기
	public boolean getInsertResult(NoticeVO vo) {
		boolean result = false;
		int value = sqlSession.insert(namespace+".insert", vo);
		if(value != 0) result=true;
		return result;
	}

}
