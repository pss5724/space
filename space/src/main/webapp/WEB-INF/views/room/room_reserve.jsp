<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://localhost:9000/space/css/datepicker.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<style>
.content {
	width: 800px;
	margin: 0 auto;
	padding-bottom: 100px;
}

.label {
	padding: 20px 0;
}
.l_line {
	width: 6px;
	height: 20px;
	border-radius: 3px;
	background: #97ccff;
	display: inline-block;
}
.l_line + label, .l_line+label+div+label {
	font-weight: bold;
	margin: 0 10px;
	font-size: 20px;
	color: #444444;
}
.l_line+label+div {
	display: inline-block;
	background: lightgray;
	width: 1px;
	height: 15px;
	vertical-align: middle;
}
.title {
	padding: 100px 0 30px;
}
.title h1 {
	text-align: center;
	padding: 38px;
	margin: 0;
	background-color: #f9f9f9;
}


/* 회의실 정보1 */
.name {
	padding: 15px 0;
	border-bottom: 1px solid lightgray;
}
#image {
	width: 100%;
	height: 300px;
	background: url("http://localhost:9000/space/images/carousel2.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	background-position: 45%;
	margin-top: 10px;
}
/* 이미지 크게 보기 */
.large_img {
	position: relative;
	bottom: 30px;
	right: 10px;
	text-align:right;
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
	left: 0px;
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

/* 회의실 정보2 */
.room_inform {
	padding: 15px 0;
	border-bottom: 1px solid lightgray;
	margin-bottom: 30px;
}
.room_inform>ul>li {
	padding: 10px 0;
}
.room_inform>ul>li>label {
	font-weight: bold;
	width: 120px;
	display: inline-block;
	vertical-align: top;
}
.room_inform>ul>li>div {
	display: inline-block;
	border-bottom: 1px solid lightgray;
	padding: 0 20px 20px 20px;
	margin-right: 15px;
	width: 660px;
}
.room_inform>ul>li>div>div {
	display: inline-block;
}
.room_inform>ul>li>div>ul>li,.room_inform>ul>li>div>div>ul>li {
	text-align: center;
	float: left;
	margin-right: 20px;
}
.room_inform>ul>li>div>ul>li>img, .room_inform>ul>li>div>div>ul>li>img {
	display: block;
	margin: 0 auto;
}
.room_inform>ul>li>div>ul>li>span,.room_inform>ul>li>div>div>ul>li>span {
	color: #888888;
	font-size: 12px;
}
.room_inform>ul>li>div>div>ul {
	display: table;
}
#limit {
	font-size: 12px;
	color: #f0013f;
}


/******* 예약정보 *******/
.res_inform {
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-bottom: 15px;
}
.inform_label {
	background: linear-gradient(to right, #5342e3 , #104ebc);
	padding: 15px 20px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
}
.inform_label>label {
	color: white;
	font-weight: bold;
	vertical-align: top;
	margin-left: 5px;
}
.res_inform>div:last-child {
	padding: 20px 10px 20px 20px;
}
.res_inform>div:last-child>ul>li {
	padding: 10px 0;
	width: 324px;
	display: inline-block;
	
}
.res_inform>div:last-child>ul>li>label {
	font-weight: bold;
	width: 90px;
}


/* 이용일자 */
#datepicker {
	border: none;
	border-bottom: 1px solid #bfbfbf;
	padding: 10px;
	margin-left: 10px;
	vertical-align: middle;
	width: 210px;
}

/* 데이트피커-이용일자 */
.ui-datepicker {
	background-color: white;
	width: 210px;
	padding: 10px;
	display: none;
}
.ui-state-default {
	color: #bfbfbf;
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
th.ui-datepicker-week-end:first-child {
	color: #d30000;
}
th {
	height: 20px;
	font-size: 12px;
}
td {
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
#time1 {
	border: none;
	border-bottom: 1px solid #bfbfbf;
	padding: 5px 10px;
	margin: 0 10px;
	vertical-align: middle;
	width: 90px;
	display: inline-block;
}
#time2 {
	border: none;
	border-bottom: 1px solid #bfbfbf;
	padding: 5px 10px;
	margin-left: 10px;
	vertical-align: middle;
	width: 90px;
	display: inline-block;
}
.ui-menu-item>a {
	font-size: 12px;
	padding: 5px 10px;
	text-align: left;
}
#people {
	width: 210px;
	right: 10px;
	bottom: 30px;
}
#selectbox {
	border: none;
	border-bottom: 1px solid #bfbfbf;
	padding: 5px 10px;
	margin: 0 10px;
	vertical-align: middle;
	width: 210px;
}
.res_inform>div:last-child>ul>li:nth-child(3) {
	height: 55px;
	margin-right: 115px;
}
.res_inform>div:last-child>ul>li:nth-child(1) {
	margin-right: 115px;
}

