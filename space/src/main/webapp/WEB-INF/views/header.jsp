<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.myspace.vo.SessionVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
$(document).ready(function(){
	var gnb = $('#gnb'),
	gnbDepth01 = $('.depth1 h3 a'),
	gnbDepth02 = $('.depth2 h4 a'),
	depth01 = $('.depth1'),
	depth02 = $('.depth2'),
	depth02li = $('.depth2 li'),
	gnbBg = $('.header_bg_box'),
	gnbEtc = $('.gnb_etc');logot = $('.logo'),
	logot = $('.logo'),
	gnb.addClass('on');
	gnbBg.addClass('on');
	gnbEtc.addClass('on');
	logot.addClass('on');
});
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
		logoSrc,
		gnbEtc = $('.gnb_etc');

	gnb.on('mouseenter', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
	});
	gnb.on('mouseleave', function(){
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
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
			<h1 class="logo"><a href="http://localhost:9000/space/index.do"><img src="http://localhost:9000/space/images/logo_on.png" width=30px; height=27px;>????????????</a></h1>
		
			
			<ul id="gnb">
			
				<li class="depth1"><h3><a href="http://localhost:9000/space/introduce.do">????????????<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="http://localhost:9000/space/introduce.do">???????????? ????</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/guide.do">???? ????</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/partner.do">?????? ???? ????</a></h4></li>
					</ul>
				</li>
				
				<li class="depth1"><h3><a href="http://localhost:9000/space/room_list.do">??????<span class="gnb_bar"></span></a></h3>
				</li>
				
<!-- 				<li class="depth1"><h3><a href="#">???? ??????<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="#">???? ?????? ????</a></h4></li>
						<li><h4><a href="#">???? ???? ????</a></h4></li>
						<li><h4><a href="#">???????? ???????? ????</a></h4></li>
						<li><h4><a href="#">???????? ??????????</a></h4></li>
					</ul>
				</li> -->
				
				<li class="depth1"><h3><a href="http://localhost:9000/space/notice.do?rpage=1">????????<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="http://localhost:9000/space/notice.do?rpage=1">????????</a></h4></li>
						<li><h4><a href="http://localhost:9000/space/faq.do?rpage=1">???????? ????</a></h4></li>
						<c:if test="${sessionScope.svo.position==0 }">
						<li><h4><a href="http://localhost:9000/space/mypage_inquiry.do">1:1 ????</a></h4></li>
						</c:if>
						<c:if test="${sessionScope.svo.position==1 }">
						<li><h4><a href="http://localhost:9000/space/corppage_inquiry.do">1:1 ????</a></h4></li>
						</c:if>
							<c:if test="${sessionScope.svo.position==2 }">
						<li><h4><a href="http://localhost:9000/space/admin_inquiry.do">1:1 ????</a></h4></li>
						</c:if>
					</ul>
				</li>
				
			</ul>
			
			<c:choose>
				<c:when test="${sessionScope.svo != null }">
				<ul class="gnb_etc">
					<li class="hi">${sessionScope.svo.name }?? ??????????</li>
					<li><a href="http://localhost:9000/space/logout.do">????????</a></li>
					<c:if test="${sessionScope.svo.position==0 }">
					<li><a href="http://localhost:9000/space/mypage.do">???? ??????</a></li>
					</c:if>
					<c:if test="${sessionScope.svo.position==1 }">
					<li><a href="http://localhost:9000/space/corppage.do">???? ??????</a></li>
					</c:if>
					<c:if test="${sessionScope.svo.position==2 }">     	
					<li><a href="http://localhost:9000/space/member_list.do">Admin</a></li>
					</c:if>
				</ul >	
					
				</c:when>
				<c:otherwise>
				<ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/login.do">??????</a></li>
					<li><a href="http://localhost:9000/space/join_main.do">????????</a></li>
<!-- 					<li><a href="http://localhost:9000/space/mypage.do">???? ??????</a></li> -->
				</ul>
				</c:otherwise>
			</c:choose>
			
			
		 	<!-- <ul class="gnb_etc">
					<li><a href="http://localhost:9000/space/join_main.do">????????</a></li>
					<li><a href="http://localhost:9000/space/login.do">??????</a></li>
					<li><a href="#">???? ??????</a></li>
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