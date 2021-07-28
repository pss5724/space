<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 닷컴</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/introduce.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.js"></script>

<style>


</style>
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


	$(function(){
		var count01 = $('#count01').html(),
			count02 = $('#count02').html(),
			count03 = $('#count03').html();
		count01 = count01.replace(',','');
		count02 = count02.replace(',','');
		count03 = count03.replace(',','');
		var count01Target = new CountUp('count01',0,count01,0,5),
			count02Target = new CountUp('count02',0,count02,0,5),
			count03Target = new CountUp('count03',0,count03,0,5);

		$(window).on('mousewheel scroll', function(){
			var thisTop = $(this).scrollTop(),
				thisHeight = $(this).outerHeight(true),
				thisBottom = thisTop + thisHeight;

			var targetOffsetTop = $('.sub_section_introduce02').offset().top;
			var targetOffsetHeight = $('.sub_section_introduce02').outerHeight();
			var targetOffsetBottom = targetOffsetTop + targetOffsetHeight;

			if(((targetOffsetTop <= thisBottom) && (targetOffsetBottom >= thisTop))) {

				count01Target.start();
				count02Target.start();
				count03Target.start();
			}
		});

	});
	
	
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	
	<!-- content -->

	<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
			<div class="sub_visual introduce">
			<h3>스페이스닷컴은
				<span>쉽고 간편하게 회의시설 보유자와 <br>
                    이용고객을 이어주는 수도권 회의실 매칭 플랫폼입니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_tab -->
		<div class="sub_tab_box">
			<ul class="sub_tab">
				<li class="on"><a href="#">스페이스닷컴 소개</a></li>
				<li><a href="http://localhost:9000/space/guide.do">이용안내</a></li>
				<li><a href="http://localhost:9000/space/partner.do">파트너 등록 안내</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_introduce01">
			<div class="center_box">
				<div class="sub_section_introduce01_img_box motion s_obj opa_obj01 active"><img src="http://localhost:9000/space/images/sub_section_introduce01_img01.jpg" alt=""></div>
				<p class="sub_section_introduce01_tit motion s_obj bottom_obj01 active">
					저희는 고객이 원하는 조건에 맞춰 <br>
					<span>최적의 조건을 갖춘 회의실</span>을 찾고자 노력합니다.</p>
				<p class="sub_section_introduce01_text">
					스페이스닷컴은 손쉽게 회의실을 검색하고 예약할 수 있는 회의실 예약 플랫폼입니다.<br>
					운영자의 꼼꼼한 검토를 통해 승인받은 수도권(서울, 경기, 인천)의 회의실이 등록되어 있으며<br>
					고객은 회의실 검색을 통해 원하는 회의실을 쉽게 찾아 예약할 수 있습니다.</p>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_introduce02">
			<div class="center_box">
				<p class="sub_section_introduce02_tit motion s_obj opa_obj01 active">국내 최고의 회의실 예약 플랫폼이 되기 위해<br>
					더욱 노력하겠습니다.
				</p>
				<p class="sub_section_introduce02_text motion s_obj bottom_obj01 active">
					현재는 수도권을 중심으로 기업과 사용자를 연결하고 있으나 더 성장하여<br>
					국내 전 지역을 연결하는 국내 최고의 예약 플랫폼이 되겠습니다.
				</p>
				<ul class="sub_section_introduce02_list">
					<li>
						<span class="sub_section_introduce02_list_num"><span id="count01" class="sub_section_introduce02_list_num01">
							${reserve_count}
						</span>
						<span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">누적 예약 수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img01.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">
							지금도 많은 분들이<br>
							스페이스닷컴을<br>
							이용하고 계십니다.
						</p>
					</li>
					<li>
						<span class="sub_section_introduce02_list_num"><span id="count02" class="sub_section_introduce02_list_num01">
							${room_count}
						</span>
						<span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">등록된 총 회의실 수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img02.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">
							수도권 지역의 회의실을<br>
							손쉽게 예약할 수 있으며<br>
							곧 전국으로 확대할 예정입니다.
						</p>
					</li>
					<li>
						<span class="sub_section_introduce02_list_num"><span id="count03" class="sub_section_introduce02_list_num01">
							${review_count}
						</span>
						<span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">누적 리뷰 수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img03.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">
							회의실 이용 고객들의<br>
							솔직한 리뷰를<br>
							만나보실 수 있습니다.
						</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
<!-- 		<div class="sub_section sub_section_introduce03">
			<div class="center_box motion s_obj bottom_obj01 active">
				<p class="sub_section_introduce03_tit">스페이스닷컴과 직접 <span class="sub_section_introduce03_tit_bold"><span>회의실 예약 시 비교</span></span></p>
				<div class="sub_section_introduce03_img_box"><img src="http://localhost:9000/space/images/sub_section_introduce03_img01.png"></div>
			</div>
		</div> -->
		<!-- e sub_section -->
	</div>
	<!-- e container -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>



