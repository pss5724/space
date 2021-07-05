<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 닷컴</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.js"></script>

<style>
header{
	height:100px;
	background-color:black;
}


.sub_visual {
	position:relative;
	height:300px;
	background-position:center top !important;
	background-repeat:no-repeat !important;
}
.sub_visual.introduce {
	background:url('http://localhost:9000/space/images/subvisual_introduce.jpg');
}

.sub_visual h3 {
	position:absolute;
	left:50%;
	top:50%;
	width:1200px;
	font-family:"nanumsquare-b";
	font-size:50px;
	line-height:50px;
	color:#ffffff;
	letter-spacing:-1px;
	-webkit-transform:translate(-50%, -50%);
	-moz-transform:translate(-50%, -50%);
	-ms-transform:translate(-50%, -50%);
	-o-transform:translate(-50%, -50%);
	transform:translate(-50%, -50%);
}
.sub_visual h3 span {
	display:block;
	margin-top:16px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#ffffff;
	letter-spacing:0;
}
.center_box {
	width:1200px;
	margin:0 auto;
}
.sub_tab {
	text-align:center;
	font-size:0;
	font-weight:bold;
}
.sub_tab li {
	position:relative;
	display:inline-block;
	width:160px;
	padding:36px 0 15px;
	text-align:center;
	vertical-align:top;
}
.sub_tab li + li {
	margin-left:150px;
}
.sub_tab li a {
	font-family:"nanumsquare-r";
	font-size:18px;
	line-height:26px;
	color:#8e8e8e;
	letter-spacing:-1px;
}
.sub_tab li.on:before {
	content:'';
	display:block;
	width:100px;
	height:5px;
	margin-left:-50px;
	position:absolute;
	left:50%;
	bottom:-3px;
	background:#008aff;
}
.sub_tab li.on a {
	font-family:"nanumsquare-b";
	color:#252626;
}







.sub_section.sub_section_introduce01 {
	padding:100px 0;
}
.sub_section_introduce01_img_box {
	text-align:center;
}
.sub_section_introduce01_tit {
	position:relative;
	padding-bottom:48px;
	margin:24px 0 28px;
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:52px;
	color:#252626;
	text-align:center;
}
.sub_section_introduce01_tit span {
	font-family:"nanumsquare-r";
}
.sub_section_introduce01_tit:before {
	content:'';
	display:block;
	width:64px;
	height:4px;
	margin-left:-32px;
	background:#0075f3;
	position:absolute;
	left:50%;
	bottom:0;
}
.sub_section_introduce01_text {
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#252626;
	text-align:center;
}

.sub_section.sub_section_introduce02 {
	padding:145px 0;
	background:url('http://localhost:9000/space/images/sub_section_introduce02_bg01.jpg') repeat-y center top;
}
.sub_section_introduce02_tit {
	font-family:"nanumsquare-l";
	font-size:50px;
	line-height:65px;
	color:#ffffff;
	text-align:center;
}
.sub_section_introduce02_text {
	margin-top:26px;
	font-family:"nanumsquare-l";
	font-size:18px;
	line-height:26px;
	color:#ffffff;
	text-align:center;
}

.sub_section_introduce02_list {
	margin-top:88px;
	text-align:center;
	font-size:0;
}
.sub_section_introduce02_list li {
	position:relative;
	display:inline-block;
	width:340px;
	vertical-align:top;
}
.sub_section_introduce02_list li + li:before {
	content:'';
	display:block;
	width:1px;
	height:265px;
	margin-top:-133px;
	background:url('http://localhost:9000/space/images/sub_section_introduce02_list_bar.png') repeat-y left top;
	position:absolute;
	left:0;
	top:50%;
}
.sub_section_introduce02_list_num {
	position:relative;
	display:inline-block;
	vertical-align:top;
	padding:0 8px;
	letter-spacing:-1px;
}
.sub_section_introduce02_list_num:before {
	content:'';
	display:block;
	width:100%;
	height:15px;
	margin-top:-8px;
	border-radius:15px;
	position:absolute;
	left:0;
	top:50%;
	z-index:0;
	background:#1c7fe4;
}
.sub_section_introduce02_list_num .sub_section_introduce02_list_num01 {
	position:relative;
	z-index:1;
	font-family:"nanumsquare-b";
	font-size:48px;
	line-height:52px;
	color:#ffffff;
}
.sub_section_introduce02_list_num .sub_section_introduce02_list_num02 {
	position:relative;
	z-index:1;
	font-family:"nanumsquare-l";
	font-size:48px;
	line-height:52px;
	color:#ffffff;
}

.sub_section_introduce02_list_tit {
	position:relative;
	display:block;
	padding-bottom:34px;
	margin:16px 0 32px;
	font-family:"nanumsquare-b";
	font-size:20px;
	line-height:26px;
	color:#ffffff;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_introduce02_list_tit:before {
	content:'';
	display:block;
	width:30px;
	height:3px;
	margin-left:-15px;
	background:#acd0f5;
	position:absolute;
	left:50%;
	bottom:0;
}

.sub_section_introduce02_list_img {
	text-align:center;
}

.sub_section_introduce02_list_text {
	margin-top:18px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#ffffff;
	letter-spacing:-1px;
	text-align:center;
	letter-spacing:-1px;
}

