<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>

/* 헤더 { */
 * {
        margin: 0;
        padding: 0;
        list-style: none;
        color: inherit;
        text-decoration: none;
        box-sizing: border-box;
    }
#header {
	width:100%;
	min-width:1280px;
	height:100px;
	position:absolute;
	left:0;
	top:0;
	background:url('http://localhost:9000/space/images/main_visual.png') repeat-x left top;
}
#header:after {
	content:'';
	display:block;
	width:100%;
	height:1px;
	position:absolute;
	bottom:0;
	left:0;
	background:url('http://localhost:9000/space/images/main_header_bar.png') repeat-x left top;
}
#header.sub {
	background:#ffffff;
}
.header_inner {
	position:relative;
	width:1200px;
	margin:0 auto;
	padding-top:37px;
}
.header_inner:after {
	content:'';
	display:block;
	clear:both;
}
.logo {
	position:relative;
	z-index:100;
	float:left;
}
.logo a {
	display:block;
}
#gnb {
	position:relative;
	z-index:100;
	float:left;
	margin-left:20px;
	width:780px;
}
#gnb:after {
	content:'';
	display:block;
	clear:both;
}
#gnb a {
	display:block;
}
.depth1 {
	position:relative;
	float:left;
}
.depth1 h3 {
	position:relative;
	z-index:100;
}
.depth1 h3 a {
	padding:6px 57px 40px;
	font-family:"nanumsquare-b";
	font-size:18px;
	line-height:18px;
	letter-spacing:-1px;
}
#header #gnb .depth1 h3 a {
	color:#ffffff;
}
#header #gnb.on .depth1 h3 a {
	color:#252626;
}
#header #gnb.on .depth1.focus h3 a {
	color:#006be0;
}
#header.sub #gnb .depth1 h3 a {
	color:#252626;
}
#header.sub #gnb .depth1.focus h3 a {
	color:#006be0;
}
.depth2 {
	display:none;
	width:100%;
	padding-top:10px;
	position:absolute;
	z-index:99;
	top:52px;
	border-radius:10px;
	background:#ffffff;
}

.depth1:hover .depth2 {
	display:block;
}

.depth2 li h4 a {
	padding:12px 0;
	text-align:center;
	font-size:16px;
	line-height:16px;
	color:#252626;
	letter-spacing:-1px;
}
.depth2 li:first-child h4 a {
	padding:14px 0 12px;
}
.depth2 li:last-child h4 a {
	padding:12px 0 24px;
}
.depth2 .focus h4 a {
	color:#006be0;
}

.gnb_etc {
	position:relative;
	z-index:100;
	float:right;
	margin-top:8px;
}
.gnb_etc:after {
	content:'';
	display:block;
	clear:both;
}
.gnb_etc li {
	float:left;
}
.gnb_etc li + li {
	position:relative;
	padding-left:11px;
	margin-left:10px;
}
.gnb_etc li + li:before {
	content:'';
	display:block;
	width:1px;
	height:10px;
	background:#999999;
	position:absolute;
	top:2px;
	left:0;
}
.gnb_etc li a {
	display:block;
	font-size:14px;
	line-height:14px;
}
#header .gnb_etc li a {
	color:#ffffff;
}
#header .gnb_etc.on li a {
	color:#252626;
}

.header_bg_box {
	position:absolute;
	top:0;
	left:0;
	z-index:99;
	display:none;
	width:100%;
	height:100px;
	background:#ffffff;
}
.header_bg_box.on {
	display:block;
}

.subHeader {
	background:#ffffff;
}
.sub_header_top {
	border-bottom:1px solid #ebebeb;
}
.sub_header_bottom {
	border-bottom:1px solid #ebebeb;
}
.sub_header_inner {
	width:1200px;
	margin:0 auto;
}
.sub_header_inner:after {
	content:'';
	display:block;
	clear:both;
}

.sub_header_inner_top {
	padding:23px 0 22px;
}

.sub_logo {
	float:left;
}
.sub_logo a {
	display:block;
}

.sub_header_search_box {
	float:left;
	position:relative;
	box-sizing:border-box;
	background:#ffffff;
	border-bottom:2px solid #ebebeb;
	width:426px;
	padding:12px 15px;
	margin-left:106px;
	font-size:0;
	z-index:101;
}
.sub_header_search_btn {
	width:15px;
	height:15px;
	vertical-align:top;
	border:none;
	background:url('http://localhost:9000/space/images/sub_header_search_btn.jpg') no-repeat left top;
}
.sub_header_search_text {
	width:calc(100% - 33px);
	height:15px;
	margin-left:15px;
	vertical-align:top;
	border:none;
	background:none;
	font-size:15px;
	line-height:15px;
}
.sub_header_search_list {
	display:none;
	box-sizing:border-box;
	width:100%;
	min-height:131px;
	max-height:215px;
	/* max-height:383px; */
	padding-top:5px;
	overflow-y:auto;
	position:absolute;
	top:41px;
	left:0;
	z-index:1;
	background:#f5f5f5;
}
.sub_header_search_list.on {
	display:block;
}
.sub_header_search_list li {
	padding:13px 0 13px 30px;
}
.sub_header_search_list li a {
	font-size:16px;
	line-height:16px;
	color:#252626;
}

