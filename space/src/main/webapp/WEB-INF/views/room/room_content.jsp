<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.content {
	width: 800px;
	margin: 0 auto;
}

.label {
	padding-bottom: 20px;
}
.l_line {
	width: 6px;
	height: 20px;
	border-radius: 3px;
	background: #97ccff;
	display: inline-block;
}
.l_line + label {
	font-weight: bold;
	margin-left: 10px;
	font-size: 20px;
	color: #444444;
}

.res_cond, .facilities, .room_inform, .caution, .review {
	padding-top: 20px;
	border-bottom: 1px solid lightgray;
}



/* 회의실 이름 */
.room_name {
	height: 120px;
	border-bottom: 1px solid lightgray;
}
.room_name>div:first-child {
	width: 90px;
	height: 90px;
	display: inline-block;
	background: linear-gradient(to right, #5043e1 , #174dc0);
	text-align: center;
	padding-top: 35px;
}
.room_name>div:first-child>span {
	color: white;
	font-size: 26px;
	position: relative;
	bottom: 15px;
}
.room_name>div:first-child>img {
	width: 72px;
	position: relative;
	bottom: 15px;
}
.room_name>div:last-child {
	display: inline-block;
	width: 500px;
	margin-top: 25px;
	margin-left: 20px;
}
.room_name>div:last-child>img, .room_name>div:last-child>div>span{
	vertical-align: middle;
	font-weight: bold;
	line-height: 20px;
}
.room_name>div:last-child>div:first-child>span {
	font-size: 28px;
}
.room_name>div:last-child>div:nth-child(2) {
	margin: 5px 0 10px 0;
}
.room_name>div:last-child>div:nth-child(2)>span {
	color: #006be0;
}
.room_name>div:last-child>span:nth-child(5), .room_name>div:last-child>span:nth-child(6) {
	bottom: 0;
}
.room_name>div:last-child>span:nth-child(6) {
	color: #666666;
}
.room_name>div:last-child>div:last-child {
	width: 682px;
	display: flex;
	justify-content: space-between;
}
.room_name>div:last-child>div:last-child>div>span,.room_name>div:last-child>div:last-child>span {
	font-weight: bold;
	font-size: 14px;
	vertical-align: top;
	color: #444444;
}
.room_name>div:last-child>div:last-child>span>span {
	color: #006be0;
	font-weight: bold;
}

/* 캐러셀 */
.carousel_slide {
	margin-top: 50px;
	padding-bottom: 150px;
	border-bottom: 1px solid lightgray;
}
.carousel-inner img {
    width: 100%;
    height: 100%;
}
#custCarousel .carousel-indicators {
    position: static;
    margin-top: 20px;
}
#custCarousel .carousel-indicators>li {
    width: 100%;
}
#custCarousel .carousel-indicators li img {
    display: block;
    opacity: 0.5;
    height: 130px;
}
#custCarousel .carousel-indicators li.active img {
    opacity: 1;
}
#custCarousel .carousel-indicators li:hover img {
    opacity: 0.75;
}
.carousel-item img {
    width: 100%;
}

/* 예약현황 */
.res_cond table {
	width: 100%;
	border: 1px solid lightgray;
	border-collapse: collapse;
	font-size: 14px;
}
.res_cond th {
	background: #5e40e9;
	padding: 10px 0;
	color: white;
}
.res_cond th:first-child {
	text-align: left;
	padding-left: 10px;
}
.res_cond td {
	font-weight: bold;
	padding: 5px 0 5px 10px;
}
.end_box {
	width: 16px;
	height: 16px;
	background: #97ccff;
	display: inline-block;
	margin-right: 5px;
}
.end {
	text-align: right;
	padding: 10px 20px;
}
#res_date_cond {
	display: flex;
	justify-content: space-between;
	padding: 0 20px;
}
/* 네비게이션바 */
.nav {
	margin-top: 20px;
}
.nav>ul {
	width: 100%;
	background: #f7f7f7;
	display: flex;
	justify-content: center;
}
.nav>ul>li {
	list-style-type: none;
	display: inline;
	background: #f7f7f7;
	padding: 20px 0;
}
.nav>ul>li:hover {
	cursor: pointer;
}
.nav>ul>li>a {
	border-right: 1px solid lightgray;
	text-align: center;
	padding: 0 24.2px;
}
.nav>ul>li:last-child>a {
	border: none;
}
.nav>ul>li:hover {
	background: #008aff;
	color: white;
}

