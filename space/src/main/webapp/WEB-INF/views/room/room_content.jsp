<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/c_carousel.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/room_reserve.css">
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
		center: new google.maps.LatLng(37.55539849783088, 126.98713113288264),
		zoom: 10
	};
	var map = new google.maps.Map(mapContainer, mapOptions);
	
	var geocoder = new google.maps.Geocoder();
	
	geocodeAddress(geocoder, map);

	function geocodeAddress(geocoder, resultMap) {
        console.log('geocodeAddress 함수 실행');

        // 주소 설정
        var address = "<c:out value='${vo.address}'/>";

        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지. 
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         * 
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': address}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(16);
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    position: result[0].geometry.location
                });
                
                var title = "<c:out value='${vo.address}'/>";
                
            	var infowindow = new google.maps.InfoWindow({zIndex:1});
                infowindow.setContent('<div style="font-size:12px;">' + title + '</div>');
                infowindow.open(map, marker);
                
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }
	
	
    
	$('.slider').slick({
  	  slidesToShow: 4, //한 화면에 보여줄 아이템수
  	  slidesToScroll: 4 // 한번에 슬라이드 시킬 아이템 개수
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
    
    $(".select_btn").click(function(){
    	$(this).data('clicked', true);
    });
    
    $("#btn_reserve").click(function(){
    	if($(".select_btn").data('clicked') == true){
    		location.replace('http://localhost:9000/space/room_reserve.do?rid=<c:out value='${vo.rid}'/>');
    	}else {
    		alert("회의실을 선택해주세요");
    		$(".select_btn").focus();
    		return false;
    	}
    });
    
    
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="room_content">
		<!-- 회의실 이름 -->
		<div class="room_name">
			<div>
				<span>4.7</span><br>
				<img src="http://localhost:9000/space/images/list_star50.png">
			</div>
			<div>
				<div><span>${vo.branch_name }</span><br></div>
				<div><span>${vo.intro }</span></div>
				<div>
					<div><img src="http://localhost:9000/space/images/map_icon01.png">
					<span>${vo.address }</span></div>
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
		                    <div class="carousel-item active"> <img src="http://localhost:9000/space/images/${vo.rfile1 }.jpg" alt="Hills"> </div>
		                    <c:if test="${vo.rfile2 != null }"> <div class="carousel-item"> <img src="http://localhost:9000/space/images/${vo.rfile2 }.jpg" alt="Hills"> </div> </c:if> 
		                    <c:if test="${vo.rfile3 != null }"> <div class="carousel-item"> <img src="http://localhost:9000/space/images/${vo.rfile3 }.jpg" alt="Hills"> </div> </c:if>
		                </div> <!-- Left right --> <a class="carousel-control-prev" href="#custCarousel" data-slide="prev"> <span class="carousel-control-prev-icon"></span> </a> <a class="carousel-control-next" href="#custCarousel" data-slide="next"> <span class="carousel-control-next-icon"></span> </a> <!-- Thumbnails -->
		                <ol class="carousel-indicators list-inline">
		                    <li class="list-inline-item active"> <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/${vo.rfile1 }.jpg" class="img-fluid"> </a> </li>
		                    <c:if test="${vo.rfile2 != null }">
		                   		<li class="list-inline-item"> <a id="carousel-selector-1" data-slide-to="1" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/${vo.rfile2 }.jpg" class="img-fluid"> </a> </li>
		                    </c:if>
		                    <c:if test="${vo.rfile3 != null }">
		                    	<li class="list-inline-item"> <a id="carousel-selector-2" data-slide-to="2" data-target="#custCarousel"> <img src="http://localhost:9000/space/images/${vo.rfile2 }.jpg" class="img-fluid"> </a> </li>
		                    </c:if>
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
					<td colspan="5">${vo.room_name }</td>
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
			<div class="label"><div class="l_line"></div><label>시설안내</label></div>
			<div class="f_inform">
				<ul>
					<li>
						<label>영업시간</label>
						<div>
							<span>
								09:00 ~ 22:00
							</span>
						</div>
					</li>
					<li>
						<label>휴무일</label>
						<div><span>${vo.closed_day }</span></div>
					</li>
					<li>
						<label>입, 퇴실 시간</label>
						<div><span>${vo.check_info }</span></div>
					</li>
					<li>
						<label>결제구분</label>
						<c:choose>
							<c:when test="${ovo.online_payment == 1 && ovo.offline_payment == 0}">
								<div><span>온라인결제</span></div>
							</c:when>
							<c:when test="${ovo.online_payment == 1 && ovo.offline_payment == 1}">
								<div><span>온라인결제, 현장결제</span></div>
							</c:when>
							<c:otherwise>
								<div><span>현장결제</span></div>
							</c:otherwise>
						</c:choose>
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
									<c:choose>
										<c:when test="${vo.type == '강의식' }">
											<img src="http://localhost:9000/space/images/shape_icon01.png">
										</c:when>
										<c:when test="${vo.type == '분임식' }">
											<img src="http://localhost:9000/space/images/shape_icon02.png">
										</c:when>
										<c:when test="${vo.type == 'U자형' }">
											<img src="http://localhost:9000/space/images/shape_icon03.png">
										</c:when>
										<c:when test="${vo.type == 'ㅁ자형' }">
											<img src="http://localhost:9000/space/images/shape_icon04.png">
										</c:when>
									</c:choose>
									<span>${vo.type }</span>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<label>편의시설</label>
						<div>
							<ul>
								<c:if test="${ovo.lounge == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon01.png">
										<span>공용 라운지</span>
									</li>
								</c:if>
								<c:if test="${ovo.smoking_room == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon02.png">
										<span>흡연실</span>
									</li>
								</c:if>
								<c:if test="${ovo.parking_lot == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon03.png">
										<span>주차장</span>
									</li>
								</c:if>
								<c:if test="${ovo.elevator == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon04.png">
										<span>승강기</span>
									</li>
								</c:if>
								<c:if test="${ovo.freight_elevator == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon05.png">
										<span>화물승강기</span>
									</li>
								</c:if>
								<c:if test="${ovo.vending_machine == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon06.png">
										<span>자판기</span>
									</li>
								</c:if>
								<c:if test="${ovo.wifi == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon07.png">
										<span>WI-FI</span>
									</li>
								</c:if>
								<c:if test="${ovo.accessible_toilet == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon08.png">
										<span>장애인 화장실</span>
									</li>
								</c:if>
								<c:if test="${ovo.toilet == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon09.png">
										<span>화장실</span>
									</li>
								</c:if>
								<c:if test="${ovo.water_dispenser == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon10.png">
										<span>정수기</span>
									</li>
								</c:if>
								<c:if test="${ovo.ktx == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon26.png">
										<span>KTX, SRT 인근</span>
									</li>
								</c:if>
								<c:if test="${ovo.beam == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon11.png">
										<span>빔프로젝터</span>
									</li>
								</c:if>
								<c:if test="${ovo.video_device == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon24.png">
										<span>화상회의장비</span>
									</li>
								</c:if>
								<c:if test="${ovo.mic == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon14.png">
										<span>마이크</span>
									</li>
								</c:if>
								<c:if test="${ovo.lectern == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon19.png">
										<span>강연대</span>
									</li>
								</c:if>
								<c:if test="${ovo.tv == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon12.png">
										<span>TV</span>
									</li>
								</c:if>
								<c:if test="${ovo.speaker == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon13.png">
										<span>스피커</span>
									</li>
								</c:if>
								<c:if test="${ovo.pc == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon15.png">
										<span>PC/노트북</span>
									</li>
								</c:if>
								<c:if test="${ovo.pointer == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon16.png">
										<span>포인터</span>
									</li>
								</c:if>
								<c:if test="${ovo.banner == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon17.png">
										<span>현수막</span>
									</li>
								</c:if>
								<c:if test="${ovo.whiteboard == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon18.png">
										<span>화이트보드</span>
									</li>
								</c:if>
								<c:if test="${ovo.dais == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon20.png">
										<span>단상</span>
									</li>
								</c:if>
								<c:if test="${ovo.conference_call == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon21.png">
										<span>컨퍼런스콜</span>
									</li>
								</c:if>
								<c:if test="${ovo.air_conditional == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon22.png">
										<span>에어컨</span>
									</li>
								</c:if>
								<c:if test="${ovo.heater == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon23.png">
										<span>난방기</span>
									</li>
								</c:if>
								<c:if test="${ovo.internet == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon25.png">
										<span>유선인터넷</span>
									</li>
								</c:if>
								<c:if test="${ovo.studio == 1}">
									<li>
										<img src="http://localhost:9000/space/images/convenience_icon27.png">
										<span>영상스튜디오</span>
									</li>
								</c:if>
							</ul>
						</div>
					</li>
					<li>
						<label>식음료</label>
						<div>
							<ul>
								<c:choose>
									<c:when test="${ovo.snack_carry == 1}">
										<li>
											<img src="http://localhost:9000/space/images/fab_icon01.png">
											<span>다과류 반입가능</span>
										</li>
									</c:when>
									<c:when test="${ovo.snack_sale == 1}">
										<li>
											<img src="http://localhost:9000/space/images/fab_icon02.png">
											<span>다과류 별도판매</span>
										</li>
									</c:when>
									<c:when test="${ovo.meal_carry == 1}">
										<li>
											<img src="http://localhost:9000/space/images/fab_icon01.png">
											<span>식사류 반입가능</span>
										</li>
									</c:when>
									<c:when test="${ovo.meal_sale == 1}">
										<li>
											<img src="http://localhost:9000/space/images/fab_icon02.png">
											<span>식사류 별도판매</span>
										</li>
									</c:when>
								</c:choose>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
			
		<!-- 회의실 안내 -->
		<div class="room_inform" id="room_inform">
			<div class="label"><div class="l_line"></div><label>회의실 안내</label></div>
			<div>
				<img src="http://localhost:9000/space/images/${vo.rfile1 }.jpg" width="250px" height="220px">
				<div class="large_img">
					<img src="http://localhost:9000/space/images/thum_more_icon.png">
					<div>
						<img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box02_content_box_list_slide_box_close_btn.png">
						<img src="http://localhost:9000/space/images/carousel1.jpg">
					</div>
				</div>
				<div>
					<div>
						<label>${vo.room_name }</label>
						<input type="button" value="선택" class="select_btn">
					</div> 
					<span>${vo.charge } / 시간</span>
					<ul>
						<li>
							<label>최저 이용시간</label>
							<span>1시간</span>
						</li>
						<li>
							<label>수용형태</label>
							<span>${vo.type } ${vo.capacity }명</span>
						</li>
						<li>
							<label>부가서비스</label>
							<div>
								<span>
									<c:if test="${ovo.lounge == 1}">
											공용 라운지, 
									</c:if>
									<c:if test="${ovo.smoking_room == 1}">
											흡연실, 
									</c:if>
									<c:if test="${ovo.parking_lot == 1}">
											주차장, 
									</c:if>
									<c:if test="${ovo.elevator == 1}">
											승강기, 
									</c:if>
									<c:if test="${ovo.freight_elevator == 1}">
											화물승강기, 
									</c:if>
									<c:if test="${ovo.vending_machine == 1}">
											자판기, 
									</c:if>
									<c:if test="${ovo.wifi == 1}">
											WI-FI, 
									</c:if>
									<c:if test="${ovo.accessible_toilet == 1}">
											장애인 화장실, 
									</c:if>
									<c:if test="${ovo.toilet == 1}">
											화장실, 
									</c:if>
									<c:if test="${ovo.water_dispenser == 1}">
											정수기, 
									</c:if>
									<c:if test="${ovo.ktx == 1}">
											KTX/SRT 인근, 
									</c:if>
									<c:if test="${ovo.beam == 1}">
											빔프로젝터, 
									</c:if>
									<c:if test="${ovo.video_device == 1}">
											화상회의장비, 
									</c:if>
									<c:if test="${ovo.mic == 1}">
											마이크, 
									</c:if>
									<c:if test="${ovo.lectern == 1}">
											강연대, 
									</c:if>
									<c:if test="${ovo.tv == 1}">
											TV, 
									</c:if>
									<c:if test="${ovo.speaker == 1}">
											스피커, 
									</c:if>
									<c:if test="${ovo.pc == 1}">
											PC/노트북, 
									</c:if>
									<c:if test="${ovo.pointer == 1}">
											포인터, 
									</c:if>
									<c:if test="${ovo.banner == 1}">
											현수막, 
									</c:if>
									<c:if test="${ovo.whiteboard == 1}">
											화이트보드, 
									</c:if>
									<c:if test="${ovo.dais == 1}">
											단상, 
									</c:if>
									<c:if test="${ovo.conference_call == 1}">
											컨퍼런스콜, 
									</c:if>
									<c:if test="${ovo.air_conditional == 1}">
											에어컨, 
									</c:if>
									<c:if test="${ovo.heater == 1}">
											난방기, 
									</c:if>
									<c:if test="${ovo.internet == 1}">
											유선인터넷, 
									</c:if>
									<c:if test="${ovo.studio == 1}">
											영상스튜디오, 
									</c:if>					
								</span>
							</div>
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
					<span>총 평점 
						<span>
							4.7
						</span>
					</span>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
				  		<img src="http://localhost:9000/space/images/cont_list_detail_info03.png"><span>240인실</span>
			  		</div>
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
		<%-- <c:if test="${}"> --%>
			<div class="r_button">
				<a href="http://localhost:9000/space/room_list.do"><input type="button" value="목록으로" id="btn_golist"></a>
				<input type="submit" value="예약하기" id="btn_reserve">
			</div>
		<%-- </c:if> --%><%-- 
		<c:if test="${}">
			<div class="c_button">
				<a href="http://localhost:9000/space/corppage.do"><input type="button" value="목록으로" id="btn_golist"></a>
				<div><a href="http://localhost:9000/space/room_reserve.do"><input type="button" value="수정" id="btn_update"></a>
				<input type="button" value="삭제" id="btn_delete"></div>
			</div>
		</c:if> --%>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	

	
	
</script>
</html>