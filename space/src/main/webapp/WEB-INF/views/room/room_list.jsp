<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"
    prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/room.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery.simple-dtpicker.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery-ui.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/room.js"></script>
<script src="http://localhost:9000/space/js/jquery.simple-dtpicker.js"></script>
<script src="http://localhost:9000/space/js/jquery-ui.js"></script>
<script>
$(document).ready(function() {	

	
	/* 검색버튼 클릭 */
	$(".btn_search").click(function() {
		getData();
		getList($("#pay1").text(), $("#pay2").text());
	});

	/* 옵션 버튼 선택 */
	var option_list = new Array();
	
	$(".search_option button").click(function() {
		$(this).toggleClass("on");
		
		if($(this).hasClass("on")) {
			option_list.push($(this).val());
		} else {
			var idx = option_list.indexOf($(this).val());
			option_list.splice(idx, 1);
		}
		getData();
		getList($("#pay1").text(), $("#pay2").text());
		
	});
	
	/* 옵션 검색 평점 체크 */
	$("input[name=star]").click(function() {
		
		$(this).prop("checked", true);
		$(this).prevAll("input[name=star]").prop("checked", true);
		$(this).nextAll("input[name=star]").prop("checked", false);

		$("#grade").val("1점 ~ " + $("input[name=star]:checked").length + "점");
		
		getData();
		getList($("#pay1").text(), $("#pay2").text());
	});	

	/* 정렬 선택 */
	var order = "";
	$(".sort_type li").click(function() {
		$(this).siblings("li").removeClass("on");
		$(this).toggleClass("on");
		
		if($(this).hasClass("on")) {
			order = $(this).attr("data");
		} else {
			order = "";
		}
		getData();
		getList($("#pay1").text(), $("#pay2").text());
	});

 	$(".ui-slider-handle, ui-slider-range, #slider-range").on("mouseup mousedown click mouseleave mouseenter", function(){
 		getData();
		getList($("#pay1").text(), $("#pay2").text());
	});
	
	/* 지역선택 */
	var addr_list = new Array();
	<c:forEach items="${addr_list}" var="addr">
		addr_list.push("${addr}");
	</c:forEach>
	
	var seoul="", gyeonggi="", incheon="";
	for(var i in addr_list) {
		if(addr_list[i].indexOf("서울") != -1) {
			$(".seoul li").remove();
			var list = addr_list[i].split(" ");
			seoul += "<li><button class='sub_location'>" + list[1] + "</button></li>";
		} else if(addr_list[i].indexOf("경기") != -1){
			$(".gyeonggi li").remove();
			var list = addr_list[i].split(" ");
			gyeonggi += "<li><button class='sub_location'>" + list[1] + "</button></li>";
		} else {
			$(".incheon li").remove();
			var list = addr_list[i].split(" ");
			incheon += "<li><button class='sub_location'>" + list[1] + "</button></li>";
		}
	}
	
	$(".seoul").append(seoul);
	$(".gyeonggi").append(gyeonggi);
	$(".incheon").append(incheon);

	$(".sub_location").click(function() {
		var location =  $(this).parent().parent().siblings("span").text() + " > " + $(this).text();
		$("#search_location").val(location);
		$(".location").removeClass("open");
	});
	
	/* 넘겨줄 데이터 정제 */
	var location1 = "<c:out value='${location1}'/>";
	var location2 = "<c:out value='${location2}'/>";
	
	if(location2 != "") {
		$("#search_location").val(location1+" > "+location2);
	} else {
		$("#search_location").val(location1);
	}
	
	var date="", time=0, type="", capacity=0, stars=5;
	$("#search_date").val("");
	
	function getData() {	
		if($("#search_location").val()!="") {
			if($("#search_location").val().indexOf(">") != -1) {
				var location_list = $("#search_location").val().split(" > ");
				location1 = location_list[0];  //서울
				location2 = location_list[1];  //강남구
			} else {
				location1 = $("#search_location").val();
				location2 = "";
			}
		} else {
			location1 = "";
			location2 = "";
		}
	
		if($("#search_date").val()!="") {
			var date_list = $("#search_date").val().split(" ");
			date = date_list[0];
			time = 0;
			
			var time_list = date_list[1].split(":");
			if (time_list[0] < 10) { //시간
				time += parseInt(time_list[0].substr(1, 1))
			} else {
				time += parseInt(time_list[0]);
			}
	
			if (time_list[1] >= 30) { //분
				time += 0.5;
			}
		} else {
			date = "";
		}
		
		if($("#search_type").val()!="") {
			var type_list = $("#search_type").val().split(" ");
			type = type_list[0];
			capacity = parseInt(type_list[1]);
		} else {
			type = "";
			capacity = 0;
		}
		
		stars = parseInt($('input[name=star]:checked').length);
	}
	
	getList($("#pay1").text(), $("#pay2").text());

	/* 리스트 출력 function */
 	function getList(min, max) {
		var params = {
				"location1": location1,
				"location2": location2,
		       	"date": date,
		       	"time": parseFloat(time),
		       	"type": type,
		       	"capacity": capacity,
		       	"min": parseInt(min.replace(/,/gi, "")),
		       	"max": parseInt(max.replace(/,/gi, "")),
		       	"stars": stars,
		       	"option_list": option_list,
		       	"order": order
		};
    	        
		$.ajax({
			url: "get_list.do",
			data: params,
			type: "POST",
			traditional: true,
			/* beforeSend: function(loading) {
				var img = "<img src='http://localhost:9000/space/images/loading.gif' class='loading_img'>";
				$(".result_count").remove();
				$(".search_result ul").remove();
				$(".search_result").append(img);
			}, */
			success: function(jdata) {
/* 				var tmp = JSON.stringify(data);
				var jdata = JSON.parse(tmp); */
				$(".loading_img").remove();
				
				var output = "<ul>";
				var count = "<span class='result_count'>검색된 센터 <span>0</span>개</span>";
				
				if(jdata.rlist.length == 0) {
					output += "<br>검색된 데이터가 없습니다.";
				} else {		
					for(var i=0; i<jdata.rlist.length; i++) {
						
						var star_count = 0;
						if(jdata.rlist[i].grade >= 1) {
							star_count = Math.round(jdata.rlist[i].grade);
						}
			
						output += "<li class='room_info'>";
						output += "<a href='http://localhost:9000/space/room_content.do?rid=" + jdata.rlist[i].rid + "&rpage=1'>";
						output += "<div class='info_image'>";
						output += "<img src='http://localhost:9000/space/upload/" + jdata.rlist[i].rsfile1 + "'>";
						output += "</div>";
						output += "<div class='info_text'>";
						output += "<div class='info_left'>";
						output += "<p class='room_title'>" + jdata.rlist[i].branch_name + "</p>";
						output += "<p class='room_sub_title'>"+ jdata.rlist[i].intro + "</p>";
						output += "<p class='room_location'>"+ jdata.rlist[i].address+ "</p>";
						output += "<p class='room_capacity'>"+ jdata.rlist[i].capacity +"인실</p>";
						output += "<ul>";
						if(jdata.olist[i].lounge == 1) { output += "<li>공용 라운지</li>"; }
						if(jdata.olist[i].smoking_room == 1) { output += "<li>흡연실</li>"; }
						if(jdata.olist[i].parking_lot == 1) { output += "<li>주차장</li>"; }
						if(jdata.olist[i].elevator == 1) { output += "<li>승강기</li>"; }
						if(jdata.olist[i].freight_elevator == 1) { output += "<li>화물승강기</li>"; }
						if(jdata.olist[i].vending_machine == 1) { output += "<li>자판기</li>"; }
						if(jdata.olist[i].wifi == 1) { output += "<li>Wi-Fi</li>"; }
						if(jdata.olist[i].accessible_toilet == 1) { output += "<li>장애인 화장실</li>"; }
						if(jdata.olist[i].toilet == 1) { output += "<li>화장실</li>"; }
						if(jdata.olist[i].water_dispenser == 1) { output += "<li>정수기</li>"; }
						if(jdata.olist[i].ktx == 1) { output += "<li>KTX/SRT 인근</li>"; }
						if(jdata.olist[i].beam == 1) { output += "<li>빔프로젝터</li>"; }
						if(jdata.olist[i].video_device == 1) { output += "<li>화상회의장비</li>"; }
						if(jdata.olist[i].mic == 1) { output += "<li>마이크</li>"; }
						if(jdata.olist[i].lectetn == 1) { output += "<li>강연대</li>"; }
						if(jdata.olist[i].tv == 1) { output += "<li>TV</li>"; }
						if(jdata.olist[i].speaker == 1) { output += "<li>스피커</li>"; }
						if(jdata.olist[i].pc == 1) { output += "<li>PC</li>"; }
						if(jdata.olist[i].pointer == 1) { output += "<li>포인터</li>"; }
						if(jdata.olist[i].banner == 1) { output += "<li>현수막</li>"; }
						if(jdata.olist[i].whiteboard == 1) { output += "<li>화이트보드</li>"; }
						if(jdata.olist[i].dais == 1) { output += "<li>단상</li>"; }
						if(jdata.olist[i].conference_call == 1) { output += "<li>컨퍼런스콜</li>"; }
						if(jdata.olist[i].air_conditional == 1) { output += "<li>에어컨</li>"; }
						if(jdata.olist[i].heater == 1) { output += "<li>난방기</li>"; }
						if(jdata.olist[i].internet == 1) { output += "<li>유선인터넷</li>"; }
						if(jdata.olist[i].studio == 1) { output += "<li>영상스튜디오</li>"; }
						output += "</ul>"
						output += "</div>";
						output += "<div class='info_right'>";
						output += "<p class='room_star'><img src='http://localhost:9000/space/images/list_star" + star_count + ".png'>" + jdata.rlist[i].grade + "점</p>";
						output += "<p class='room_review'><span>" + jdata.rlist[i].review_count + "</span>개의 이용후기</p>";
						output += "<P class='room_payment'>";
						if(jdata.olist[i].online_payment == 1) { output += "<span class='payment_online'>온라인 결제</span>"; }
						if(jdata.olist[i].offline_payment == 1) { output += "<span class='payment_offline'>현장 결제</span>"; }
						output += "</P>";
						output += "<P class='room_price'>";
						output += "<span>" + number_format(jdata.rlist[i].charge) + "원</span>부터(시간)";
						output += "</P>";
						output += "</div>";
						output += "	</div>";
						output += "</a>";
						output += "</li>";
					}//for문
					count = "<span class='result_count'>검색된 센터 <span>" + jdata.count + "</span>개</span>";
				}
				output += "</ul>";

				$(".result_count").remove();
				$(".count").append(count);
				
				$(".search_result ul").remove();
				$(".search_result").append(output);
			}//success
		});//ajax
	} //getList function
	
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
										<ul class="seoul">
										</ul>
									</li>
									<li>
										<span class="main_location">경기</span>
										<ul class="gyeonggi">
										</ul>
									</li>	
									<li>
										<span class="main_location">인천</span>
										<ul class="incheon">										
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
									<span class="room_type">ㅁ자형</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li class="btn_search_style">
						<button type="button" class="btn_search">검색하기</button>
					</li>
				</ul>	
			</div>
		</div>
		
		<!-- ↓하단 검색내용↓ -->
		<div class="search_area_bottom">
			<!-- 좌측 옵션 검색 -->
			<div class="search_left_box">
				<a class="map" id="map">지도로 보기</a>
				<div class="search_option_list">
					<div class="search_option">
						<p class="search_option_title">금액대(시간당)</p>
						<span class="search_charge">
							<span id="pay1"></span> ~ <span id="pay2"></span><span>원</span>
						</span>
						<div id="slider-range"></div>
					</div>
					<div class="search_option">
						<p class="search_option_title">평점</p>
						<span class="stars_text">
							<input type="text" id="grade" name="grade" value="1점 ~ 5점" readonly>
						</span>
						<div class="stars">
							<input type="checkbox" id="star1" name="star" value="1" checked>
							<label for="star1"></label>
							<input type="checkbox" id="star2" name="star" value="2" checked>
							<label for="star2"></label>
							<input type="checkbox" id="star3" name="star" value="3" checked>
							<label for="star3"></label>
							<input type="checkbox" id="star4" name="star" value="4" checked>
							<label for="star4"></label>
							<input type="checkbox" id="star5" name="star" value="5" checked>
							<label for="star5"></label>
						</div>
					</div>
					<div class="search_option">
						<p class="search_option_title">편의시설</p>
						<ul>
							<li><button type="button" class="convenience" value="lounge">공용라운지</button></li>
							<li><button type="button" class="convenience" value="smoking_room">흡연실</button></li>
							<li><button type="button" class="convenience" value="parking_lot">주차장</button></li>
							<li><button type="button" class="convenience" value="elevator">승강기</button></li>
							<li><button type="button" class="convenience" value="freight_elevator">화물승강기</button></li>
							<li><button type="button" class="convenience" value="vending_machine">자판기</button></li>
							<li><button type="button" class="convenience" value="wifi">Wi-Fi</button></li>
							<li><button type="button" class="convenience" value="accessible_toilet">장애인 화장실</button></li>
							<li><button type="button" class="convenience" value="toilet">화장실</button></li>
							<li><button type="button" class="convenience" value="water_dispenser">정수기</button></li>
							<li><button type="button" class="convenience" value="ktx">KTX/SRT 인근</button></li>
						</ul>
						<div class="btn_more">
							<span>더보기</span>
							<img src="http://localhost:9000/space/images/btn_more_img.png" class="btn_img">
						</div>
					</div>
					<div class="search_option">
						<p class="search_option_title">부가서비스</p>
						<ul>
							<li><button type="button" class="service" value="beam">빔프로젝터</button></li>
							<li><button type="button" class="service" value="video_device">화상회의장비</button></li>
							<li><button type="button" class="service" value="mic">마이크</button></li>
							<li><button type="button" class="service" value="lectern">강연대</button></li>
							<li><button type="button" class="service" value="tv">TV</button></li>
							<li><button type="button" class="service" value="speaker">스피커</button></li>
							<li><button type="button" class="service" value="pc">PC/노트북</button></li>
							<li><button type="button" class="service" value="pointer">포인터</button></li>
							<li><button type="button" class="service" value="banner">현수막</button></li>
							<li><button type="button" class="service" value="whiteboard">화이트보드</button></li>
							<li><button type="button" class="service" value="dais">단상</button></li>
							<li><button type="button" class="service" value="conference_call">컨퍼런스콜</button></li>
							<li><button type="button" class="service" value="air_conditional">에어컨</button></li>
							<li><button type="button" class="service" value="heater">난방기</button></li>
							<li><button type="button" class="service" value="internet">유선인터넷</button></li>
							<li><button type="button" class="service" value="studio">영상스튜디오</button></li>
						</ul>
						<div class="btn_more">
							<span>더보기</span>
							<img src="http://localhost:9000/space/images/btn_more_img.png" class="btn_img">
						</div>
					</div>
					<div class="search_option">
						<p class="search_option_title">식음료</p>
						<ul>
							<li><button type="button" class="food" value="snack_carry">다과류 반입가능</button></li>
							<li><button type="button" class="food" value="snack_sale">다과류 별도판매</button></li>
							<li><button type="button" class="food" value="meal_carry">식사류 반입가능</button></li>
							<li><button type="button" class="food" value="meal_sale">식사류 별도판매</button></li>
						</ul>
					</div>
					<div class="search_option">
						<p class="search_option_title">결제구분</p>
						<ul>
							<li><button type="button" class="payment" value="online_payment">온라인 결제</button></li>
							<li><button type="button" class="payment" value="offline_payment">현장 결제</button></li>
						</ul>
					</div>				
				</div>
			</div>
		

			<!-- 우측 검색 결과 -->
			<div class="search_right_box">
				<span class="count">
					<!-- <span class="result_count">검색된 센터 <span>100</span>개</span> -->
				</span>
				<ul class="sort_type">
					<li data="grade desc">평점순</li>
					<li data="review_count desc">인기순</li>
					<li data="charge">낮은금액순</li>
					<li data="charge desc">높은금액순</li>
				</ul>
				<div class="search_result">
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