/* 시설안내 */
.facilities>div:first-child>div:last-child, .f_inform {
	padding: 0 20px;
}
.facilities>div:first-child {
	border-bottom: 1px solid lightgray;
	padding-bottom: 20px;
	margin-bottom: 10px;
}
.f_inform>ul>li {
	padding: 10px 0;
}
ul>li>label {
	font-weight: bold;
	width: 170px;
	display: inline-block;
	vertical-align: top;
}
.f_inform #rate {
	margin-right: 3px;
}
.f_inform>ul>li>div {
	display: inline-block;
	width: 584px;
}
.f_inform>ul>li>div>ul>li {
	text-align: center;
	float: left;
	margin-right: 20px;
}
.f_inform>ul>li>div>ul>li>img {
	display: block;
	margin: 0 auto;
}
.f_inform>ul>li>div>ul>li>span {
	color: #888888;
	font-size: 12px;
}
.f_inform>ul>li:nth-child(9)>div>ul>li>span {
	color: #888888;
	font-size: 12px;
	width: 50px;
	display: inline-block;
}


/* 회의실 안내 */
.room_inform>div:first-child {
	padding: 20px 0;
}
.room_inform>div:last-child {
	padding: 20px;
}
.room_inform>div>img {
	display: inline-block;
	margin-right: 10px;
	border-radius: 10px;
}
.room_inform>div>div:last-child {
	display: inline-block;
	vertical-align: top;
	width: 450px;
}
.room_inform>div>div:last-child>ul>li {
	padding: 10px 0;
}
.room_inform>div>div:last-child>ul>li>div:first-child>label>button {
	background-color: rgba( 255, 255, 255, 0.5 );
	border: none;
	font-size: 20px;
	margin-left: 5px;
	position: relative;
}
.room_inform>div>div:last-child>ul>li>div:first-child>label>button:hover {
	cursor: pointer;
}
.room_inform>div>div>ul>li:nth-child(4)>div:first-child>span {
	color: #f80d54;
	font-size: 12px;
	display: inline-block;
}
.room_inform>div>div>ul>li:nth-child(4)>div:first-child {
	width: 170px;
	display: inline-block;
}
.room_inform>div>div:last-child>div {
	margin-bottom: 10px;
	display: flex;
	justify-content: space-between;
}
.room_inform>div>div:last-child>div>label {
	font-size: 20px;
	color: #006be0;
	font-weight: bold;
}
.room_inform>div>div:last-child>div>input {
	background-color: rgba( 255, 255, 255, 0.5 );
	border: 1px solid lightgray;
	padding: 5px 20px;
	font-size: 14px;
}
.room_inform>div>div:last-child>div>input:hover {
	cursor: pointer;
}
.detail {
	display: none;
	position: absolute;
}
.detail>ul {
	width: 400px;
	border: 1px solid lightgray;
	border-radius: 5px;
	background: white;
}
.detail>ul>li{
	font-size: 14px;
	font-weight: bold;
}
.detail>ul>li>label{
	color: white;
	padding: 10px 20px;
	background: #006be0;
}
.detail>ul>li>span {
	padding: 10px 20px;
}
.room_inform>div>div>ul>li:nth-child(4)>div:last-child {
	width: 270px;
	display: inline-block;
	vertical-align: top;
}
.room_inform>div>div>ul>li:nth-child(4)>div:first-child>label {
	font-weight: bold;
	width: 170px;
	display: inline-block;
}
/* 회의실 안내 - 이미지 크게 보기 */
.large_img {
	display: inline-block;
	position: relative;
	bottom: 10px;
	right: 45px;
}
.large_img>img:hover {
	cursor: pointer;
}
.large_img>div {
	padding: 30px;
	background-color: white;
	border-radius: 10px;
	display: none;
	position: absolute;
	top: -290px;
	left: -265px;
	text-align: right;
	z-index: 10;
}
.large_img>div>img:first-child {
	position: absolute;
	top: 10px;
	right: 10px;
}
.large_img>div>img:first-child:hover {
	cursor: pointer;
}


