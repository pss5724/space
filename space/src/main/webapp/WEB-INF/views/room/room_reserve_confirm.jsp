<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/room.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$(".reservation_print").click(function() {
		window.print();
	});
    
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

    $(".item_price").each(function(){
    	var price = number_format($(this).text());
    	$(this).text(number_format(price)+"원");
    });
   	console.log('999',$(".item_price").text());
    
   	$(".cancel_reservation.btn").click(function(){
		var con = confirm("예약을 취소하시겠습니까?");
		if(con) {
		        $(location).attr('href', 'http://localhost:9000/space/reservation_cancel_proc.do?rsid=${vo.rsid}');
		}
   	});
});
</script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- container -->
	<div class="container">
		<h1 class="no_print">예약확인</h1>
		<p class="print_area title">예 약 확 인 서</p>
		<div class="confirm_wrap">
			<div class="confirm_item_box">
				<span class="confirm_title">회의실 예약 내용</span>
				<span class="reservation_number">예약번호 ${vo.rsid }</span>
				<span class="reservation_print">인쇄</span>
				<table>
					<tr>
						<th>예약 센터</th>
						<td>${vo.branch_name }</td>
						<th>예약 회의실</th>
						<td>${vo.room_name }</td>
					</tr>
					<tr>
						<th>이용 일자</th>
						<td>${vo.reserve_date }</td>
						<th>이용 시간</th>
						<td>
							<c:choose>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 0}">
									${fn:split(vo.checkin_time,'.')[0]}시~ 
								</c:when>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 5}">
									${fn:split(vo.checkin_time,'.')[0]}시 30분~ 
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 0}">
									${fn:split(vo.checkout_time,'.')[0]}시 / ${fn:split(vo.used_hours,'.')[0]}시간
								</c:when>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 5}">
									${fn:split(vo.checkout_time,'.')[0]}시 30분 / ${fn:split(vo.used_hours,'.')[0]}시간
								</c:when>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>수용 형태</th>
						<td>${vo.type }</td>
						<th>이용 인원</th>
						<td>${vo.headcount }명</td>
					</tr>
				</table>
				<p class="confirm_sub_title">부가서비스</p>
				<table>
					<tr>
						<th>편의사항</th>
						<c:choose>
						<c:when test="${vo.convenience1_num != 0 && vo.convenience2_num == 0 && vo.convenience3_num == 0}">
						<td>${svo.convenience1 } <span class="item_price">${(vo.convenience1_num)*(svo.convenience1_price)}</span></td>
						</c:when>
						<c:when test="${vo.convenience1_num == 0 && vo.convenience2_num != 0 && vo.convenience3_num == 0}">
						<td>${svo.convenience2 } <span class="item_price">${(vo.convenience2_num)*(svo.convenience2_price)}</span></td>
						</c:when>
						<c:when test="${vo.convenience1_num == 0 && vo.convenience2_num == 0 && vo.convenience3_num != 0}">
						<td>${svo.convenience3 } <span class="item_price">${(vo.convenience3_num)*(svo.convenience3_price)}</span></td>
						</c:when>
						<c:when test="${vo.convenience1_num != 0 && vo.convenience2_num != 0 && vo.convenience3_num == 0}">
						<td>
							${svo.convenience1 } <span class="item_price">${(vo.convenience1_num)*(svo.convenience1_price)}</span><br>
							${svo.convenience2 } <span class="item_price">${(vo.convenience2_num)*(svo.convenience2_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.convenience1_num != 0 && vo.convenience2_num == 0 && vo.convenience3_num != 0}">
						<td>
							${svo.convenience1 } <span class="item_price">${(vo.convenience1_num)*(svo.convenience1_price)}</span><br>
							${svo.convenience3 } <span class="item_price">${(vo.convenience3_num)*(svo.convenience3_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.convenience1_num == 0 && vo.convenience2_num != 0 && vo.convenience3_num != 0}">
						<td>
							${svo.convenience2 } <span class="item_price">${(vo.convenience2_num)*(svo.convenience2_price)}</span><br>
							${svo.convenience3 } <span class="item_price">${(vo.convenience3_num)*(svo.convenience3_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.convenience1_num != 0 && vo.convenience2_num != 0 && vo.convenience3_num != 0}">
						<td>
							${svo.convenience1 } <span class="item_price">${(vo.convenience1_num)*(svo.convenience1_price)}</span><br>
							${svo.convenience2 } <span class="item_price">${(vo.convenience2_num)*(svo.convenience2_price)}</span><br>
							${svo.convenience3 } <span class="item_price">${(vo.convenience3_num)*(svo.convenience3_price)}</span>
						</td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
						</c:choose>
						
						<th>식음료</th>
						<c:choose>
						<c:when test="${vo.beverage1_num != 0 && vo.beverage2_num == 0 && vo.beverage3_num == 0}">
						<td>${svo.beverage1 } <span class="item_price">${(vo.beverage1_num)*(svo.beverage1_price)}</span></td>
						</c:when>
						<c:when test="${vo.beverage1_num == 0 && vo.beverage2_num != 0 && vo.beverage3_num == 0}">
						<td>${svo.beverage2 } <span class="item_price">${(vo.beverage2_num)*(svo.beverage2_price)}</span></td>
						</c:when>
						<c:when test="${vo.beverage1_num == 0 && vo.beverage2_num == 0 && vo.beverage3_num != 0}">
						<td>${svo.beverage3 } <span class="item_price">${(vo.beverage3_num)*(svo.beverage3_price)}</span></td>
						</c:when>
						<c:when test="${vo.beverage1_num != 0 && vo.beverage2_num != 0 && vo.beverage3_num == 0}">
						<td>
							${svo.beverage1 } <span class="item_price">${(vo.beverage1_num)*(svo.beverage1_price)}</span><br><br>
							${svo.beverage2 } <span class="item_price">${(vo.beverage2_num)*(svo.beverage2_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.beverage1_num != 0 && vo.beverage2_num == 0 && vo.beverage3_num != 0}">
						<td>
							${svo.beverage1 } <span class="item_price">${(vo.beverage1_num)*(svo.beverage1_price)}</span><br><br>
							${svo.beverage3 } <span class="item_price">${(vo.beverage3_num)*(svo.beverage3_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.beverage1_num == 0 && vo.beverage2_num != 0 && vo.beverage3_num != 0}">
						<td>
							${svo.beverage2 } <span class="item_price">${(vo.beverage2_num)*(svo.beverage2_price)}</span><br><br>
							${svo.beverage3 } <span class="item_price">${(vo.beverage3_num)*(svo.beverage3_price)}</span>
						</td>
						</c:when>
						<c:when test="${vo.beverage1_num != 0 && vo.beverage2_num != 0 && vo.beverage3_num != 0}">
						<td>
							${svo.beverage1 } <span class="item_price">${(vo.beverage1_num)*(svo.beverage1_price)}</span><br><br>
							${svo.beverage2 } <span class="item_price">${(vo.beverage2_num)*(svo.beverage2_price)}</span><br><br>
							${svo.beverage3 } <span class="item_price">${(vo.beverage3_num)*(svo.beverage3_price)}</span>
						</td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>
						</c:choose>
					</tr>				
				</table>
			</div>
			<div class="confirm_item_box">
				<p class="confirm_title">예약자 정보</p>
				<table>
					<tr>
						<th>예약자</th>
						<td colspan="3">${vo.name }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${vo.email }</td>
						<th>연락처</th>
						<td>${vo.hp }</td>
					</tr>
					<tr>
						<th>행사명</th>
						<td>${vo.event_name }</td>
						<th>회사명</th>
						<td>${vo.corp_name }</td>
					</tr>
					<tr>
						<th>기타 요청사항</th>
						<td colspan="3">${vo.etc_request }</td>
					</tr>
				</table>
			</div>
			<div class="confirm_item_box">
				<p class="confirm_title">결제 정보</p>
				<table>
					<tr>
						<th>결제 금액</th>
						<td class="item_price">${vo.amount }</td>
						<th>결제 수단</th>
						<c:choose>
						<c:when test="${vo.pay_type == '온라인' }">
						<td>KAKAO PAY</td>
						</c:when>
						<c:otherwise>
						<td>현장결제</td>
						</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</div>
			<div class="confirm_item_box caution">
				<p class="confirm_title">예약 시 주의사항</p>
				<ul>
					<li> 
						<div class="caution_sub_title">주의사항</div>
						<div class="caution_content">
							실내 흡연 금지<br>
							사전 승인되지 않은 음식물 반입 금지 (간단 다과 반입 시 수거 필수)<br>
							각종 노트북 젠더 미제공<br>
							1F 인포메이션 게이트에서 일일카드 발급<br>
							(신분증/명함 맡겨야함, 담당자가 행사 일주일 전까지 참석자 사전 전달 시 신분증 제출 필요 없음)
						</div>
					</li>
					<li>
						<div class="caution_sub_title">예약정책</div>
						<div class="caution_content">
							계약금 없음, 카드사본 대체<br>
							결제수단 : 계좌이체(세금계산서발행), 방문 카드결제<br>
							(취소위약금 : 예약시 고객이 첨부한 카드사본으로 위약금 결제 진행)
						</div>
					</li>
					<li>
						<div class="caution_sub_title">취소/환불 정책</div>
						<div class="caution_content">
							아래 취소 가능 기간은 평일 9~18시 기준입니다. *주말/공휴일 미포함*<br>
							사용 48시간전~사용 24시간전 : 총 합계 금액의 50% 부과<br>
							사용 24시간전~행사 당일 : 총 합계 금액의 100% 부과
						</div>
					</li>
				</ul>
			</div>
			<div class="cancel_reservation no_print"><input type="button" value="예약취소" class="cancel_reservation btn"></div>
		</div>
	</div>
	<p class="print_area">㈜스페이스닷컴</p>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>