package com.myspace.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.ReservationVO;
import com.myspace.vo.ReviewVO;


@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="mapper.review";
	
	//예약번호로 예약 내역 체크
		public ReservationVO getSearchResult(String id, String rsid){
			boolean result = false;
			Map param = new HashMap<String,String>();
			param.put("id", id);
			param.put("rsid", rsid);
			
			ReservationVO revo = sqlSession.selectOne(namespace+".search", param);
			
			
			
			return revo;
		}
		
	//리뷰 받아오기
		public ReviewVO getReviewContent(String id, String rsid) {
			Map param = new HashMap<String,String>();
			param.put("id", id);
			param.put("rsid", rsid);
			
			ReviewVO vo = sqlSession.selectOne(namespace+".content", param);
			
			
			return vo;
		}
		
	//리뷰 작성
			public boolean getInsertResult(ReviewVO vo) {
				boolean result =false;
				
				int value = sqlSession.insert(namespace+".insert",vo);
				if(value != 0) {
					
					result=true;
				}
					
					
				return result;
			}
			
	//리뷰 수정
			public boolean getUpdateResult(ReviewVO vo) {
				boolean result =false;
				
				int value = sqlSession.update(namespace+".update",vo);
				if(value != 0) {
					
					result=true;
				}
					
					
				return result;
			}
		
	//리뷰 삭제
			public boolean getDeleteResult(String id, String rsid) {
				boolean result =false;
				
				Map param = new HashMap<String,String>();
				param.put("id", id);
				param.put("rsid", rsid);
				
				int value = sqlSession.update(namespace+".delete",param);
				if(value != 0) {
					
					result=true;
				}
					
					
				return result;
			}
			
	//리뷰 등록시 해당 회의실에 평점 평균 업데이트, 리뷰 수 업데이트
			public boolean insertTotallv(ReviewVO vo) {
				boolean result = false;
				
				int value = sqlSession.update(namespace+".updatetotallv",vo);
				if(value != 0) {
					result=true;
				}
				
				return result;
			}
			
	
}