/* 주의사항 */
.caution>ul {
	padding: 0 20px;
}
.caution>ul>li {
	padding-bottom: 20px;
}
.caution>ul>li>label{
	vertical-align: top;
}
.caution>ul>li>label>img {
	margin-right: 5px;
}
.caution>ul>li>div {
	display: inline-block;
	width: 584px;
}

/* 이용후기 */
.review>div:nth-child(2) {
	padding: 20px 0;
	border: 3px solid lightgray;
	text-align: center;
	margin: 0 20px 20px 20px;
}
.review>div>div {
	display: inline-block;
}
.review>div>div#total {
	border-right: 1px solid lightgray;
	padding: 0 30px 0 0;
	text-align: center;
	vertical-align: middle;
}
.review>div>div#total>span {
	font-size: 20px;
	background: #fff9ea;
	border: 1px solid #fff9ea;
	border-radius: 10px;
	font-weight: bold;
}
#total>span>span {
	color: #006be0;
}
#satis {
	padding-left: 20px;
	text-align: left;
	width: 500px;
	vertical-align: middle;
}
#satis>img {
	padding-left: 5px;
	vertical-align: -3px;
}
#satis>img:nth-child(2), #satis>img:nth-child(7) {
	margin-right: 13px;
}
#satis>span {
	font-weight: bold;
	font-size: 14px;
}
.review>ul>li>div {
	padding: 20px 0;
	margin: 0 20px;
	border-bottom: 1px solid lightgray;
}
.review>ul>li:first-child>div {
	border-bottom: 1px solid lightgray;
	border-top: 1px solid lightgray;
}
.review>ul>li>div>div:nth-child(2) {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}
.review>ul>li>div>div:nth-child(2)>span {
	font-size: 14px;
}
.review>ul>li>div>div:nth-child(2)>div>img {
	vertical-align: middle;
}
.review>ul>li>div>div:nth-child(2)>div>span {
	vertical-align: middle;
	font-weight: bold;
	font-size: 14px;
}
.review>ul>li>div>span {
	font-size: 14px;
}
.review>ul>li:last-child>div {
	border: none;
}
#user_id {
	padding-left: 3px;
	font-weight: bold;
}
#ampaginationsm {
	text-align: center;
}
.pager-prev>a {
	background: url("http://localhost:9000/space/images/cus_calendar_top_leftbtn.png");
	background-repeat: no-repeat;
	background-position: center;
	width: 35px;
	height: 35px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 50%;
	padding: 10px;
}
.pager-next>a {
	background: url("http://localhost:9000/space/images/cus_calendar_top_rightbtn.png");
	background-repeat: no-repeat;
	background-position: center;
	width: 35px;
	height: 35px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 50%;
  	padding: 10px;
}
.am-pagination-default-sm > li > a,
.am-pagination-default-sm > li > span {
}

/* 오시는 길 */
.map {
	padding: 20px 0;
}
#g_map {
	height: 400px;
	margin: 0 20px;
}
.oblique {
	height: 10px;
	width: 100%;
	background-image: url("http://localhost:9000/space/images/item_viewbox_bottom_bar.png");
}
/* 비슷한 회의실 */
.similar {
	padding: 20px 0;
}
.s_room {
	border: 1px solid lightgray;
	border-radius: 10px;
}
.s_room>div {
	padding: 7px;
}
.s_room>div>div>img, .s_room>div>img {
	display: inline-block;
}
.s_room>div>span:first-child {
	font-size: 11px;
	color: #3875e6;
	font-weight: bold;
	display: block;
}
.s_room>div>span:nth-child(2) {
	font-size: 15px;
	font-weight: bold;
	display: block;
}
.s_room>div>div:nth-child(3) {
	margin-top: 15px;
}
.s_room>div>div:nth-child(3)>span,.s_room>div>span:nth-child(5) {
	font-size: 11px;
	margin-left: 2px;
	color: #444444;
	font-weight: bold;
}
.s_room>div>span:nth-child(5) {
	margin-left: -3px;
}
.s_room>div>div:last-child {
	margin-top: 10px;
}
.s_room>div>div:last-child>span:first-child {
	font-weight: bold;
	font-size: 15px;
}
.s_room>div>div:last-child>span:nth-child(2) {
	margin-left: -7px;
	font-size: 11px;
	color: #444444;
}
.s_room>div>div:last-child>img {
	width: 55px;
	vertical-align: middle;
}
.s_room>div>div:last-child>span:last-child {
	margin-left: 5px;
	font-size: 11px;
	color: #666666;
	font-weight: bold;
	vertical-align: middle;
}


