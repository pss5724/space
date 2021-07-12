<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="http://localhost:9000/space/css/slick.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:9000/space/css/slick-theme.css"/>
<link rel="stylesheet" href="http://localhost:9000/space/css/am-pagination.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	
	<div class="room_content">
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
					<span>서울 강남구 영동대로 517 30층, 37층</span></div>
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
						국내에 유일하게 VIP고객들을 위한 호텔, 승무원 출신 등의 비서진 컨시어지 서비스가 가능하고 주변 제휴업체를 통한 케이터릴 서비스, 최첨단 프레젠테이션 보유 및 다양한 회의 목적에 맞는 수입가구 완비, Conference call 기능이 내장된 전화기가 제공되어 국내외 기업과의 교류 형태의 행사진행, 교육, 세미나, 임원회의 등에 용의합니다.
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
			<a href="http://localhost:9000/space/room_list.do"><input type="button" value="목록으로" id="btn_golist"></a>
			<a href="http://localhost:9000/space/room_reserve.do"><input type="submit" value="예약하기" id="btn_reserve"></a>
		</div>
		<div class="c_button">
			<a href="http://localhost:9000/space/corppage.do"><input type="button" value="목록으로" id="btn_golist"></a>
			<div><a href="http://localhost:9000/space/corppage_update.do"><input type="button" value="수정" id="btn_update"></a>
			<input type="button" value="삭제" id="btn_delete"></div>
		</div>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
<script>
	

	
	
</script>
</html>