.sub_section.sub_section_introduce03 {
	padding:80px 0 130px;
	background:#fbfcff;
}
.sub_section_introduce03_tit {
	text-align:center;
	font-family:"nanumsquare-l";
	font-size:32px;
	line-height:32px;
	color:#252526;
	letter-spacing:-1px;
}
.sub_section_introduce03_tit_bold {
	position:relative;
	display:inline-block;
	font-family:"nanumsquare-b";
	font-size:32px;
	line-height:32px;
	color:#252526;
	vertical-align:top;
}
.sub_section_introduce03_tit_bold:before {
	content:'';
	display:block;
	width:calc(100% + 16px);
	height:19px;
	margin-top:-11px;
	border-radius:19px;
	position:absolute;
	top:50%;
	left:-8px;
	z-index:0;
	background:#c9dff9;
}
.sub_section_introduce03_tit_bold span {
	position:relative;
	z-index:1;
}

.sub_section_introduce03_img_box {
	margin-top:56px;
	text-align:center;
}

.sub_tab_box {
	border-bottom:1px solid #d7d7d7;
	margin-bottom:2px;
}
.sub_tab {
	text-align:center;
	font-size:0;
}
.sub_tab li {
	position:relative;
	display:inline-block;
	width:160px;
	padding:36px 0 15px;
	text-align:center;
	vertical-align:top;
}
.sub_tab li + li {
	margin-left:150px;
}
.sub_tab li a {
	font-family:"nanumsquare-r";
	font-size:18px;
	line-height:26px;
	color:#8e8e8e;
	letter-spacing:-1px;
}
.sub_tab li.on:before {
	content:'';
	display:block;
	width:100px;
	height:5px;
	margin-left:-50px;
	position:absolute;
	left:50%;
	bottom:-3px;
	background:#008aff;
}
.sub_tab li.on a {
	font-family:"nanumsquare-b";
	color:#252626;
}

</style>
<script>
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
			<h3>회의실닷컴은
				<span>회의실 운영 전문가들이 파트너사를 대신하여 회의시설 보유자와 <br>
                    이용고객을 이어주는 국내 최초 회의실 매칭 플랫폼입니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_tab -->
		<div class="sub_tab_box">
			<ul class="sub_tab">
				<li class="on"><a href="#">회의실닷컴 소개</a></li>
				<li><a href="http://localhost:9000/space/guide.do">이용안내</a></li>
				<li><a href="http://localhost:9000/space/partner.do">파트너 등록 안내</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_introduce01">
			<div class="center_box">
				<div class="sub_section_introduce01_img_box motion s_obj opa_obj01 active"><img src="http://localhost:9000/space/images/sub_section_introduce01_img01.jpg" alt=""></div>
				<p class="sub_section_introduce01_tit motion s_obj bottom_obj01 active">저희는 고객이 원하는 니즈에 맞춰 <br>
					<span>최적의 조건을 갖춘 회의실</span>을 찾고자 노력합니다.</p>
				<p class="sub_section_introduce01_text">회의실닷컴은 어느 지역에서나 회의실을 검색하고 예약할 수 있는 국내 최대의 회의실 예약 플랫폼으로 <br>
					2019년 2월 서비스를 시작으로 매년 성장을 지속하고 있습니다. 다년간 회의실을 직접 운영한 전문가들이 <br>
					선정한 회의실을 고객의 요구에 맞추어 파트너사와 직접 연결 시켜주는 새로운 형태의 플랫폼입니다.</p>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_introduce02">
			<div class="center_box">
				<p class="sub_section_introduce02_tit motion s_obj opa_obj01 active">국내 최고의 회의실 예약 플랫폼으로 <br>
					빠르게 성장 중입니다.
				</p>
				<p class="sub_section_introduce02_text motion s_obj bottom_obj01 active">2019년 2월에 출시된 회의실닷컴은 누적 사용자가 빠르게 증가하고 있습니다. <br>
					이는 회의실 업계에서 가장 빠른 성장 속도입니다.
				</p>
				<ul class="sub_section_introduce02_list">
					<li><span class="sub_section_introduce02_list_num"><span id="count01" class="sub_section_introduce02_list_num01">53486</span><span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">누적 이용 고객수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img01.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">지금까지 4만 명이 넘는 고객이 <br>
							회의실닷컴을 통해 <br>
							회의실 예약을 진행하였습니다
						</p>
					</li>
					<li><span class="sub_section_introduce02_list_num"><span id="count02" class="sub_section_introduce02_list_num01">417</span><span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">등록된 총 회의실 수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img02.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">전국에서 300여 개의 <br>
							회의실을 등록하여 <br>
							손쉽게 예약이 가능합니다.
						</p>
					</li>
					<li><span class="sub_section_introduce02_list_num"><span id="count03" class="sub_section_introduce02_list_num01">387</span><span class="sub_section_introduce02_list_num02">+</span></span>
						<span class="sub_section_introduce02_list_tit">누적 리뷰 수</span>
						<div class="sub_section_introduce02_list_img"><img src="http://localhost:9000/space/images/sub_section_introduce02_list_img03.png" alt=""></div>
						<p class="sub_section_introduce02_list_text">260명이 넘는 고객이 <br>
							회의실에 대한 <br>
							리뷰를 등록했습니다.
						</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_introduce03">
			<div class="center_box motion s_obj bottom_obj01 active">
				<p class="sub_section_introduce03_tit">회의실닷컴과 직접 <span class="sub_section_introduce03_tit_bold"><span>회의실 예약 시 비교</span></span></p>
				<div class="sub_section_introduce03_img_box"><img src="http://localhost:9000/space/images/sub_section_introduce03_img01.png"></div>
			</div>
		</div>
		<!-- e sub_section -->
	</div>
	<!-- e container -->
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>