/* 데이트피커 */
#datepicker {
	border: none;
	border-bottom: 1px solid #bfbfbf;
	padding: 10px;
	margin-left: 10px;
	vertical-align: middle;
	width: 210px;
}
.ui-datepicker {
	background-color: white;
	width: 210px;
	padding: 10px;
	display: none;
}
.ui-icon {
	position: absolute;
}
.ui-icon:hover{
	cursor: pointer;
}
.ui-icon-circle-triangle-w {
	left: 20px;
	width: 10px;
	height: 20px;
	background: url("http://localhost:9000/space/images/cus_calendar_top_leftbtn.png");
	background-repeat: no-repeat;
	background-position: center;
}
.ui-icon-circle-triangle-e {
	right: 20px;
	width: 10px;
	height: 20px;
	background: url("http://localhost:9000/space/images/cus_calendar_top_rightbtn.png");
	background-repeat: no-repeat;
	background-position: center;
	
}
.ui-datepicker-header {
	border-bottom: 1px solid #bfbfbf;
	padding-bottom: 10px;
}
.ui-datepicker-title {
	text-align: center;
}
.ui-datepicker-title>span {
	font-weight: bold;
}
.ui-datepicker th.ui-datepicker-week-end:first-child {
	color: #d30000;
}
.ui-datepicker th {
	height: 20px;
	font-size: 12px;
}
.ui-datepicker td {
	text-align: center;
	padding: 5.7px;
	font-size: 12px;
	color: #bfbfbf;
}
.ui-datepicker-trigger {
	border: none;
	background: none;
	vertical-align: middle;
	margin-left: -25px;
}

/* 예약하기 버튼 */
.r_button {
	text-align: right;
	padding: 0 10px 20px 10px;
	display: flex;
	justify-content: space-between;
}
#btn_next {
	padding: 10px;
	width: 100px;
	border: 1px solid #104ebc;
	background: #104ebc;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	font-size: 14px;
}
#btn_golist {
	padding: 10px;
	width: 100px;
	border: 1px solid #2d2d2e;
	background: #2d2d2e;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	font-size: 14px;
}
#btn_next:hover, #btn_golist:hover {
	cursor: pointer;
}

</style>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/c_carousel.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="http://localhost:9000/space/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/space/css/slick-theme.css"/>
<link rel="stylesheet" href="http://localhost:9000/space/css/am-pagination.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyBmLyB6XJqHVUN1U86gHoIahlUtr1uHkGw"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<script src="http://localhost:9000/space/js/am-pagination.js"></script>

