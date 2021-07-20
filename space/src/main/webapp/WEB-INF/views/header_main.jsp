<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "com.myspace.vo.SessionVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	SessionVO svo = (SessionVO)session.getAttribute("svo");
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
//gnb
$(function(){
	var gnb = $('#gnb'),
		gnbDepth01 = $('.depth1 h3 a'),
		gnbDepth02 = $('.depth2 h4 a'),
		depth01 = $('.depth1'),
		depth02 = $('.depth2'),
		depth02li = $('.depth2 li'),
		gnbBg = $('.header_bg_box'),
		gnbSpeed = 250,
		logo = $('.logo a img'),
		logot = $('.logo'),
		logoSrc,
		gnbEtc = $('.gnb_etc');

	gnb.on('mouseenter', function(){
		gnb.addClass('on');
		logot.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
	});
	gnb.on('mouseleave', function(){
		gnb.removeClass('on');
		logot.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});

	gnbDepth01.on('mouseenter focusin', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
		depth01.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		depth02.slideUp(gnbSpeed);
		$(this).parents('.depth1').find('.depth2').slideDown(gnbSpeed);
	});
	gnbDepth01.on('mouseleave focusout', function(){
		depth01.removeClass('focus');
	});

	gnbDepth02.on('mouseenter focusin', function(){
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		$(this).parent().parent().addClass('focus');
	});

	gnbDepth02.on('mouseleave focusout', function(){
		$(this).parent().parent().removeClass('focus');
	});

	depth01.last().find('.depth2').find('li').last().find('h4').find('a').on('focusout', function(){
		gnb.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});
});
</script>
</head>
<body>
	<header>
		<!-- s header -->
	<div id="header">
		<div class="header_inner">
				<h1 class="logo"><a href="http://localhost:9000/space/index.do"><img src="http://localhost:9000/space/images/logo_off.png" width=30px; height=27px;>스페이스닷컴</a></h1>
		
			
			<ul id="gnb">
			
				<li class="depth1"><h3><a href="http://localhost:9000/space/introduce.do">스페이스닷컴<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="http://localhost:9000/space/introduce.do">스페이스닷컴 소개</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/guide.do">이용 안내</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/partner.do">파트너 등록 안내</a></h4></li>
					</ul>
				</li>
				
				<li class="depth1"><h3><a href="#">회의실<span class="gnb_bar"></span></a></h3>
				</li>
				
				<li class="depth1"><h3><a href="#">화상 회의실<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="#">화상 회의실 찾기</a></h4></li>
						<li><h4><a href="#">화상 장비 렌탈</a></h4></li>
						<li><h4><a href="#">영상녹화 스튜디오 찾기</a></h4></li>
						<li><h4><a href="#">영상녹화 소프트웨어</a></h4></li>
					</ul>
				</li>
				
				<li class="depth1"><h3><a href="http://localhost:9000/space/notice.do?rpage=1">고객센터<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="http://localhost:9000/space/notice.do?rpage=1">공지사항</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/faq.do?rpage=1">자주묻는 질문</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/mypage_inquiry.do">1:1 문의</a></h4></li>
					</ul>
				</li>
				
			</ul>
			
			<c:choose>
				<c:when test="${sessionScope.svo != null }">
				<ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/logout.do">로그아웃</a></li>
					<li><a href="#">나의 회의실</a></li>
					<c:if test="${sessionScope.svo.id=='admin@naver.com' }">     	
					<li><a href="http://localhost:9000/space/admin.do">Admin</a></li>
					</c:if>
				</ul >	
				<ul class="gnb_etc hi" >
					<li><a href="#">안녕하세요 ${sessionScope.svo.name }님 환영합니다</a></li>
				</ul>
				</c:when>
				<c:otherwise>
				<ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/login.do">로그인</a></li>
					<li><a href="http://localhost:9000/space/join_main.do">회원가입</a></li>
					<li><a href="#">나의 회의실</a></li>
				</ul>
				</c:otherwise>
			</c:choose>
			
			
<%-- 			<% if(svo == null){ %>
				<ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/login.do">로그인 </a></li>
					<li><a href="http://localhost:9000/space/join_main.do">회원가입 </a></li>
					<li><a href="#">나의 회의실</a></li>
				</ul>
			<% }else{ %>
				<%if(svo.getId().equals("admin@naver.com")) {%>
					<ul class="gnb_etc">
						<li><a href="http://localhost:9000/space/logout.do">로그아웃 </a></li>
						<li><a href="#">Admin </a></li>
					</ul>
				<%}else {%>
					<ul class="gnb_etc">
						<li><a href="http://localhost:9000/space/logout.do">로그아웃 </a></li>
						<li><a href="#">나의 회의실</a></li>
					</ul>
				<% } %>
			<% } %> --%>
			
			
			<!-- <ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/join_main.do">회원가입</a></li>
					<li><a href="http://localhost:9000/space/login.do">로그인</a></li>
					<li><a href="#">나의 회의실</a></li>
			</ul> -->

			<form id="logout-form" action="#" method="POST" style="display: none;">
				<input type="hidden" name="_token" value="JG5lgwlj2eG3zfWUYfpnf9hNuVbiZPMNDhRvYBQz">			</form>
		</div>
		<div class="header_bg_box"></div>
	</div>
	<!-- e header -->
	
	
	</header>
</body>
</html>