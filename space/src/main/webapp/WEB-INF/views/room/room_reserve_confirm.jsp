<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<span class="reservation_number">예약번호 001721</span>
				<span class="reservation_print">인쇄</span>
				<table>
					<tr>
						<th>예약 센터</th>
						<td>강남구 1호점</td>
						<th>예약 회의실</th>
						<td>37층 아폴론</td>
					</tr>
					<tr>
						<th>이용 일자</th>
						<td>2021.07.28</td>
						<th>이용 시간</th>
						<td>10시~12시 / 2시간</td>
					</tr>
					<tr>
						<th>수용 형태</th>
						<td>U자형</td>
						<th>이용 인원</th>
						<td>20명</td>
					</tr>
				</table>
				<p class="confirm_sub_title">부가서비스</p>
				<table>
					<tr>
						<th>편의사항</th>
						<td>라커룸 1개/종일 11,000원</td>
						<th>식음료</th>
						<td>케이터링 SET 132,000원</td>
					</tr>				
				</table>
			</div>
			<div class="confirm_item_box">
				<p class="confirm_title">예약자 정보</p>
				<table>
					<tr>
						<th>예약자</th>
						<td colspan="3">홍길동</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>hongkd1@naver.com</td>
						<th>연락처</th>
						<td>010-9876-4567</td>
					</tr>
					<tr>
						<th>행사명</th>
						<td>2분기 결산 회의</td>
						<th>회사명</th>
						<td>길동 컴퍼니</td>
					</tr>
					<tr>
						<th>기타 요청사항</th>
						<td colspan="3">테이블 1개 추가 요청</td>
					</tr>
				</table>
			</div>
			<div class="confirm_item_box">
				<p class="confirm_title">결제 정보</p>
				<table>
					<tr>
						<th>결제 금액</th>
						<td>215,000원</td>
						<th>결제 수단</th>
						<td>KAKAO PAY</td>
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
		</div>
	</div>
	<p class="print_area">㈜회의실닷컴</p>
	
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>