.sub_gnb_etc {
	position:relative;
	z-index:100;
	float:right;
	margin-top:14px;
}
.sub_gnb_etc:after {
	content:'';
	display:block;
	clear:both;
}
.sub_gnb_etc li {
	float:left;
}
.sub_gnb_etc li + li {
	position:relative;
	padding-left:11px;
	margin-left:10px;
}
.sub_gnb_etc li + li:before {
	content:'';
	display:block;
	width:1px;
	height:10px;
	background:#999999;
	position:absolute;
	top:2px;
	left:0;
}
.sub_gnb_etc li a {
	display:block;
	font-size:14px;
	line-height:14px;
}

#subGnb {
	text-align:center;
}
#subGnb a {
	display:block;
}
.sub_depth1 {
	position:relative;
	display:inline-block;
}
.sub_depth1 h3 {
	position:relative;
	z-index:100;
}
.sub_depth1 h3 a {
	padding:18px 62px;
	font-size:16px;
	line-height:16px;
	letter-spacing:-1px;
	color:#252626;
	background:#ffffff;
}
.sub_depth1.focus h3 a {
	color:#006be0;
}

.sub_depth2 {
	display:none;
	width:100%;
	padding-top:10px;
	border-top:1px solid #ebebeb;
	position:absolute;
	z-index:99;
	top:42px;
	border-radius:10px;
	background:#ffffff;
}
.sub_depth2 li h4 a {
	padding:12px 0;
	text-align:center;
	font-size:16px;
	line-height:16px;
	color:#252626;
	letter-spacing:-1px;
}
.sub_depth2 li:first-child h4 a {
	padding:14px 0 12px;
}
.sub_depth2 li:last-child h4 a {
	padding:12px 0 24px;
}
.sub_depth2 .focus h4 a {
	color:#006be0;
}
/* } 헤더 */

</style>
</head>
<body>
	<header>
		<!-- s header -->
	<div id="header">
		<div class="header_inner">
			<h1 class="logo"><a href="https://www.kmeetingroom.com"><img src="http://localhost:9000/space/images/logo_off.png"></a></h1>
		
			
			<ul id="gnb">
			
				<li class="depth1"><h3><a href="https://www.kmeetingroom.com/introduce">회의실닷컴<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="https://www.kmeetingroom.com/introduce">회의실닷컴 소개</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/guide">이용 안내</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/guide/partner">파트너 등록 안내</a></h4></li>
					</ul>
				</li>
				
				<li class="depth1"><h3><a href="https://www.kmeetingroom.com/centers">회의실<span class="gnb_bar"></span></a></h3>
				</li>
				
				<li class="depth1"><h3><a href="https://www.kmeetingroom.com/video">화상 회의실<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="https://www.kmeetingroom.com/centers?filter=conference">화상 회의실 찾기</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/video">화상 장비 렌탈</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/centers?filter=record_studio">영상녹화 스튜디오 찾기</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/video/studio">영상녹화 소프트웨어</a></h4></li>
					</ul>
				</li>
				
				<li class="depth1"><h3><a href="https://www.kmeetingroom.com/notices">고객센터<span class="gnb_bar"></span></a></h3>
					<ul class="depth2">
						<li><h4><a href="https://www.kmeetingroom.com/notices">공지사항</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/faq">자주묻는 질문</a></h4></li>
						<li><h4><a href="https://www.kmeetingroom.com/me/inquiries">1:1 문의</a></h4></li>
					</ul>
				</li>
				
			</ul>
			
			
			<ul class="gnb_etc">
					<li><a href="https://www.kmeetingroom.com/register/type">회원가입</a></li>
					<li><a href="https://www.kmeetingroom.com/login">로그인</a></li>
					<li><a href="https://www.kmeetingroom.com/me">나의 회의실</a></li>
			</ul>

			<form id="logout-form" action="https://www.kmeetingroom.com/logout" method="POST" style="display: none;">
				<input type="hidden" name="_token" value="JG5lgwlj2eG3zfWUYfpnf9hNuVbiZPMNDhRvYBQz">			</form>
		</div>
		<div class="header_bg_box"></div>
	</div>
	<!-- e header -->
	
	
	</header>
</body>
</html>