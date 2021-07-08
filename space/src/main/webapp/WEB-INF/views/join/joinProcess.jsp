<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.space.dao.MemberDAO, com.space.vo.MemberVO" %>

<jsp:useBean id="vo" class="com.space.vo.MemberVO" />
<jsp:setProperty name="vo" property="*"></jsp:setProperty> 
<!-- 아스타를 통해 넘어오는 모든 것을 자동으로 매핑할 수 있음. 넘어오는 name과 vo객체의 필드이름이 반드시! 같아야함 -->

<%-- <jsp:setProperty name="joinBean" property="id" value="id"></jsp:setProperty> --%>
<!--
	property="id" ====> setId
	value ====> request.getParameter("xx")  //생략 가능
 -->

<% 
	MemberDAO dao = new MemberDAO();
	boolean join_result = dao.getInsertResult(vo);
	dao.close();
	
	if(join_result == true) {
		response.sendRedirect("joinSuccess.jsp");
	} else {
		response.sendRedirect("../errorPage.jsp");
	}

%>
