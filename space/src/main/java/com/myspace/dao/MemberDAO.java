package com.myspace.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static String namespasce="mapper.member";
	
	public MemberVO getInfo(String id) {
		return sqlSession.selectOne(namespasce+".info",id); 
	}
	
	public boolean getPassChangeResult(String new_pass,String id) {
	
		boolean result = false;
		
		Map param =new HashMap<String,String>();
		param.put("new_pass", new_pass);
		param.put("id", id);
		
		int value = sqlSession.update(namespasce+".passChange",param);
		if(value != 0) result= true;
		
		
		return result;
		
		
	}
	
	// 전체 카운트 가져오기(<!-- 전체 ROW 수 -->)
	public int execTotalCount(){
		return sqlSession.selectOne(namespasce+".count");
	}
	
	//개인 회원가입
	public int getInsertResult0(MemberVO vo) {
		return sqlSession.insert(namespasce+".join_per", vo);   
	}
	//기업 회원가입
	public int getInsertResult1(MemberVO vo) {
		return sqlSession.insert(namespasce+".join_cor", vo);    
	}

	//로그인 처리 
	public SessionVO getLoginResult(MemberVO vo) {
		return sqlSession.selectOne(namespasce+".login", vo);  //디비연결후 매퍼호출한 결과 리턴
	}
	
	//비밀번호 찾기
	public void newPassword(MemberVO vo) {
		sqlSession.update(namespasce+".newPassword",vo);
	}
	
	// 관리자페이지 - 사용자 가입승인 처리하기 : choicein을 0에서 1로 바꾸기 
	public boolean getJoinIn(String id) {
		boolean result = false;
		int value = sqlSession.update(namespasce + ".cor_joinin", id);
		if(value != 0) result = true;  
		System.out.println(value);
		
		
		return result;
		
		/*String sql = "update space_member set choicein=1 where id = ?";
		getPreparedStatement(sql);
		try {
			pstmt.setString(1, id);
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;*/
	}
	
	
	// 관리자페이지 - 사용자 탈퇴 처리하기
	public boolean getJoinOut(String id) {
		boolean result = false;
		int value = sqlSession.update(namespasce + ".member_joinout", id);
		if(value != 0) result = true;  
		
		return result;
		
		/*String sql = "delete from space_member where id=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, id);
			int value = pstmt.executeUpdate();
			if(value !=0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();		}
		close();
		return result;*/
	}
	
	// 관리자페이지 - 탈퇴 버튼 활성화 : choiceout을 0에서 1로 바꾸기 
	public boolean getJoinBdelete(String id) {
		boolean result = false;
		int value = sqlSession.delete(namespasce+".joinout_btn_able", id);
		if(value != 0) result = true;	//리턴타입 안맞으니까
		
		return result;
		
		/*String sql = "update space_member set choiceout=1 where id = ?";
		getPreparedStatement(sql);
		try {
			pstmt.setString(1, id);
			int value = pstmt.executeUpdate();
			
			if(value != 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		close();
		return result;*/
	}
	
	
	 //개인 회원 전체 리스트 :: 페이징 
	 public ArrayList<MemberVO> getList0(int start, int end) {
		 Map param = new HashMap<String, String>(); 
		 param.put("start", start);
		 param.put("end", end); 
		 List<MemberVO> plist = sqlSession.selectList(namespasce+".plist", param);
		 
		 return (ArrayList<MemberVO>)plist; 
	 }
	 //기업 회원 전체 리스트 :: 페이징 
	 public ArrayList<MemberVO> getList1(int start, int end) {
		 Map param = new HashMap<String, String>(); 
		 param.put("start", start);
		 param.put("end", end); 
		 List<MemberVO> clist = sqlSession.selectList(namespasce+".clist", param);
		 
		 return (ArrayList<MemberVO>)clist; 
	 }
	 
	 //회원 상세정보 
	// public MemberVO getContent(String id) { 
		// return sqlSession.selectOne(namespasce+".content", id); }
	 
			

}
