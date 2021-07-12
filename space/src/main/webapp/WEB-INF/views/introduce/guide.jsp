<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/introduce.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.js"></script>
<script>
$(function(){
	var initViewTop = $(window).scrollTop(),
		initViewHeight = $(window).outerHeight(true),
		initViewBottom = initViewTop + initViewHeight;

	$('.s_obj').each(function(){
		var initElementTop = $(this).offset().top,
			initElementHeight = $(this).outerHeight(),
			initElementBottom = initElementTop + initElementHeight;

		if(((initElementTop <= initViewBottom) && (initElementBottom >= initViewTop))) {
			$(this).removeClass('active');
		} else {
			$(this).addClass('active');
		}
	});

	$(window).on("mousewheel scroll", function(){
		var viewTop = $(this).scrollTop(),
			viewHeight = $(this).outerHeight(true),
			viewBottom = viewTop + viewHeight;

		$('.s_obj').each(function(){
			var elementTop = $(this).offset().top,
				elementHeight = $(this).outerHeight(),
				elementBottom = elementTop + elementHeight;

			if(((elementTop <= viewBottom) && (elementBottom >= viewTop))) {
				$(this).removeClass('active');
			}
			// else {
			// 	$(this).addClass('active');
			// }
		});
	});
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	

	<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
				<!-- s sub_visual -->
		<div class="sub_visual introduce">
			<h3>스페이스닷컴은
				<span>회의실 운영 전문가들이 파트너사를 대신하여 회의시설 보유자와 <br>
                    이용고객을 이어주는 국내 최초 회의실 매칭 플랫폼입니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_tab -->
		<div class="sub_tab_box">
			<ul class="sub_tab">
				<li><a href="http://localhost:9000/space/introduce.do">스페이스닷컴 소개</a></li>
				<li class="on"><a href="#">이용안내</a></li>
				<li><a href="http://localhost:9000/space/partner.do">파트너 등록 안내</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_useguide01">
			<div class="center_box">
				<p class="sub_section_useguide01_tit motion s_obj right_obj02 active">스페이스닷컴 <span>이용안내</span></p>
				<p class="sub_section_useguide01_text motion02 s_obj opa_obj01 active">스마트폰 앱을 설치하면 더욱 편리하게 회의실 예약을 이용할 수 있습니다.</p>
				<div class="sub_section_useguide01_list_box">
					<ul class="sub_section_useguide01_list">
						<li><div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>01</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">앱 설치/ 홈페이지 접속</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">홈페이지 접속 혹은 앱스토어에서 회의실닷컴을 검색해 <br>
								앱을 설치해주세요.
							</p>
							<div class="sub_section_useguide01_list_app_btnbox">
								<a href="#" target="_blank"><img src="http://localhost:9000/space/images/sub_section_useguide01_list_btnimg01.png" alt=""></a>
								<a href="#" target="_blank"><img src="http://localhost:9000/space/images/sub_section_useguide01_list_btnimg02.png" alt=""></a>
							</div>
						</li>
						<li class="type02"><span class="sub_section_useguide01_list_bar sub_section_useguide01_list_bar01"></span>
							<div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>02</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">회원가입</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">간편가입을 이용하여 회원가입을 완료합니다.
							</p>
							<p class="sub_section_useguide01_list_tip_text motion02 s_obj opa_obj01 active"><span class="sub_section_useguide01_list_tip_text01">tip</span>
								<span class="sub_section_useguide01_list_tip_text02">기업회원으로 가입 시 회사 내부에 다양한 인원이 <br>
                                    회의실 예약을 하고 한번에 결제가 가능합니다.
                                </span>
							</p>
						</li>
						<li class="type02"><span class="sub_section_useguide01_list_bar sub_section_useguide01_list_bar02"></span>
							<div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>03</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">회의실 예약</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">검색을 통해 원하는 회의실을 찾고 대여 시간을
								설정해 간편하게 예약합니다.
							</p>
						</li>
					</ul>
					<ul class="sub_section_useguide01_list">
						<li><div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>04</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">회의실 결제</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">예약승인이 완료되면 회의실 이용요금을 결제합니다.
							</p>
							<p class="sub_section_useguide01_list_tip_text motion02 s_obj opa_obj01 active"><span class="sub_section_useguide01_list_tip_text01">tip</span>
								<span class="sub_section_useguide01_list_tip_text02">가맹점 별로 결제 방법이 상이할 수 있습니다. (온라인결제 / 현장결제)
                                </span>
							</p>
						</li>
						<li class="type02"><span class="sub_section_useguide01_list_bar sub_section_useguide01_list_bar03"></span>
							<div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>05</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">회의실 이용</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">예약한 회의실을 편리하게 이용합니다.
							</p>
						</li>
						<li class="type02"><span class="sub_section_useguide01_list_bar sub_section_useguide01_list_bar04"></span>
							<div class="sub_section_useguide01_list_num motion s_obj bottom_obj01 active"><span class="sub_section_useguide01_list_num01"><span>06</span></span></div>
							<span class="sub_section_useguide01_list_tit motion s_obj right_obj02 active">이용후기 작성 및 포인트 적립</span>
							<p class="sub_section_useguide01_list_text motion02 s_obj opa_obj01 active">회의실 이용 시 느꼈던 후기를 작성하고 포인트를 적립합니다.
							</p>
							<p class="sub_section_useguide01_list_tip_text motion02 s_obj opa_obj01 active"><span class="sub_section_useguide01_list_tip_text01">tip</span>
								<span class="sub_section_useguide01_list_tip_text02">개인회원의 경우 상품권으로 교환이 가능하며 기업회원은 대관료에서 <br>
                                    포인트 만큼 차감하여 사용이 가능합니다.
                                </span>
							</p>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- e sub_section -->
	</div>
	<!-- e container -->
	
		<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>


</body>
</html>