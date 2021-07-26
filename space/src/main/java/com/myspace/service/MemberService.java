package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;


public interface MemberService {


	//MemberVO getContent(String id); 
	ArrayList<MemberVO> getList0(int start, int end);
	ArrayList<MemberVO> getList1(int start, int end);
	SessionVO getLoginResult(MemberVO vo);    //로그인처리
	boolean getInsertResult0(MemberVO vo);   //개인
	boolean getInsertResult1(MemberVO vo);    //기업
	int execTotalCount();
	boolean getJoinIn(String id);   //가입승인 & 가입 승인버튼 활성화
	boolean getJoinOut(String id);   //고객이 탈퇴버튼 누르면 admin쪽 list에 탈퇴 승인 버튼 활성화
	boolean getJoinBdelete(String id);   //탈퇴(회원삭제)
	void newPassword(MemberVO vo);
}
