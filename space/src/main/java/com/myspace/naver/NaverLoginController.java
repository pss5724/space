package com.myspace.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}


	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		return "login/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naverLoginSuccess.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		model.addAttribute("result", apiResult);
		return "login/naverLoginSuccess";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session) throws IOException {
		System.out.println("여기는 logout");
		session.invalidate();
		return "redirect:index.jsp";
	}

	// 네이버 연동정보 조회
	/*
	 * @RequestMapping(value = "/login/oauth_naver") public String
	 * oauthNaver(HttpServletRequest request, HttpServletResponse response) throws
	 * Exception {
	 * 
	 * JSONParser parser = new JSONParser(); Gson gson = new Gson();
	 * 
	 * HttpSession session = request.getSession(); String code =
	 * request.getParameter("code"); String state = request.getParameter("state");
	 * String error = request.getParameter("error");
	 * 
	 * // 로그인 팝업창에서 취소버튼 눌렀을경우 if ( error != null ){
	 * if(error.equals("access_denied")){ return "redirect:/login"; } }
	 * 
	 * OAuth2AccessToken oauthToken; oauthToken =
	 * naverLoginBO.getAccessToken(session, code, state); //로그인 사용자 정보를 읽어온다. String
	 * loginInfo = naverLoginBO.getUserProfile(session, oauthToken);
	 * 
	 * // JSON 형태로 변환 Object obj = parser.parse(loginInfo); JSONObject jsonObj =
	 * JSONObject.fromObject(gson.toJson(obj)); JSONObject callbackResponse =
	 * (JSONObject) jsonObj.get("response"); String naverUniqueNo =
	 * callbackResponse.get("id").toString();
	 * 
	 * if (naverUniqueNo != null && !naverUniqueNo.equals("")) {
	 * 
	 * /**
	 * 
	 * TO DO : 리턴받은 naverUniqueNo 해당하는 회원정보 조회 후 로그인 처리 후 메인으로 이동
	 * 
	 */

	// 네이버 정보조회 실패
	/*
	 * } else { throw new ErrorMessage("네이버 정보조회에 실패했습니다."); }
	 * 
	 * }
	 */
}
