<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.myspace.dao.*, com.myspace.vo.*" %>
<jsp:useBean id="vo" class="com.myspace.vo.MemberVO" />
<jsp:setProperty name="vo" property="*" />
<% 
	//로그인 폼에서 넘어오는 데이터 받기
	MemberDAO dao = new MemberDAO();
	SessionVO svo = dao.getLoginResult(vo);
	
	if(svo.getResult() == 1) {
		//로그인 성공 시 ----> svo 객체에 아이디, 회원명, 로그인 결과 포함
		svo.setId(vo.getId());
		session.setAttribute("svo", svo); 
		response.sendRedirect("../index.jsp");
	} else {
		response.sendRedirect("loginFail.jsp");		
	}
	
%>
