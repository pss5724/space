package com.myspace.service;

import java.util.ArrayList;

import com.myspace.vo.MemberVO;
import com.myspace.vo.SessionVO;


public interface MemberService {


	//MemberVO getContent(String id); 
	ArrayList<MemberVO> getList0(int start, int end);
	ArrayList<MemberVO> getList1(int start, int end);
	SessionVO getLoginResult(MemberVO vo);    //·Î±×ÀÎÃ³¸®
	boolean getInsertResult0(MemberVO vo);   //°³ÀÎ
	boolean getInsertResult1(MemberVO vo);    //±â¾÷
	int execTotalCount();
	boolean getJoinIn(String id);   //°¡ÀÔ½ÂÀÎ
	boolean getJoinDelete(String id);   //Å»Åğ
	boolean getJoinOut(String id);   //°í°´ÀÌ Å»Åğ¹öÆ° ´­·¯¼­ Å»ÅğÃ³¸®
	
	
	
}
