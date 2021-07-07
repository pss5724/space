<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/room.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery-ui.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.simple-dtpicker.js"></script>
<script src="http://localhost:9000/space/js/jquery-ui.js"></script>

<script>
$(document).ready(function() {
	
	$("html").click(function(e) { 
		if(!$(e.target).is(".select_data") && !$(e.target).is(".select_data *") && !$(e.target).is("label input") 
				&& !$(e.target).is(".before-month") && !$(e.target).is(".next-month")) { 
			$("label").siblings("div").removeClass("open");
			//$('*[name=date]').handleDtpicker('hide');
		}
	});

	$("label").click(function() {
		$(this).parent("li").siblings().children("div").removeClass("open");
		$(this).siblings("div").toggleClass("open");
		
		if($(this).siblings("div").hasClass("open")) {
			//$('*[name=date]').handleDtpicker('show');
		} else {
			//$('*[name=date]').handleDtpicker('hide');
		}
	});
	
	$(".icon-close").click(function() {
		alert("닫자");	
		//$(".select_data date").removeClass("open");
	});
	
	$(".btn_search_reset").click(function() {
		$(this).siblings("label").children("input").val("");
	});
	
	/* 날짜 선택 */
 	$('*[name=date]').appendDtpicker({
		locale:"ko",
		futureOnly: true,
		minuteInterval: 30,
		dateFormat:"YYYY.MM.DD 일 hh:mm"
    });
   
	/* 지역 선택 */
	$(".main_location").click(function() {
		$("#search_location").val($(this).text());	
		$(".location").removeClass("on");
	});
	
	$(".sub_location").click(function() {
		var location = $(this).parent().parent().siblings("span").text() + " > " + $(this).text()
		$("#search_location").val(location);
		$(".location").removeClass("on");
	});
	
	/* 타입 및 인원수 선택 */	
	$(".up").click(function() {
		var capacity = $(this).siblings(".room_capacity").val();
		capacity = Number(capacity);
		
		$(this).siblings(".room_capacity").val(capacity+5); //5씩 증가
		$(this).siblings(".down").addClass("active");
		$(this).parent().parent().siblings().find("input").val("0"); //다른 옵션 초기화
		$(this).parent().parent().siblings().find(".down").removeClass("active");
		
		var type = $(this).parent().siblings("span").text(); //선택한 타입
		$("#search_type").val(type + " " + $(this).siblings(".room_capacity").val());
	});
	
	$(".down").click(function() {
		var capacity = $(this).siblings(".room_capacity").val();
		capacity = Number(capacity);
		var type = $(this).parent().siblings("span").text();
		
		if(capacity > 5) {
			$(this).siblings(".room_capacity").val(capacity-5);
			$("#search_type").val(type + " " + $(this).siblings(".room_capacity").val());
		} else if(capacity > 0 && capacity <= 5) {
			$(this).siblings(".room_capacity").val(capacity-5);
			$("#search_type").val("");
			$(this).removeClass("active");
			
		}
	});
	
	/* 금액 슬라이더 */
	$( "#slider-range" ).slider({
		range: true,
		min: 0,
		max: 1000000,
		values: [ 0, 1000000 ],
		slide: function( event, ui ) {
		  $( "#amount" ).val( ui.values[ 0 ] + "원 ~ " + ui.values[ 1 ] + "원");
		}
	});
	$( "#amount" ).val( + $( "#slider-range" ).slider( "values", 0 ) + "원 ~ " + $( "#slider-range" ).slider( "values", 1 ) + "원");
	
	/* 옵션 버튼 선택 */
	$(".search_option button").click(function() {
		$(this).toggleClass("on");
	});
	
	/* 정렬 선택 */
	$(".sort_type li").click(function() {
		$(this).siblings("li").removeClass("on");
		$(this).addClass("on");
	});
	
	/* 지도 모달창 */
	$("#map").click(function(){
		$("#modal").show();
		$("#overlay").css({"opacity":"1","pointer-events":"auto"});
	});
	$("#exit").click(function(){
		$("#modal").hide();
		$("#overlay").css({"opacity":"0","pointer-events":"none"});
	});
	

});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="container">
		<!-- 상단 검색바 -->
		<div class="search_area_top">
			<div class="search_box">
				<p class="search_box_title">어떤 회의실을 찾고 있나요?</p>
				<ul class="search_box_list">
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_location.png"></span>
							<input type="text" name="location" id="search_location" placeholder="지역" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data location">
							<p>방문할 지역을 선택해주세요</p>
							<div>
								<ul class="location_list">
									<li>
										<span class="main_location">서울</span>
										<ul>
											<li><button class="sub_location">강남구</button></li>
											<li><button class="sub_location">강동구</button></li>
											<li><button class="sub_location">강서구</button></li>
											<li><button class="sub_location">광진구</button></li>
											<li><button class="sub_location">구로구</button></li>
											<li><button class="sub_location">금천구</button></li>
											<li><button class="sub_location">동작구</button></li>
											<li><button class="sub_location">마포구</button></li>
											<li><button class="sub_location">서대문구</button></li>
											<li><button class="sub_location">서초구</button></li>
											<li><button class="sub_location">성동구</button></li>
											<li><button class="sub_location">송파구</button></li>
											<li><button class="sub_location">영등포구</button></li>
											<li><button class="sub_location">용산구</button></li>
											<li><button class="sub_location">종로구</button></li>
											<li><button class="sub_location">중구</button></li>
										</ul>
									</li>
									<li>
										<span class="main_location">경기</span>
										<ul>
											<li><button class="sub_location">고양시</button></li>
											<li><button class="sub_location">광명시</button></li>
											<li><button class="sub_location">성남시</button></li>
											<li><button class="sub_location">안산시</button></li>
											<li><button class="sub_location">안양시</button></li>
										</ul>
									</li>																
								</ul>
							</div>
						</div>
					</li>
					<li>
						<label class="search_date_label">
							<span><img src="http://localhost:9000/space/images/search_icon_date.png"></span>
							<input type="text" name="date" id="search_date" placeholder="날짜/시간" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data date"></div>
					</li>
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_person.png"></span>
							<input type="text" name="type" id="search_type" placeholder="구조/인원" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data type">
							<ul class="room_type_list">
								<li>
									<span class="room_type">강의식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">분임식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">U자형</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">□자형</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">연회식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">극장식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<button type="button" class="btn_search">검색하기</button>
					</li>
				</ul>	
			</div>
		</div>
		
		<!-- ↓하단 검색내용↓ -->
		<div class="search_area_bottom">
			<!-- 좌측 옵션 검색 -->
			<div class="search_left_box">
				<!-- <a href="http://localhost:9000/space/room_map.do" target="" class="map" id="map">지도로 보기</a> -->
				<a class="map" id="map">지도로 보기</a>
				<div class="search_option_list">
					<div class="search_option">
						<p class="search_option_title">금액대(시간당)</p>
						<label for="amount"></label> 
						<input type="text" id="amount" readonly">
						<div id="slider-range"></div>
					</div>
					<div class="search_option">
						<p class="search_option_title">평점</p>
						<span class="stars_text">
							<span>1점</span> ~ <span>5점</span>
						</span>
						<div class="stars">
							<input type="checkbox" id="star1" name="star" value="1" checked="checked">
							<label for="star1"></label>
							<input type="checkbox" id="star2" name="star" value="2" checked="checked">
							<label for="star2"></label>
							<input type="checkbox" id="star3" name="star" value="3" checked="checked">
							<label for="star3"></label>
							<input type="checkbox" id="star4" name="star" value="4" checked="checked">
							<label for="star4"></label>
							<input type="checkbox" id="star5" name="star" value="5" checked="checked">
							<label for="star5"></label>
						</div>
					</div>
					<div class="search_option">
						<p class="search_option_title">편의시설</p>
						<ul>
							<li><button type="button" class="convenience">공용라운지</button></li>
							<li><button type="button" class="convenience">흡연실</button></li>
							<li><button type="button" class="convenience">주차장</button></li>
							<li><button type="button" class="convenience">승강기</button></li>
							<li><button type="button" class="convenience">화물승강기</button></li>
							<li><button type="button" class="convenience">자판기</button></li>
							<li><button type="button" class="convenience">Wi-Fi</button></li>
							<li><button type="button" class="convenience">장애인 화장실</button></li>
							<li><button type="button" class="convenience">화장실</button></li>
							<li><button type="button" class="convenience">정수기</button></li>
							<li><button type="button" class="convenience">KTX, SRT 인근</button></li>
						</ul>
					</div>
					<div class="search_option">
						<p class="search_option_title">부가서비스</p>
						<ul>
							<li><button type="button" class="service">빔프로젝터</button></li>
							<li><button type="button" class="service">화상회의장비</button></li>
							<li><button type="button" class="service">마이크</button></li>
							<li><button type="button" class="service">강연대</button></li>
							<li><button type="button" class="service">TV</button></li>
							<li><button type="button" class="service">스피커</button></li>
							<li><button type="button" class="service">PC/노트북</button></li>
							<li><button type="button" class="service">포인터</button></li>
							<li><button type="button" class="service">현수막</button></li>
							<li><button type="button" class="service">화이트보드</button></li>
							<li><button type="button" class="service">단상</button></li>
							<li><button type="button" class="service">컨퍼런스콜</button></li>
							<li><button type="button" class="service">에어컨</button></li>
							<li><button type="button" class="service">난방기</button></li>
							<li><button type="button" class="service">유선인터넷</button></li>
							<li><button type="button" class="service">영상스튜디오</button></li>
						</ul>
					</div>
					<div class="search_option">
						<p class="search_option_title">식음료</p>
						<ul>
							<li><button type="button" class="food">다과류 반입가능</button></li>
							<li><button type="button" class="food">다과류 별도판매</button></li>
							<li><button type="button" class="food">식사류 반입가능</button></li>
							<li><button type="button" class="food">식사류 별도판매</button></li>
						</ul>
					</div>
					<div class="search_option">
						<p class="search_option_title">결제구분</p>
						<ul>
							<li><button type="button" class="payment">온라인 결제</button></li>
							<li><button type="button" class="payment">현장 결제</button></li>
						</ul>
					</div>				
				</div>
			</div>
		

			<!-- 우측 검색 결과 -->
			<div class="search_right_box">
				<span class="result_count">검색된 센터 <span>100</span>개</span>
				<ul class="sort_type">
					<li>평점순</li>
					<li>인기순</li>
					<li>낮은금액순</li>
					<li>높은금액순</li>
				</ul>
				<div class="search_result">
					<ul>
						<li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room1.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">종로구 1호점</p>
										<p class="room_sub_title">접근성 및 회의실 컨디션 최상</p>
										<p class="room_location">세종로</p>
										<p class="room_capacity">54인실, 36인실, 22인실, 16인실</p>
										<ul>
											<li>다과류 별도판매</li>
											<li>식사류 별도판매</li>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star5.png">4.5점</p>
										<p class="room_review"><span>16</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li>
						<li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<!-- <span class="payment_online">온라인 결제</span> -->
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li>
						
	<!-- 추가 예제 -->					
												<li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li>						<li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li>						<li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li><li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li><li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li><li class="room_info">
							<a href="#">
								<div class="info_image"
									style="background: url('http://localhost:9000/space/images/room2.jpg') center top no-repeat; background-size: cover"></div>
								<div class="info_text">
									<div class="info_left">
										<p class="room_title">강남구2 1호점</p>
										<p class="room_sub_title">강남역 도보 2분 거리</p>
										<p class="room_location">강남구</p>
										<p class="room_capacity">40인실, 28인실, 16인실, 8인실</p>
										<ul>
											<li>공용 라운지</li>
											<li>흡연실</li>
											<li>주차장</li>
											<li>승강기</li>
											<li>화물승강기</li>
											<li>자판기</li>
											<li>Wi-Fi</li>
											<li>화장실</li>
											<li>정수기</li>
										</ul>
									</div>
									<div class="info_right">
										<p class="room_star"><img src="http://localhost:9000/space/images/list_star3.png">3.2점</p>
										<p class="room_review"><span>5</span>개의 이용후기</p>
										<P class="room_payment">
											<span class="payment_online">온라인 결제</span>
											<span class="payment_offline">현장 결제</span>
										</P>
										<P class="room_price"><span>38,500원</span>부터(시간)</P>
									</div>
								</div>
							</a>
						</li> 
						
					</ul>
				</div>
			</div>
		</div>
		<!-- ↑하단 검색내용↑ -->
		
	</div> 
	<!-- container -->
	
	<jsp:include page="../footer.jsp"></jsp:include>	
	<jsp:include page="room_map.jsp"></jsp:include>

</body>
</html>