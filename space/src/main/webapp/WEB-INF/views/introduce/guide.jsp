<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.content {
	min-height:700px;
	padding:0 0 150px;
}

.sub_section {
	padding:0;
	/* background:#ffffff; */
}
.sub_section.p_no {
	padding:0;
}
.sub_section.p_no_top {
	padding:0 0 100px;
}
.sub_section.p_no_bottom {
	padding:100px 0 0;
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
	font-weight:bold;
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

.sub_section.sub_section_useguide01 {
	padding:100px 0;
}
.sub_section_useguide01 .center_box {
	background:url('http://localhost:9000/space/images/sub_section_useguide01_bg01.png') no-repeat right top;
}
.sub_section_useguide01_tit {
	position:relative;
	padding-bottom:52px;
	margin-bottom:28px;
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:42px;
	color:#252626;
	letter-spacing:-1px;
}
.sub_section_useguide01_tit span {
	font-family:"nanumsquare-r";
}
.sub_section_useguide01_tit:before {
	content:'';
	display:block;
	width:64px;
	height:4px;
	background:#0075f3;
	position:absolute;
	left:0;
	bottom:0;
}
.sub_section_useguide01_text {
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#252626;
}

.sub_section_useguide01_list_box {
	margin-top:92px;
}
.sub_section_useguide01_list_box:after {
	content:'';
	display:block;
	clear:both;
}
.sub_section_useguide01_list {
	width:50%;
	float:left;
}
.sub_section_useguide01_list > li {
	position:relative;
	height:290px;
}
.sub_section_useguide01_list > li.type02 {
	height:250px;
}

.sub_section_useguide01_list_num {
	margin-bottom:12px;
}
.sub_section_useguide01_list_num01 {
	position:relative;
	display:inline-block;
	vertical-align:top;
	padding:0 14px;
	font-family:"nanumsquare-b";
	font-size:48px;
	line-height:40px;
	color:#006be0;
	letter-spacing:-1px;
}
.sub_section_useguide01_list_num01:before {
	content:'';
	display:block;
	width:100%;
	height:15px;
	margin-top:-8px;
	border-radius:15px;
	background:#e5f0fc;
	position:absolute;
	top:50%;
	left:0;
	z-index:0;
}
.sub_section_useguide01_list_num01 span {
	position:relative;
	z-index:1;
}

.sub_section_useguide01_list_tit {
	display:block;
	padding:0 14px;
	margin-top:12px;
	font-family:"nanumsquare-b";
	font-size:20px;
	line-height:26px;
	color:#323232;
	letter-spacing:-1px;
}
.sub_section_useguide01_list_text {
	padding:0 14px;
	margin-top:20px;
	font-family:"nanumsquare-r";
	font-size:16px;
	line-height:26px;
	color:#323232;
	letter-spacing:-1px;
}

.sub_section_useguide01_list_tip_text {
	padding:5px 14px;
}
.sub_section_useguide01_list_tip_text01 {
	display:inline-block;
	vertical-align:top;
	padding:0 12px;
	margin-top:4px;
	border-radius:16px;
	font-family:"nanumsquare-b";
	font-size:14px;
	line-height:16px;
	color:#ffffff;
	background:#006be0;
	letter-spacing:-1px;
}
.sub_section_useguide01_list_tip_text02 {
	display:inline-block;
	vertical-align:top;
	font-family:"nanumsquare-b";
	font-size:16px;
	line-height:24px;
	color:#006be0;
	letter-spacing:-1px;
}

.sub_section_useguide01_list_app_btnbox {
	margin-top:15px;
	padding:0 14px;
	font-size:0;
}
.sub_section_useguide01_list_app_btnbox a {
	display:inline-block;
	vertical-align:top;
}
.sub_section_useguide01_list_app_btnbox a + a {
	margin-left:10px;
}

.sub_section_useguide01_list_bar {
	display:block;
	width:1px;
	background:#cce1f9;
	position:absolute;
	bottom:calc(100% + 15px);
	left:28px;
}
.sub_section_useguide01_list_bar01 {
	height:50px;
}
.sub_section_useguide01_list_bar02 {
	height:50px;
}
.sub_section_useguide01_list_bar03 {
	height:110px;
}
.sub_section_useguide01_list_bar04 {
	height:100px;
}



/* 효과 { */
.s_obj.active.left_obj01 {
	-webkit-transform: translateX(-30%) translateY(50px);
	-ms-transform: translateX(-30%) translateY(50px);
	-o-transform: translateX(-30%) translateY(50px);
	transform: translateX(-30%) translateY(50px);
}
.s_obj.active.right_obj01 {
	-webkit-transform: translateX(30%) translateY(50px);
	-ms-transform: translateX(30%) translateY(50px);
	-o-transform: translateX(30%) translateY(50px);
	transform: translateX(30%) translateY(50px);
}
.s_obj.active.left_obj02 {
	-webkit-transform: translateX(-30%);
	-ms-transform: translateX(-30%);
	-o-transform: translateX(-30%);
	transform: translateX(-30%);
}
.s_obj.active.right_obj02 {
	-webkit-transform: translateX(30%);
	-ms-transform: translateX(30%);
	-o-transform: translateX(30%);
	transform: translateX(30%);
}
.s_obj.active.top_obj01 {
	-webkit-transform:translateY(-50%);
	-ms-transform:translateY(-50%);
	-o-transform:translateY(-50%);
	transform:translateY(-50%);
	opacity:0.5;
}
.s_obj.active.bottom_obj01 {
	-webkit-transform:translateY(30px);
	-ms-transform:translateY(30px);
	-o-transform:translateY(30px);
	transform:translateY(30px);
	opacity:0.5;
}
.s_obj.active.opa_obj01 {
	opacity:0.1;
}
.motion {
	-webkit-transition: all .5s ease-in-out;
	-ms-transition: all .5s ease-in-out;
	-o-transition: all .5s ease-in-out;
	transition: all .5s ease-in-out;
}
.motion02 {
	-webkit-transition: all 1s ease-in-out;
	-ms-transition: all 1s ease-in-out;
	-o-transition: all 1s ease-in-out;
	transition: all 1s ease-in-out;
}
/* } 효과 */
</style>
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
				<li class="on"><a href="#">이용안내</a></li>
				<li><a href="http://localhost:9000/space/partner.do">파트너 등록 안내</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_useguide01">
			<div class="center_box">
				<p class="sub_section_useguide01_tit motion s_obj right_obj02 active">회의실닷컴 <span>이용안내</span></p>
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