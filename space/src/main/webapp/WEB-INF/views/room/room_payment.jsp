<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		var url = "http://localhost:9000/space/room_payment_proc.do?rsid=<c:out value='${rsvo.rsid}' />";
		window.open(url, '', 'width=600, height=700');
	});

	/* 숫자를 시간으로 변환 */
	var checkin_time = "<c:out value='${rsvo.checkin_time}' />";
	var checkout_time = "<c:out value='${rsvo.checkout_time}' />";
	var time_list = {checkin_time, checkout_time};
	var time = "";
	
	for(var i in time_list) {
		var list = time_list[i].split(".");

		if(list[0]<10) {
			time += "0";
		}
		
		if(list[1]==0) {
			time += list[0] + ":" + "00"; 
		} else {
			time += list[0] + ":" + "30";
		}
		
		if(time_list[i] == checkin_time) time += " ~ ";
	} 
	
	time += " / " + <c:out value='${rsvo.used_hours}' /> + "시간";
	$("#time").text(time);
	
	
	/* 금액 콤마 표시하기 */
	function number_format(numstr) {
		var numstr = String(numstr);
		var re0 = /(\d+)(\d{3})($|\..*)/;
		if (re0.test(numstr)) {
			return numstr.replace(re0, function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; });
		} else {
			return numstr;
		}
	}
	
	var total_charge = "<c:out value='${rvo.charge}' />" * "<c:out value='${rsvo.used_hours}' />";
	$("#total_charge").text(number_format(total_charge)+"원");
	
	$("#charge").text(number_format(<c:out value='${rvo.charge}' />)+"원 / 시간");
	
	$(".item_price").each(function() {
		var price = number_format($(this).text());
		$(this).text(number_format(price)+"원");
	});
	
	$(".payment_item_price.total").text(number_format(<c:out value='${rsvo.amount}' />)+"원");

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
				<p>${rvo.branch_name} - ${rvo.room_name}</p>
				<p id="charge"></p>
			</div>
			<div class="payment_info">
				<ul>
					<li>
						<span class="payment_item_title">이용 일자</span>
						<span class="payment_item_detail">${rsvo.reserve_date}</span>		
					</li>
					<li>
						<span class="payment_item_title">이용 시간</span>
						<span class="payment_item_detail" id="time"></span>				
					</li>
					<li>
						<span class="payment_item_title">이용 인원</span>
						<span class="payment_item_detail">${rsvo.headcount}명</span>		
					</li>
					<li>
						<span class="payment_item_title">수용 형태</span>
						<span class="payment_item_detail">${rvo.type}</span>		
					</li>
				</ul>
			</div>
			<div class="payment_info">
				<span class="payment_item_title">대관료</span>
				<span class="payment_item_price" id="total_charge"></span>
			</div>
			<div class="payment_info">
				<span class="payment_item_title">부가서비스</span>
				<ul class="payment_item_price">
					<c:if test="${svo.convenience1 != 'null'}">
						<li>
							<span>${svo.convenience1}/${rsvo.convenience1_num}개</span>
							<span class="item_price">${svo.convenience1_price * rsvo.convenience1_num}</span>
						</li>
					</c:if>
					<c:if test="${svo.convenience2 != 'null'}">
						<li>
							<span>${svo.convenience2}/${rsvo.convenience2_num}개</span>
							<span class="item_price">${svo.convenience2_price * rsvo.convenience2_num}</span>
						</li>
					</c:if>
					<c:if test="${svo.convenience3 != 'null'}">
						<li>
							<span>${svo.convenience3}/${rsvo.convenience3_num}개</span>
							<span class="item_price">${svo.convenience3_price * rsvo.convenience3_num}</span>
						</li>
					</c:if>
					<c:if test="${svo.beverage1 != 'null'}">
						<li>
							<span>${svo.beverage1}/${rsvo.beverage1_num}개</span>
							<span class="item_price">${svo.beverage1_price * rsvo.beverage1_num}</span>
						</li>
					</c:if>
					<c:if test="${svo.beverage2 != 'null'}">
						<li>
							<span>${svo.beverage2}/${rsvo.beverage2_num}개</span>
							<span class="item_price">${svo.beverage2_price * rsvo.beverage2_num}</span>
						</li>
					</c:if>
					<c:if test="${svo.beverage3 != 'null'}">
						<li>
							<span>${svo.beverage3}/${rsvo.beverage3_num}개</span>
							<span class="item_price">${svo.beverage3_price * rsvo.beverage3_num}원</span>
						</li>
					</c:if>
				</ul>
				
			</div>
			<div class="payment_info">
				<span class="payment_item_title total">결제 예상금액</span>
				<span class="payment_item_price total"></span>
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