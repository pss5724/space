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

	/*
	 * @Override public MemberVO getContent(String id) { return
	 * memberDAO.getContent(id); }
	 * 
	 * @Override public ArrayList<MemberVO> getList(int start, int end) { return
	 * memberDAO.getList(start, end); }
	 */

	@Override
	public SessionVO getLoginResult(MemberVO vo) {
		System.out.println("멤버서비스 클래스 실행 완~");
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
	public boolean getInsertResult2(MemberVO vo) {
		boolean result = false;
		int value = memberDAO.getInsertResult2(vo);
		if(value != 0) result = true;
		return result;
	}

	@Override
	public int execTotalCount() {
		return memberDAO.execTotalCount();
	}

}
