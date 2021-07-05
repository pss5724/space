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
.content {
	min-height:700px;
	padding:0 0 150px;
}
.center_box {
	width:1200px;
	margin:0 auto;
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
.sub_section.sub_section_partnerguide01 {
	box-sizing:border-box;
	height:370px;
	padding:86px 0 0 0;
	margin-top:102px;
	background:url('http://localhost:9000/space/images/sub_section_partnerguide01_bg01.jpg') no-repeat center top;
}
.sub_section_partnerguide01_content_box p {
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:52px;
	color:#252626;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_partnerguide01_content_box p span {
	font-family:"nanumsquare-r";
}
.sub_section_partnerguide01_content_box a {
	display:block;
	width:200px;
	margin:32px auto 0;
	font-family:"nanumsquare-b";
	font-size:15px;
	line-height:50px;
	color:#ffffff;
	border-radius:50px;
	text-align:center;
	background-image:linear-gradient(to right, #4d3cce, #1251bc);
	-webkit-box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
	-moz-box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
	box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
}

.sub_section.sub_section_partnerguide02 {
	padding:90px 0 0 0;
}
.sub_section_partnerguide02_tit {
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:52px;
	color:#323232;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_partnerguide02_list {
	margin-top:32px;
}
.sub_section_partnerguide02_list:after {
	content:'';
	display:block;
	clear:both;
}
.sub_section_partnerguide02_list > li {
	position:relative;
	float:left;
	box-sizing:border-box;
	width:50%;
	height:300px;
	padding:72px 0 0 162px;
}
.sub_section_partnerguide02_list > li + li + li {
	border-top:1px solid #ebebeb;
}
.sub_section_partnerguide02_list > li:nth-of-type(2n + 1) {
	border-right:1px solid #ebebeb;
}
.sub_section_partnerguide02_list_li:before {
	content:'';
	display:block;
	width:101px;
	height:106px;
	position:absolute;
	left:36px;
	top:54px;
}
.sub_section_partnerguide02_list_li01:before {
	background:url('http://localhost:9000/space/images/sub_section_partnerguide02_list_img01.png') no-repeat left top;
}
.sub_section_partnerguide02_list_li02:before {
	background:url('http://localhost:9000/space/images/sub_section_partnerguide02_list_img02.png') no-repeat left top;
}
.sub_section_partnerguide02_list_li03:before {
	background:url('http://localhost:9000/space/images/sub_section_partnerguide02_list_img03.png') no-repeat left top;
}
.sub_section_partnerguide02_list_li04:before {
	background:url('http://localhost:9000/space/images/sub_section_partnerguide02_list_img04.png') no-repeat left top;
}

.sub_section_partnerguide02_list_num01 {
	position:relative;
	display:inline-block;
	padding:0 12px;
	font-family:"nanumsquare-b";
	font-size:48px;
	line-height:42px;
	color:#006be0;
	letter-spacing:-1px;
}
.sub_section_partnerguide02_list_num01:before {
	content:'';
	display:block;
	width:100%;
	height:15px;
	border-radius:15px;
	margin-top:-8px;
	background:#e5f0fc;
	position:absolute;
	top:50%;
	left:0;
	z-index:0;
}
.sub_section_partnerguide02_list_num01 span {
	position:relative;
	z-index:1;
}

.sub_section_partnerguide02_list_tit {
	display:block;
	margin-top:20px;
	font-family:"nanumsquare-b";
	font-size:20px;
	line-height:26px;
	color:#323232;
	letter-spacing:-1px;
}
.sub_section_partnerguide02_list_text {
	position:relative;
	padding-top:10px;
	margin-top:30px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#323232;
	letter-spacing:-1px;
}
.sub_section_partnerguide02_list_text:before {
	content:'';
	display:block;
	width:30px;
	height:3px;
	background:#2d8ee6;
	position:absolute;
	top:0;
	left:0;
}

.sub_section.sub_section_partnerguide03 {
	box-sizing:border-box;
	height:2098px;
	padding:214px 0 0;
	background:url('http://localhost:9000/space/images/sub_section_partnerguide03_bg01.png') no-repeat center top;
}
.sub_section_partnerguide03_top_list {
	text-align:center;
}
.sub_section_partnerguide03_top_list li {
	display:inline-block;
	vertical-align:top;
	text-align:center;
	width:300px;
}

.sub_section_partnerguide03_top_list_tit {
	display:block;
	font-family:"nanumsquare-r";
	font-size:20px;
	line-height:20px;
	color:#ffffff;
	text-align:center;
	letter-spacing:-1px;
}

.sub_section_partnerguide03_top_list_img {
	margin-top:26px;
	text-align:center;
}

.sub_section_partnerguide03_top_list_count {
	display:block;
	margin-top:28px;
	font-family:"nanumsquare-b";
	font-size:48px;
	line-height:48px;
	color:#ffffff;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_partnerguide03_top_list_count02 {
	font-family:"nanumsquare-l";
}

.sub_section_partnerguide03_content {
	margin-top:88px;
}
.sub_section_partnerguide03_content_tit {
	position:relative;
	font-family:"nanumsquare-l";
	font-size:50px;
	line-height:48px;
	color:#ffffff;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_partnerguide03_content_tit:before, .sub_section_partnerguide03_content_tit:after {
	content:'';
	display:block;
	width:360px;
	height:1px;
	position:absolute;
	top:22px;
	background:#cccccc;
	opacity:0.2;
}
.sub_section_partnerguide03_content_tit:before {
	left:0;
}
.sub_section_partnerguide03_content_tit:after {
	right:0;
}
.sub_section_partnerguide03_content_text {
	margin-top:32px;
	font-family:"nanumsquare-l";
	font-size:18px;
	line-height:26px;
	color:#ffffff;
	text-align:center;
	letter-spacing:-1px;
}

.sub_section_partnerguide03_content_inner_box {
	width:900px;
	margin:94px auto 0;
}
.sub_section_partnerguide03_content_inner + .sub_section_partnerguide03_content_inner {
	margin-top:56px;
}

.sub_section_partnerguide03_content_inner_tit {
	position:relative;
	padding-top:20px;
	font-family:"nanumsquare-l";
	font-size:26px;
	line-height:26px;
	color:#ffffff;
}
.sub_section_partnerguide03_content_inner_tit:before {
	content:'';
	display:block;
	width:66px;
	height:4px;
	background:#ffffff;
	position:absolute;
	top:0;
	left:0;
}
.sub_section_partnerguide03_content_inner_text {
	margin-top:24px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#ffffff;
	letter-spacing:-1px;
}

.sub_section_partnerguide03_content_inner_list {
	margin-top:52px;
}
.sub_section_partnerguide03_content_inner_list > li {
	font-size:0;
}
.sub_section_partnerguide03_content_inner_list > li + li {
	margin-top:32px;
}
.sub_section_partnerguide03_content_inner_list_num {
	position:relative;
	display:inline-block;
	vertical-align:top;
	padding:0 8px;
	font-family:"nanumsquare-l";
	font-size:32px;
	line-height:32px;
	color:#ffffff;
	letter-spacing:-1px;
}
.sub_section_partnerguide03_content_inner_list_num:before {
	content:'';
	display:block;
	width:100%;
	height:20px;
	margin-top:-10px;
	border-radius:20px;
	position:absolute;
	top:50%;
	left:0;
	background:#2702d5;
	opacity:0.3;
	z-index:0;
}
.sub_section_partnerguide03_content_inner_list_num span {
	position:relative;
	opacity:0.7;
	z-index:1;
}
.sub_section_partnerguide03_content_inner_list_text_box {
	width:calc(100% - 60px);
	display:inline-block;
	vertical-align:top;
	margin-left:7px;
}
.sub_section_partnerguide03_content_inner_list_text_box_tit {
	display:block;
	font-family:"nanumsquare-b";
	font-size:20px;
	line-height:32px;
	color:#ffffff;
	letter-spacing:-1px;
}
.sub_section_partnerguide03_content_inner_list_text_box_text {
	display:block;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#ffffff;
	opacity:0.8;
	letter-spacing:-1px;
}

.sub_section.sub_section_partnerguide04 {
	background:#f9f9f9;
	padding:130px 0 100px;
	font-weight:bold;
}
.sub_section_partnerguide04_tit {
	font-family:"nanumsquare-r";
	font-size:42px;
	font-weight:bold;
	line-height:42px;
	color:#252626;
	text-align:center;
	letter-spacing:-1px;
}
.sub_section_partnerguide04_list {
	margin-top:60px;
}
.sub_section_partnerguide04_list > li {
	width:100%;
	display:table;
	table-layout:fixed;
	background:#ffffff;
	border-radius:10px;
}
.sub_section_partnerguide04_list > li + li {
	margin-top:10px;
}
.sub_section_partnerguide04_list > li > div {
	display:table-cell;
	vertical-align:middle;
}
.sub_section_partnerguide04_list_f {
	width:140px;
	text-align:center;
}
.sub_section_partnerguide04_list_s {
	box-sizing:border-box;
	width:calc(100% - 140px);
	padding:36px 40px 36px 0;
}

.sub_section_partnerguide04_list_f span {
	position:relative;
	display:inline-block;
	padding-bottom:14px;
	font-family:"nanumsquare-b";
	font-size:40px;
	line-height:30px;
	color:#006be0;
	letter-spacing:-2px;
}
.sub_section_partnerguide04_list_f span:before {
	content:'';
	display:block;
	width:30px;
	height:4px;
	margin-left:-15px;
	background:#006be0;
	position:absolute;
	left:50%;
	bottom:0;
}

.sub_section_partnerguide04_list_s_tit {
	position:relative;
	display:inline-block;
	vertical-align:top;
	padding:0 0 0 5px;
	font-family:"nanumsquare-b";
	font-size:24px;
	line-height:30px;
	color:#030303;
	letter-spacing:-1px;
}
.sub_section_partnerguide04_list_s_tit:before {
	content:'';
	display:block;
	width:100%;
	height:14px;
	border-radius:14px;
	background:#ffe200;
	opacity:0.08;
	position:absolute;
	bottom:2px;
	left:0;
}
.sub_section_partnerguide04_list_s_text {
	padding:0 0 0 5px;
	margin-top:18px;
	font-family:"nanumsquare-b";
	font-size:16px;
	line-height:28px;
	color:#030303;
	letter-spacing:-1px;
}

.sub_section.sub_section_partnerguide05 {
	padding:60px 0 110px;
	background:#006fd3;
}
.sub_section_partnerguide05_tit {
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:32px;
	color:#ffffff;
	letter-spacing:-1px;
	text-align:center;
}
.sub_section_partnerguide05_tit span {
	display:block;
	margin-top:12px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#ffffff;
	opacity:0.8;
}

.sub_section_partnerguide05_list {
	width:1000px;
	margin:20px auto 0;
}
.sub_section_partnerguide05_list:after {
	content:'';
	display:block;
	clear:both;
}
.sub_section_partnerguide05_list > li {
	box-sizing:border-box;
	float:left;
	width:495px;
	background:#ffffff;
	border-radius:3px;
	padding:16px 16px;
	font-size:0;
}
.sub_section_partnerguide05_list > li.type02 {
	width:100%;
}
.sub_section_partnerguide05_list > li.right {
	margin-left:10px;
}
.sub_section_partnerguide05_list > li + li + li {
	margin-top:10px;
}
.sub_section_partnerguide05_list > li > span {
	position:relative;
	display:inline-block;
	box-sizing:border-box;
	width:74px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:20px;
	color:#252526;
	letter-spacing:-1px;
	vertical-align:top;
}
.sub_section_partnerguide05_list > li > span:before {
	content:'';
	display:block;
	width:1px;
	height:13px;
	background:#d3d3d3;
	position:absolute;
	right:0;
	top:4px;
}
.sub_section_partnerguide05_list > .sub_section_partnerguide05_list_li06 > span {
	padding:56px 0;
}
.sub_section_partnerguide05_list > .sub_section_partnerguide05_list_li06 > span:before {
	display:none;
}
.sub_section_partnerguide05_list > li > div, .sub_section_partnerguide05_list > li > input {
	box-sizing:border-box;
	display:inline-block;
	vertical-align:top;
	width:calc(100% - 74px);
}
.sub_section_partnerguide05_list > li > div {
	position:relative;
	font-size:0;
}
.sub_section_partnerguide05_list > li > div .cus_chk_sect {
	width:130px;
	padding-left:10px;
	letter-spacing:-1px;
}
.sub_section_partnerguide05_list > .sub_section_partnerguide05_list_li06 > div span {
	display:block;
	position:absolute;
	z-index:0;
	top:6px;
	left:12px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:28px;
	color:#bebebe;
}
.sub_section_partnerguide05_list > li > input {
	border:none;
	padding-left:8px;
}
.sub_section_partnerguide05_list > li > div > textarea {
	position:relative;
	z-index:1;
	box-sizing:border-box;
	width:100%;
	height:132px;
	padding:12px;
	border:1px solid #d3d3d3;
	resize:none;
	background:none;
}

.sub_section_partnerguide05_agree {
	width:1000px;
	margin:5px auto 0;
	text-align:right;
}
.sub_section_partnerguide05_agree .cus_chk_label {
	font-family:"nanumsquare-r";
	font-size:12px;
	line-height:20px;
	color:#ffffff;
	letter-spacing:-1px;
}
.sub_section_partnerguide05_agree .more_pop_btn {
	font-family:"nanumsquare-r";
	font-size:12px;
	line-height:20px;
	color:#ffffff;
	text-decoration:underline;
	letter-spacing:-1px;
}

.sub_section_partnerguide05_btnbox a {
	display:block;
	box-sizing:border-box;
	width:180px;
	margin:0 auto;
	border-radius:50px;
	font-family:"nanumsquare-b";
	font-size:15px;
	line-height:48px;
	color:#ffffff;
	background:#004380;
	border:1px solid #004380;
	transition:background 1s, color 1s;
	text-align:center;
}
.sub_section_partnerguide05_btnbox a.on {
	color:#004380;
	background:#ffffff;
}

</style>
<script>

$(function(){
	$('.sub_placeholder').on('click', function(){
		$(this).prev('span').hide();
	});
	$('.sub_placeholder').on('focusout change keyup', function(){
		if($(this).val() == ''){
			$(this).prev('span').show();
		} else {
			$(this).prev('span').hide();
		}
	});

	var morePopBtn = $('.more_pop_btn'),
		morePopCloseBtn = $('.more_pop_closebtn'),
		morePop = $('.more_pop'),
		morePopBg = $('.more_pop_bg');

	morePopBtn.on('click', function(){
		var target = $(this).index();
		var morePopBgHeight = $('body').height();
		morePopBg.css({height:morePopBgHeight});
		morePopBg.fadeIn(250);
		morePop.fadeIn(250);
	});
	morePopCloseBtn.on('click', function(){
		morePopBg.fadeOut(250);
		morePop.fadeOut(250);
	});
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

		var targetOffsetTop = $('.sub_section_partnerguide03_top_list').offset().top;
		var targetOffsetHeight = $('.sub_section_partnerguide03_top_list').outerHeight();
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
	
		<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
				<!-- s sub_visual -->
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
				<li><a href="http://localhost:9000/space/introduce.do">회의실닷컴 소개</a></li>
				<li><a href="http://localhost:9000/space/guide.do">이용안내</a></li>
				<li class="on"><a href="#">파트너 등록 안내</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_partnerguide01">
			<div class="center_box">
				<div class="sub_section_partnerguide01_content_box motion02 s_obj opa_obj01 active">
					<p>파트너가 되어 회의실 <br>
						<span>운영 효율을 극대화하세요.</span>
					</p>
					<a href="#">파트너 등록 상담하기</a>
				</div>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_partnerguide02">
			<div class="center_box">
				<p class="sub_section_partnerguide02_tit motion s_obj bottom_obj01 active">회의실닷컴과 함께 하세요!</p>
				<ul class="sub_section_partnerguide02_list">
					<li class="sub_section_partnerguide02_list_li sub_section_partnerguide02_list_li01 motion s_obj left_obj02 active"><div class="sub_section_partnerguide02_list_num"><span class="sub_section_partnerguide02_list_num01"><span>01</span></span></div>
						<span class="sub_section_partnerguide02_list_tit">무료등록</span>
						<p class="sub_section_partnerguide02_list_text">별도의 등록(가입)비가 없으며 카드사 및 간편결제 수수료,  <br>
							부가가치세를 회의실닷컴에서 부담합니다.
						</p>
					</li>
					<li class="sub_section_partnerguide02_list_li sub_section_partnerguide02_list_li02 motion s_obj right_obj02 active"><div class="sub_section_partnerguide02_list_num"><span class="sub_section_partnerguide02_list_num01"><span>02</span></span></div>
						<span class="sub_section_partnerguide02_list_tit">마케팅 지원</span>
						<p class="sub_section_partnerguide02_list_text">막대한 비용이 드는 키워드 광고를 <br>
							더 이상 독자적으로 진행하실 필요가 없습니다. <br>
							회의실닷컴의 홈페이지에 무료로 회의실이 노출 됩니다.
						</p>
					</li>
					<li class="sub_section_partnerguide02_list_li sub_section_partnerguide02_list_li03 motion s_obj left_obj02 active"><div class="sub_section_partnerguide02_list_num"><span class="sub_section_partnerguide02_list_num01"><span>03</span></span></div>
						<span class="sub_section_partnerguide02_list_tit">실시간 예약 시스템을 통한 예약/정산 관리</span>
						<p class="sub_section_partnerguide02_list_text">언제 어디서나 데스크탑, 모바일로 예약 현황과 <br>
							결제내역을 관리하고 쉽게 정산할 수 있습니다.
						</p>
					</li>
					<li class="sub_section_partnerguide02_list_li sub_section_partnerguide02_list_li04 motion s_obj right_obj02 active"><div class="sub_section_partnerguide02_list_num"><span class="sub_section_partnerguide02_list_num01"><span>04</span></span></div>
						<span class="sub_section_partnerguide02_list_tit">매출/운영 효율 극대화</span>
						<p class="sub_section_partnerguide02_list_text">이용후기를 바탕으로한 마케팅 활동을 통하여 <br>
							매출 및 효율을 극대화 할 수 있습니다.
						</p>
					</li>
				</ul>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_partnerguide03">
			<div class="center_box">

				<ul class="sub_section_partnerguide03_top_list">
					<li><span class="sub_section_partnerguide03_top_list_tit motion02 s_obj opa_obj01 active">등록된 총 센터수</span>
						<div class="sub_section_partnerguide03_top_list_img"><img src="http://localhost:9000/space/images/sub_section_partnerguide03_top_list_img01.png" alt=""></div>
						<span class="sub_section_partnerguide03_top_list_count"><span id="count01" class="sub_section_partnerguide03_top_list_count01">94</span><span class="sub_section_partnerguide03_top_list_count02">+</span></span>
					</li>
					<li><span class="sub_section_partnerguide03_top_list_tit motion02 s_obj opa_obj01 active">등록된 총 회의실 수</span>
						<div class="sub_section_partnerguide03_top_list_img"><img src="http://localhost:9000/space/images/sub_section_partnerguide03_top_list_img02.png" alt=""></div>
						<span class="sub_section_partnerguide03_top_list_count"><span id="count02" class="sub_section_partnerguide03_top_list_count01">417</span><span class="sub_section_partnerguide03_top_list_count02">+</span></span>
					</li>
					<li><span class="sub_section_partnerguide03_top_list_tit motion02 s_obj opa_obj01 active">누적 이용고객 수</span>
						<div class="sub_section_partnerguide03_top_list_img"><img src="http://localhost:9000/space/images/sub_section_partnerguide03_top_list_img03.png" alt=""></div>
						<span class="sub_section_partnerguide03_top_list_count"><span id="count03" class="sub_section_partnerguide03_top_list_count01">53,486</span><span class="sub_section_partnerguide03_top_list_count02">+</span></span>
					</li>
				</ul>

				<div class="sub_section_partnerguide03_content">
					<p class="sub_section_partnerguide03_content_tit motion02 s_obj opa_obj01 active">회의실닷컴 파트너</p>
					<p class="sub_section_partnerguide03_content_text motion s_obj bottom_obj01 active">효율적인 회의실 운영을 할 수 있도록 다양한 서비스를 제공합니다. <br>
						누구나 회의실닷컴의 파트너사가 될 수 있습니다.</p>
					<div class="sub_section_partnerguide03_content_inner_box">

						<!-- s sub_section_partnerguide03_content_inner -->
						<div class="sub_section_partnerguide03_content_inner">
							<p class="sub_section_partnerguide03_content_inner_tit motion s_obj right_obj02 active">파트너 등록</p>
							<p class="sub_section_partnerguide03_content_inner_text">회의실닷컴의 운영 인력이 위탁자가 보유한 회의실 및 기타공간을 온라인 및 오프라인을 통하여 홍보 및 판매 대행</p>
							<ul class="sub_section_partnerguide03_content_inner_list">
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>01</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">상담 등록</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">"파트너 등록 상담하기"로 접수된 기본 정보를 토대로 담당자와 상담을 진행합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>02</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">서류 제출</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">등록여부 검토가 완료되면 회의실에 대한 정보와 서류를 제출합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>03</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">인터뷰 및 현장답사</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">부족한 회의실 정보와 사진 촬영을 위해 회의실닷컴 담당자가 직접 방문하여 등록된 내용을 확인합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>04</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">실시간 예약 시스템 가동</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">데스크탑과 모바일로 예약 현황과 결제내역, 예약관리를 진행합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>05</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">첫 예약 받기</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">회의실닷컴을 통하여 더 많은 예약과 수익을 창출합니다.</span>
									</div>
								</li>
							</ul>
						</div>
						<!-- e sub_section_partnerguide03_content_inner -->

						<!-- s sub_section_partnerguide03_content_inner -->
						<div class="sub_section_partnerguide03_content_inner">
							<p class="sub_section_partnerguide03_content_inner_tit motion s_obj right_obj02 active">종합 위탁운영</p>
							<p class="sub_section_partnerguide03_content_inner_text">회의실닷컴의 운영 인력이 위탁자가 보유한 회의실 및 기타 공간에 상주하며 위탁자를 대신하여 회의실 및 공간을 직접 홍보, 판매, 관리 운영</p>
							<ul class="sub_section_partnerguide03_content_inner_list">
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>01</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">상담 등록</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">"파트너 등록 상담하기"로 접수된 기본 정보를 토대로 담당자와 상담을 진행합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>02</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">서류 제출</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">종합 위탁 프로세스에 대한 안내가 끝나면 위탁 희망 사업장 주소, 면적, 도면 등 세부 정보를 전달합니다. (최소 면적 200평 이상)</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>03</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">종합 위탁운영 준비</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">예상매출, 최수 운영인력 등 세부 내용을 검토하고 운영 준비를 합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>04</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">종합 위탁운영 시작</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">위탁자를 대신하여 회의실닷컴 담당자가 회의실을 직접 홍보, 판매, 운영을 진행합니다.</span>
									</div>
								</li>
								<li>
									<span class="sub_section_partnerguide03_content_inner_list_num motion02 s_obj opa_obj01 active"><span>05</span></span>
									<div class="sub_section_partnerguide03_content_inner_list_text_box">
										<span class="sub_section_partnerguide03_content_inner_list_text_box_tit">첫 예약 받기</span>
										<span class="sub_section_partnerguide03_content_inner_list_text_box_text">회의실닷컴을 통하여 더 많은 예약과 수익을 창출합니다.</span>
									</div>
								</li>
							</ul>
						</div>
						<!-- e sub_section_partnerguide03_content_inner -->

					</div>
				</div>
			</div>
		</div>
		<!-- e sub_section -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_partnerguide04">
			<div class="center_box">
				<p class="sub_section_partnerguide04_tit motion s_obj bottom_obj01 active">자주묻는 질문</p>
				<ul class="sub_section_partnerguide04_list">
					<li>
						<div class="sub_section_partnerguide04_list_f motion02 s_obj opa_obj01 active"><span>01</span></div>
						<div class="sub_section_partnerguide04_list_s">
							<p class="sub_section_partnerguide04_list_s_tit"><span>회의실닷컴 파트너가 되려면 어떠한 자격이 필요한가요?</span></p>
							<p class="sub_section_partnerguide04_list_s_text">사업자등록증(고유번호증)을 보유한 파트너로, 사업자 자격이 없는 개인의 경우 파트너 등록이 불가합니다.</p>
						</div>
					</li>
					<li>
						<div class="sub_section_partnerguide04_list_f motion02 s_obj opa_obj01 active"><span>02</span></div>
						<div class="sub_section_partnerguide04_list_s">
							<p class="sub_section_partnerguide04_list_s_tit"><span>인터뷰 및 현장답사는 어떻게 진행되며 인터뷰를 하는 이유는 무엇인가요?</span></p>
							<p class="sub_section_partnerguide04_list_s_text">가맹점 등록을 하기 위해서는 인터뷰 및 현장답사가 진행되며 아래 내용으로 진행됩니다. <br>
								1) 회의실닷컴 가맹점에 등록하기에 적합한지 여부 <br>
								2) 판매할 회의실 관련 문의 및 피드백 안내 <br>
								3) 회의실닷컴 파트너 운영 방법 안내
							</p>
							<p class="sub_section_partnerguide04_list_s_text">인터뷰를 통해 판매를 희망하는 회의실에 대한 정보를 보완하고 고객에게 정확한 정보를 제공하기 위해 필수적으로 진행하고 있습니다.</p>
						</div>
					</li>
					<li>
						<div class="sub_section_partnerguide04_list_f motion02 s_obj opa_obj01 active"><span>03</span></div>
						<div class="sub_section_partnerguide04_list_s">
							<p class="sub_section_partnerguide04_list_s_tit"><span>수익정산은 어떤 절차로 진행되나요?</span></p>
							<p class="sub_section_partnerguide04_list_s_text">예약 및 결제가 진행된 건에 대한 정산서가 월초에 발송되며 사용 대관료가 정산되어 입금됩니다.</p>
						</div>
					</li>
					<li>
						<div class="sub_section_partnerguide04_list_f motion02 s_obj opa_obj01 active"><span>04</span></div>
						<div class="sub_section_partnerguide04_list_s">
							<p class="sub_section_partnerguide04_list_s_tit"><span>가맹점 가입비나 별도의 수수료는 없나요?</span></p>
							<p class="sub_section_partnerguide04_list_s_text">회의실닷컴의 가맹점 등록시 별도의 등록(가입)비는 발생되지 않습니다. <br>
								매출 건에 대한 수수료는 부과되며 카드사 및 간편결제 수수료, 부가가치세를 회의실닷컴에서 부담합니다.
							</p>
						</div>
					</li>
					<li>
						<div class="sub_section_partnerguide04_list_f motion02 s_obj opa_obj01 active"><span>05</span></div>
						<div class="sub_section_partnerguide04_list_s">
							<p class="sub_section_partnerguide04_list_s_tit"><span>가맹점 등록과 위탁 운영의 차이점은 무엇인가요?</span></p>
							<p class="sub_section_partnerguide04_list_s_text">가맹점 등록은 센터가 보유한 회의실 및 기타 공간을 온/오프라인을 통하여 홍보 및 판매를 대행하는 서비스를 의미합니다. <br>
								위탁 운영은 회의실닷컴의 인력이 위탁자가 보유한 회의실 및 기타 공간에 상주하며 위탁자를 대신하여 회의실 및 공간을 <br>
								직접 운영, 홍보, 판매하는 서비스입니다.
							</p>
						</div>
					</li>
				</ul>
			</div>
		</div>
		<!-- e sub_section -->
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>