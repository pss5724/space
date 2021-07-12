<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/datepicker.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/room_bootstrap.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/room_reserve.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>

</style>
<script>
$(document).ready(function() {
	
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
	
	$("#time1").timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '09:00',
        maxTime: '22:00',
        startTime: '09:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
	$("#time2").timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '09:00',
        maxTime: '22:00',
        startTime: '09:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
	
	$(".number-spinner button").click(function(){   
		var btn = $(this),
			oldValue = btn.closest('.number-spinner').find('input').val().trim(),
			newVal = 0;
		
		if (btn.attr('data-dir') == 'up') {
			newVal = parseInt(oldValue) + 1;
		} else {
			if (oldValue > 1) {
				newVal = parseInt(oldValue) - 1;
			} else {
				newVal = 0;
			}
		}
		btn.closest('.number-spinner').find('input').val(newVal);
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
	
	<div class="title"><h1>예약하기</h1></div>
	<div class="room_reserve_content">
		
		<!-- 회의실 정보1 -->
		<div class="name">
			<div class="label"><div class="l_line"></div><label>강남구 7호점</label><div></div><label>30층 노스</label></div>
			<div id="image"></div>
			<div class="large_img">
				<img src="http://localhost:9000/space/images/thum_more_icon.png">
				<div>
					<img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box02_content_box_list_slide_box_close_btn.png">
					<img src="http://localhost:9000/space/images/carousel2.jpg">
				</div>
			</div>
		</div>
		
		<!-- 회의실 정보2 -->
		<div class="room_inform">
			<ul>
				<li>
					<label>최저 이용시간</label>
					<span>1시간</span>
				</li>
				<li>
					<label>수용형태</label>
					<div>
						<div>
							<ul>
								<li>
									<img src="http://localhost:9000/space/images/shape_icon03.png">
									<span>U자형 6명</span>
								</li>
								<li>
									<img src="http://localhost:9000/space/images/shape_icon04.png">
									<span>ㅁ자형 10명</span>
								</li>
							</ul>
							<span id="limit">*최대 수용 인원으로 초과시 대관이 제한됩니다.</span>
						</div>
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
						</ul>
					</div>
				</li>
				<li>
					<label>부가서비스</label>
					<div>
						<ul>
							<li>
								<img src="http://localhost:9000/space/images/convenience_icon12.png">
								<span>TV</span>
							</li>
							<li>
								<img src="http://localhost:9000/space/images/convenience_icon18.png">
								<span>화이드보드</span>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
		
		<!-- 예약정보 -->
		<div class="res_inform">
			<div class="inform_label">
				<img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
				<label>예약정보</label>
			</div>
			<div>
				<ul>
					<li>
						<label>이용일자</label>
						<input id="datepicker">
					</li>
					<li>
						<label>이용시간</label>
						<input type="text" id="time1" name="time1">~<input type="text" id="time2" name="time2">
					</li>
					<li>
						<label>이용인원</label>
						<div class="input-group number-spinner" id="people">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
					<li>
						<label>수용형태</label>
						<select id="selectbox">
							<option value="U자형">U자형</option>
							<option value="ㅁ자형">ㅁ자형</option>
						</select>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 부가서비스 -->
		<div class="a_service">
			<div class="inform_label">
				<img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
				<label>부가서비스</label>
			</div>
			<div>
				<ul>
					<li>
						<div class="s_label"><div class="required"></div><label>편의사항</label></div>
						<div id="s_content">
							<span>라커룸 1개/종일<br>11,000원/일<br>11,000원</span>
						</div>
						<div class="input-group number-spinner">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
					<li>
						<div id="s_content">
							<span>18시 이후 직원 stand by 비용<br>33,000원/시간(19시 이후 대관시 18~19시 stand by 비용)<br>33,000원</span>
						</div>
						<div class="input-group number-spinner">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
					<li>
						<div class="s_label"><div class="required"></div><label>식음료</label></div>
						<div id="s_content">
							<span>음료/잔<br>(coffee, tea, juices 선택)7,700원/잔<br>7,700원</span>
						</div>
						<div class="input-group number-spinner">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
					<li>
						<div id="s_content">
							<span>COFFEE 10인 set<br>33,000원/pot(1회 리필 포함)<br>33,000원</span>
						</div>
						<div class="input-group number-spinner">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
					<li>
						<div id="s_content">
							<span>케이터링 SET<br>(커피 1POT, 쿠키, 빵 임의구성 10인분) 132,000원<br>132,000원</span>
						</div>
						<div class="input-group number-spinner">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="dwn"><span class="glyphicon glyphicon-minus"></span></button>
							</span>
							<input type="text" class="form-control text-center" value="0">
							<span class="input-group-btn">
								<button class="btn btn-default" data-dir="up"><span class="glyphicon glyphicon-plus"></span></button>
							</span>
						</div>
					</li>
				</ul>
			</div>
		</div>
		
		<!-- 예약자 정보 -->
		<div class="p_inform">
			<div class="inform_label">
				<img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
				<label>예약자 정보</label>
			</div>
			<div><span>* 필수입력</span></div>
			<div>
				<ul>
					<li>
						<label>예약자<span>*</span></label>
						<input type="text" id="r_name">
					</li>
					<li>
						<label>연락처<span>*</span></label>
						<input type="text" id="phone"> - <input type="text" id="phone"> - <input type="text" id="phone">
					</li>
					<li>
						<label>이메일<span>*</span></label>
						<input type="text" id="email" disabled>
					</li>
					<li>
						<label>회사명<span>*</span></label>
						<input type="text" id="c_name">
					</li>
					<li>
						<label>행사명<span>*</span></label>
						<input type="text" id="event_name">
					</li>
					<li>
						<label>기타 요청사항</label>
						<input type="text" id="etc">
					</li>
					<li>
						<label>결제 방식<span>*</span></label>
						<input type="radio" id="online" name="pay_type" class="chk" value="온라인결제"><span>온라인결제</span>
						<input type="radio" id="onsite" name="pay_type" class="chk" value="현장결제"><span>현장결제</span>
					</li>
				</ul>
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
	
		<!-- 예약하기 버튼 -->
		<div class="r_button">
			<a href="room_payment.do"><input type="button" value="예약신청" id="btn_reserve"></a>
			<a href="room_list.do"><input type="reset" value="취소" id="btn_reset"></a>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>