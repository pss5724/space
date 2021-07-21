<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.myspace.dao.*"%>
<%
	String id = request.getParameter("id");
	MemberDAO mdao = new MemberDAO();
	boolean result = mdao.getJoinOut(id);
	
	if(result){ 
		//스크립트 alert 구문 넣어야 함..
		 response.sendRedirect("http://localhost:9000/space/admin/member_list.do");
	}else { 
		response.sendRedirect("http://localhost:9000/space/index.do");
	}
%>