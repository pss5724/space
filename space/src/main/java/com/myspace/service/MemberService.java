package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;


public interface MemberService {

	/*
	 * MemberVO getContent(String id); ArrayList<MemberVO> getList(int start, int
	 * end);
	 */
	SessionVO getLoginResult(MemberVO vo);
	boolean getInsertResult0(MemberVO vo);
	boolean getInsertResult1(MemberVO vo);
	boolean getInsertResult2(MemberVO vo);
	int execTotalCount();
	
	
}