/* 부가서비스 */
.e_service {
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-bottom: 15px;
}
.e_service>div:last-child {
	padding: 10px 20px 0 20px;
}
.e_service>div:last-child>ul>li {
	border-bottom: 1px solid lightgray;
	padding: 10px 0;
}
.e_service>div:last-child>ul>li:last-child {
	border: none;
	padding: 10px 0 0 0;
}
.required {
	width: 5px;
	height: 5px;
	border-radius: 50%;
	background-color: #f80d54;
	display: inline-block;
	vertical-align: super;
	margin-right: 5px;
}
.required+label {
	font-weight: bold;
}
#s_content {
	padding: 10px 20px;
	display: inline-block;
}
#s_content>span {
	font-size: 14px;
}

.number-spinner {
	margin-top: 25px;
	float: right;
	width: 200px;
}


/* 예약자 정보 */
.p_inform {
	border: 1px solid lightgray;
	border-radius: 10px;
	margin-bottom: 15px;
}
.p_inform>div:nth-child(2), .p_inform>div:last-child>ul>li>label>span {
	color: #f80d54;
	font-size: 14px;
}
.p_inform>div:nth-child(2) {
	padding: 20px 20px 10px 20px;
	text-align: right;
}
.p_inform>div:last-child {
	padding: 0 20px 20px 20px;
}
.p_inform>div:last-child>ul>li {
	margin: 15px 0;
}
.p_inform>div:last-child>ul>li:first-child, .p_inform>div:last-child>ul>li:nth-child(2) {
	display: inline-block;
	margin: 0;
}
.p_inform>div:last-child>ul>li:nth-child(2) {
	float: right;
}
.p_inform>div:last-child>ul>li>label {
	width: 100px;
	display: inline-block;
}
#r_name {
	width: 200px;
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 3px;
}
#phone {
	width: 90px;
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 3px;
}
#email,#c_name,#event_name,#etc {
	width: 654px;
	padding: 10px;
	border: 1px solid lightgray;
	border-radius: 3px;
}

/* 주의사항 */
.caution>ul {
	padding: 10px 20px;
}
.caution>ul>li {
	padding-bottom: 20px;
}
.caution>ul>li>label{
	vertical-align: top;
	font-weight: bold;
	width: 170px;
	display: inline-block;
}
.caution>ul>li>label>img {
	margin-right: 5px;
}
.caution>ul>li>div {
	display: inline-block;
	width: 584px;
}

/* 예약하기 버튼 */
.r_button {
	text-align: center;
	padding-top: 20px;
}
#btn_reserve {
	padding: 20px;
	width: 200px;
	border: 1px solid #104ebc;
	background: #104ebc;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	font-size: 16px;
}
#btn_reset {
	padding: 20px;
	width: 200px;
	border: 1px solid #2d2d2e;
	background: #2d2d2e;
	color: white;
	font-weight: bold;
	border-radius: 5px;
	margin-left: 20px;
	font-size: 16px;
}


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
	<div class="content">
		
		<!-- 회의실 정보1 -->
		<div class="name">
			<div class="label"><div class="l_line"></div><label>강남구 7호점</label><div></div><label>30층 노스</label></div>
			<div id="image"></div>
			<div class="large_img">
				<img src="http://localhost:9000/space/images/thum_more_icon.png">
				<div>
					<img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box02_content_box_list_slide_box_close_btn.png">
					<img src="http://localhost:9000/space/images/carousel1.jpg">
				</div>
			</div>
		</div>
		
		<!-- 회의실 정보2 -->
		<div class="room_inform">
			<ul>
				<li>
					<label>면적㎡</label>
					<span>13㎡</span>
				</li>
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
				<li>
					<label>세부사항</label>
					<span>TV 72인치, 화이트보드 가능, 컨퍼런스콜 Polycom 가능, 에어컨 가능, 난방기 가능, 유선인터넷 가능</span>
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
		<div class="e_service">
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
						<input type="text" id="email">
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