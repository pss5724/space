<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/room.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	
	$(".btn_print").click(function() {
		window.print();
	});

	$(".btn_payment").click(function() {
		window.open('http://localhost:9000/space/room_payment_proc.do', '', 'width=600, height=700');
	});

});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="container payment">
		<h1 class="no_print">결제하기</h1>
		<p class="print_area title">견 적 서</p>
		<div class="payment_wrap">
			<p class="payment_title no_print">결제 안내</p>
			<div class="payment_info item">
				<p>종로구 1호점 - 컨퍼런스룸 A</p>
				<p>38,500원 / 시간</p>
			</div>
			<div class="payment_info">
				<ul>
					<li>
						<span class="payment_item_title">이용 일자</span>
						<span class="payment_item_detail">2021.07.07(수)</span>		
					</li>
					<li>
						<span class="payment_item_title">이용 시간</span>
						<span class="payment_item_detail">18:00 ~ 20:30</span>				
					</li>
					<li>
						<span class="payment_item_title">이용 인원</span>
						<span class="payment_item_detail">25명</span>		
					</li>
					<li>
						<span class="payment_item_title">수용 형태</span>
						<span class="payment_item_detail">U자형</span>		
					</li>
				</ul>
			</div>
			<div class="payment_info">
				<span class="payment_item_title">대관료</span>
				<span class="payment_item_price">38,500원</span>
			</div>
			<div class="payment_info">
				<span class="payment_item_title">부가서비스</span>
				<ul class="payment_item_price">
					<li>
						<span>라커룸 1개/종일 1개</span>
						<span class="item_price">11,000원</span>
					</li>
					<li>
						<span>음료/잔 1개</span>
						<span class="item_price">7,700원</span>
					</li>
				</ul>
				
			</div>
			<div class="payment_info">
				<span class="payment_item_title total">결제 예상금액</span>
				<span class="payment_item_price total">38,500원</span>
			</div>
			<div class="payment_btns_wrap no_print">
				<button class="btn_payment">결제</button>
				<button class="btn_print">견적서 출력</button>
			</div>
		</div>
	</div>
	<p class="print_area">㈜회의실닷컴</p>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>