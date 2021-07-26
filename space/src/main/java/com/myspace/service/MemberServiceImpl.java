package com.myspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspace.dao.MemberDAO;
import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	 /* @Override public MemberVO getContent(String id) { return
	  memberDAO.getContent(id); }*/
	  
	@Override public ArrayList<MemberVO> getList0(int start, int end) { 
		return memberDAO.getList0(start, end); }
	
	@Override public ArrayList<MemberVO> getList1(int start, int end) { 
		return memberDAO.getList1(start, end); }
	 

	@Override
	public SessionVO getLoginResult(MemberVO vo) {
		System.out.println("로그인 됌!(로그인 처리과정)");
		return memberDAO.getLoginResult(vo);
	}

	@Override
	public boolean getInsertResult0(MemberVO vo) {
		boolean result = false;
		int value = memberDAO.getInsertResult0(vo);
		if(value != 0) result = true;
		return result;
	}
	@Override
	public boolean getInsertResult1(MemberVO vo) {
		boolean result = false;
		int value = memberDAO.getInsertResult1(vo);
		if(value != 0) result = true;
		return result;
	}

	@Override
	public int execTotalCount() {
		return memberDAO.execTotalCount();
	}
	
	@Override
	public boolean getJoinIn(String id) {
		return memberDAO.getJoinIn(id);
	}
	
	@Override
	public boolean getJoinOut(String id) {
		return memberDAO.getJoinOut(id);
	}
	
	@Override
	public boolean getJoinBdelete(String id) {
		return memberDAO.getJoinBdelete(id);
	}
	
	@Override
	public void newPassword(MemberVO vo){
		memberDAO.newPassword(vo);
	}

}