<script>
$(document).ready(function() {
	
	var mapContainer = document.getElementById('g_map');
	var mapOptions = {
		center: new google.maps.LatLng(37.51312106734197, 127.0597625707216),
		zoom: 15
	};
	var map = new google.maps.Map(mapContainer, mapOptions);	
	var title = "서울 강남구 영동대로 517";
	var marker = new google.maps.Marker({position: {lat:37.51312106734197, lng:127.0597625707216}, map: map, label:{
	      fontSize: "12px",
	      fontWeight: "bold",
	}
	});
	var infowindow = new google.maps.InfoWindow({zIndex:1});
    infowindow.setContent('<div style="font-size:12px;">' + title + '</div>');
    infowindow.open(map, marker);
    
	$('.slider').slick({
  	  slidesToShow: 3, //한 화면에 보여줄 아이템수
  	  slidesToScroll: 3 // 한번에 슬라이드 시킬 아이템 개수
  });
	
	$('#datepicker').datepicker({
		dateFormat: 'yy.mm.dd',
        prevText: ' ',
        nextText: ' ',
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '.',
        showOn: 'button',
        buttonImage: 'http://localhost:9000/space/images/cal_btn_img01.png'
	});

	$("#datepicker").datepicker().datepicker("setDate", new Date());
	
var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 7,	    		// max page size
	    totals: 5,	// total pages	
	    page: 1,		// initial page		
	    pageSize: 2,	// max number items per page
		
	    //totals: ${dbcount},	// total pages	
	    //page: ${rpage},		// initial page		
	    //pageSize: ${pageSize},	// max number items per page
	    
	    
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: ' ',		
	    nextText: ' ',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){  //페이지가 변경되면 href의 주소 변경
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/space/room_content.do?rpage="+e.page);         
    });
	
	$(".select_btn").click(function(){
			$(this).css('background','#006be0').css('color','white');
			$(".room_inform>div:last-child").css('border', '1px solid #006be0')
	});
	
    $("#btn_detail").click(function(){
    	$("#detail").toggle();
    });
    
    $(".large_img>img").click(function(){
    	$(".large_img>div").show();
    	$(".large_img>div").css('box-shadow','rgba(0,0,0,0.5) 0 0 0 9999px');
    });
    
    $(".large_img>div>img:first-child").click(function(){
    	$(".large_img>div").hide();
    });
    
    
    
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="content">
		<!-- 회의실 이름 -->
		<div class="room_name">
			<div>
				<span>4.7</span><br>
				<img src="http://localhost:9000/space/images/list_star50.png">
			</div>
			<div>
				<div><span>강남구 7호점</span><br></div>
				<div><span>실내 인테리어가 고급스러운 회의실</span></div>
				<div>
					<div><img src="http://localhost:9000/space/images/map_icon01.png">
					<span>서울 강남구 영동대로 517 30층, 37층 / 삼성역</span></div>
					<span><span>5</span>개의 이용후기</span>
				</div>
			</div>
		</div>
		
		<!-- 캐러셀 -->
		<div class="carousel_slide">
			<div class="row">
		        <div class="col-md-12">
		            <div id="custCarousel" class="carousel slide" data-ride="carousel" align="center">
		                <!-- slides -->
		                <div class="carousel-inner">
		                    <div class="carousel-item active"> <img src="http://localhost:9000/space/images/carousel1.jpg" alt="Hills"> </div>
		                    <div class="carousel-item"> <img src="http://localhost:9000/space/images/carousel2.jpg" alt="Hills"> </div>
		                    <div class="carousel-item"> <img src="http://localhost:9000/space/images/carousel3.jpg" alt="Hills"> </div>
		                </div> <!-- Left right --> <a class="carousel-control-prev" href="#custCarousel" data-slide="prev"> <span class="carousel-control-prev-icon"></span> </a> <a class="carousel-control-next" href="#custCarousel" data-slide="next"> <span class="carousel-control-next-icon"></span> </a> <!-- Thumbnails -->
		                <ol class="carousel-indicators list-inline">
		                    <li class="list-inline-item active"> <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/carousel1.jpg" class="img-fluid"> </a> </li>
		                    <li class="list-inline-item"> <a id="carousel-selector-1" data-slide-to="1" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/carousel2.jpg" class="img-fluid"> </a> </li>
		                    <li class="list-inline-item"> <a id="carousel-selector-2" data-slide-to="2" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/carousel3.jpg" class="img-fluid"> </a> </li>
		                </ol>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 회의실 예약 현황 -->
		<div class="res_cond">
			<div class="label"><div class="l_line"></div><label>회의실 예약 현황</label></div>
			<div id="res_date_cond">
				<span>날짜를 선택하여 예약 현황을 확인하세요.</span>
				<div><input id="datepicker"></div>
			</div>
			<div class="end"><div class="end_box"></div><span>예약마감</span></div>
			<table border="1">
				<tr>
					<th colspan="5">회의실명</th>
					<th colspan="2">07</th>
					<th colspan="2">08</th>
					<th colspan="2">09</th>
					<th colspan="2">10</th>
					<th colspan="2">11</th>
					<th colspan="2">12</th>
					<th colspan="2">13</th>
					<th colspan="2">14</th>
					<th colspan="2">15</th>
					<th colspan="2">16</th>
					<th colspan="2">17</th>
					<th colspan="2">18</th>
					<th colspan="2">19</th>
					<th colspan="2">20</th>
					<th colspan="2">21</th>
					<th colspan="2">22</th>
				</tr>
				<tr>
					<td colspan="5">30층 노스</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
		
		<!-- 네비게이션 바 -->
		<div class="nav">
			<ul>
			    <li class="nav-item">
			      <a class="nav-link" href="#facilities">시설안내</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#room_inform">회의실 안내</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#caution">예약 시 주의사항</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#review">이용후기</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#map">오시는길</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">취소/환불정책</a>
			    </li>
			  </ul>
		</div>
		
		<!-- 시설안내 -->
		<div class="facilities" id="facilities">
			<div>
				<div class="label"><div class="l_line"></div><label>시설안내</label></div>
				<div>
					<span>
						*코로나 기간동안 회의내내 반드시 마스크 착용필수 입니다.<br>
						서울 지하철 환승 구간 (접근인원이 많은 2호선, 9호선)으로 접근성이 뛰어나며, 국내에 유일하게 VIP고객들을 위한 호텔, 승무원 출신 등의 비서진 컨시어지 서비스가 가능하고 주변 제휴업체를 통한 케이터릴 서비스, 최첨단 프레젠테이션 보유 및 다양한 회의 목적에 맞는 수입가구 완비, Conference call 기능이 내장된 전화기가 제공되어 국내외 기업과의 교류 형태의 행사진행, 교육, 세미나, 임원회의 등에 용의합니다.
					</span>
				</div>
			</div>
			<div class="f_inform">
				<ul>
					<li>
						<label>영업시간</label>
						<div><span>09:00 ~ 22:00</span></div>
					</li>
					<li>
						<label>휴무일</label>
						<div><span>주말 및 공휴일</span></div>
					</li>
					<li>
						<label>입, 퇴실 시간</label>
						<div><span>예약시간 10분 전 입실 / 정시 퇴실</span></div>
					</li>
					<li>
						<label>결제구분</label>
						<div><span>현장결제</span></div>
					</li>
					<li>
						<label>현장결제 선금</label>
						<div><span>0%</span></div>
					</li>
					<li>
						<label>평점</label>
						<img src="http://localhost:9000/space/images/list_star50.png" id="rate">4.7
					</li>
					<li>
						<label>수용형태</label>
						<div>
							<ul>
								<li>
									<img src="http://localhost:9000/space/images/shape_icon03.png">
									<span>U자형</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/shape_icon04.png">
									<span>ㅁ자형</span>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<label>편의시설</label>
						<div>
							<ul>
								<li>
									<img src="http://localhost:9000/space/images/convenience_icon01.png">
									<span>공용 라운지</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/convenience_icon02.png">
									<span>흡연실</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/convenience_icon03.png">
									<span>주차장</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/convenience_icon04.png">
									<span>승강기</span>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<label>식음료</label>
						<div>
							<ul>
								<li>
									<img src="http://localhost:9000/space/images/fab_icon01.png">
									<span>다과류 반입가능</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/fab_icon01.png">
									<span>다과류 별도판매</span>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<label>식음료 안내사항</label>
						<div><span>코로나로 인해 케이터링 주문 불가하며, 외부 간단한 다과류도 반입 금지 (물과 음료 종류만 가능)</span></div>
					</li>
					<li>
						<label>사전수화물접수</label>
						<div><span>일부가능(행사 당일만 보관 가능)</span>
					</li>
					<li>
						<label>주차안내</label>
						<div><span>지하 주차장, 3,300원/시간(회의실결제-컨시어지에서 행사당일 차량번호 등록), 4,800원/시간(별도 주차장결제)</span></div>
					</li>
					<li>
						<label>회의명 안내</label>
						<div><span>인포데스크 옆 TV(png파일 세로형-미전달시 기재x), 30F, 37F 엘리베이터 앞 안내</span></div>
					</li>
				</ul>
			</div>
		</div>
			
		<!-- 회의실 안내 -->
		<div class="room_inform" id="room_inform">
			<div class="label"><div class="l_line"></div><label>회의실 안내</label></div>
			<div>
				<img src="http://localhost:9000/space/images/carousel1.jpg" width="250px" height="220px">
				<div class="large_img">
					<img src="http://localhost:9000/space/images/thum_more_icon.png">
					<div>
						<img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box02_content_box_list_slide_box_close_btn.png">
						<img src="http://localhost:9000/space/images/carousel1.jpg">
					</div>
				</div>
				<div>
					<div>
						<label>30층 노스</label>
						<input type="button" value="선택" class="select_btn">
					</div> 
					<span>88,000원 / 시간</span>
					<ul>
						<li>
							<label>면적(㎡)</label>
							<span>13㎡</span>
						</li>
						<li>
							<label>최저 이용시간</label>
							<span>1시간</span>
						</li>
						<li>
							<label>수용형태</label>
							<span>U자형 6명</span>
						</li>
						<li>
							<div><label>부가서비스<button type="button" title="세부사항 보기" id="btn_detail">+</button></label>
							<span>(세부사항 보기)</span></div>
							<div class="detail" id="detail">
								<ul>
									<li>
										<label>TV</label>
										<span>72인치</span>
									</li>
									<li>
										<label>화이트보드</label>
										<span>가능</span>
									</li>
									<li>
										<label>컨퍼런스콜</label>
										<span>Polycom 가능</span>
									</li>
									<li>
										<label>에어컨</label>
										<span>가능</span>
									</li>
									<li>
										<label>난방기</label>
										<span>가능</span>
									</li>
									<li>
										<label>유선인터넷</label>
										<span>가능</span>
									</li>
								</ul>
							</div>
							<div><span>TV, 화이트보드, 컨퍼런스콜, 에어컨, 난방기, 유선인터넷</span></div>
						</li>
						<li>
							<label>레이아웃</label>
							<span>고정형</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 예약 시 주의사항 -->
		<div class="caution" id="caution">
			<div class="label"><div class="l_line"></div><label>예약 시 주의사항</label></div>
			<ul>
				<li>
					<label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">주의사항</label>
					<div>
						실내 흡연 금지<br>
						사전 승인되지 않은 음식물 반입 금지 (간단 다과 반입 시 수거 필수)<br>
						각종 노트북 젠더 미제공<br>
						1F 인포메이션 게이트에서 일일카드 발급<br>
						(신분증/명함 맡겨야함, 담당자가 행사 일주일 전까지 참석자 사전 전달 시 신분증 제출 필요 없음)
					</div>
				</li>
				<li>
					<label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">예약정책</label>
					<div>
						계약금 없음, 카드사본 대체<br>
						결제수단 : 계좌이체(세금계산서발행), 방문 카드결제<br>
						(취소위약금 : 예약시 고객이 첨부한 카드사본으로 위약금 결제 진행)
					</div>
				</li>
				<li>
					<label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">취소/환불 정책</label>
					<div>
						아래 취소 가능 기간은 평일 9~18시 기준입니다. *주말/공휴일 미포함*<br>
						사용 48시간전~사용 24시간전 : 총 합계 금액의 50% 부과<br>
						사용 24시간전~행사 당일 : 총 합계 금액의 100% 부과
					</div>
				</li>
			</ul>
		</div>
		
		<!-- 이용후기 -->
		<div class="review" id="review">
			<div class="label"><div class="l_line"></div><label>이용후기</label></div>
			<div>
				<div id="total">
					<span>총 평점 <span>4.7</span></span>
					<br>
					<img src="http://localhost:9000/space/images/list_star50.png">
				</div>
				<div id="satis">
					<span>위치 만족도 <span>4.8</span></span>
					<img src="http://localhost:9000/space/images/list_star50.png">
					
					<span>시설 만족도 <span>4.8</span></span>
					<img src="http://localhost:9000/space/images/list_star50.png">
					<br>
					<span>가격 만족도 <span>4.6</span></span>
					<img src="http://localhost:9000/space/images/list_star50.png">
					
					<span>서비스 만족도 <span>4.4</span></span>
					<img src="http://localhost:9000/space/images/list_star50.png">
				</div>
			</div>
			
			<ul>
				<li>
					<div>
						<div id="user_id">woo*****</div>
						<div>
							<div>
								<img src="http://localhost:9000/space/images/list_star50.png">
								<span>5</span>
							</div>
							<span>강남구 7호점 | 2020.11.02</span>
						</div>
						<span>깨끗하고 넓은 회의실이었습니다. 급한 회의나 미팅에서 활용도가 좋을 것 같습니다. 만족스럽게 이용했습니다.</span>
					</div>
				</li>
				<li>
					<div>
						<div id="user_id">woo*****</div>
						<div>
							<div>
								<img src="http://localhost:9000/space/images/list_star50.png">
								<span>5</span>
							</div>
							<span>강남구 7호점 | 2020.11.02</span>
						</div>
						<span>깨끗하고 넓은 회의실이었습니다. 급한 회의나 미팅에서 활용도가 좋을 것 같습니다. 만족스럽게 이용했습니다.</span>
					</div>
				</li>
				<li>
					<div>
						<div id="user_id">woo*****</div>
						<div>
							<div>
								<img src="http://localhost:9000/space/images/list_star50.png">
								<span>5</span>
							</div>
							<span>강남구 7호점 | 2020.11.02</span>
						</div>
						<span>깨끗하고 넓은 회의실이었습니다. 급한 회의나 미팅에서 활용도가 좋을 것 같습니다. 만족스럽게 이용했습니다.</span>
					</div>
				</li>
				<li>
					<div>
						<div id="user_id">woo*****</div>
						<div>
							<div>
								<img src="http://localhost:9000/space/images/list_star50.png">
								<span>5</span>
							</div>
							<span>강남구 7호점 | 2020.11.02</span>
						</div>
						<span>깨끗하고 넓은 회의실이었습니다. 급한 회의나 미팅에서 활용도가 좋을 것 같습니다. 만족스럽게 이용했습니다.</span>
					</div>
				</li>
				<li>
					<div>
						<div id="user_id">woo*****</div>
						<div>
							<div>
								<img src="http://localhost:9000/space/images/list_star50.png">
								<span>5</span>
							</div>
							<span>강남구 7호점 | 2020.11.02</span>
						</div>
						<span>깨끗하고 넓은 회의실이었습니다. 급한 회의나 미팅에서 활용도가 좋을 것 같습니다. 만족스럽게 이용했습니다.</span>
					</div>
				</li>
				<li><div id="ampaginationsm"></div></li>
			</ul>
		</div>
		
		<!-- 오시는 길 -->
		<div class="map" id="map">
			<div class="label"><div class="l_line"></div><label>오시는 길</label></div>
			<span></span>
			<div id="g_map"></div>
		</div>
		
		<div class="oblique"></div>
		
		<!-- 비슷한 회의실 -->
		<div class="similar">
			<div class="label"><div class="l_line"></div><label>비슷한 회의실</label></div>
			<div data-slick='{"slidesToShow": 4, "slidesToScroll": 4}' class="slider">
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel1.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star50.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel2.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star40.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel3.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star50.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel1.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star40.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel2.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star50.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			  <div class="s_room">
			  	<img src="http://localhost:9000/space/images/carousel3.jpg" width="178px">
			  	<div>
			  		<span>롯데월드타워에 위치한 컨벤션</span>
			  		<span>송파구 2호점 (신천동)</span>
			  		<div>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info01.png"><span>신천동</span>
			  			<img src="http://localhost:9000/space/images/cont_list_detail_info02.png"><span>잠실역</span>
			  		</div>
			  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png">
			  		<span>240인실, 135인실, 100인실...</span>
			  		<div>
			  			<span>101,000원</span>
			  			<span>부터</span>
			  			<img src="http://localhost:9000/space/images/star50.png"><span>0</span>
			  		</div>
			  	</div>
			  </div>
			</div>
		</div>
		
		<!-- 버튼 -->
		<div class="r_button">
			<a href="room_list.do"><input type="button" value="목록으로" id="btn_golist"></a>
			<a href="room_reserve.do"><input type="submit" value="예약하기" id="btn_next"></a>
		</div>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	

	
	
</script>
</html>