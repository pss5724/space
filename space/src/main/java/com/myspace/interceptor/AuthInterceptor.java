package com.myspace.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.myspace.vo.SessionVO;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	/**
	 * 컨트롤러 실행 전 호출되는 메소드
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//세션정보 가져오기
		HttpSession session = request.getSession();
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		//세션 체크 후 무--> 로그인 화면 이동
		if(svo == null) {
			response.sendRedirect("http://localhost:9000/space/login.do");
			return false;
		}
		
		return true;
	}
}
