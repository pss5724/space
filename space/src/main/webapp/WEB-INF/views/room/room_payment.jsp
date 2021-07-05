<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<style>
.container {
	margin: 0;
	padding-top: 100px;
}
.payment_wrap {
	width: 700px;
	margin: auto;
    padding: 100px 20px;
	text-align: center;
}
.payment_title {
	width: 100%;
	padding: 15px 0;
	color: white;
	font-size: 24px;
	font-weight: bold;
	background: linear-gradient(to right, #5342e3 , #104ebc);
}
.payment_info + .payment_info {
	border-top: 1px solid darkgray;
}
.payment_info {
	padding: 30px 20px;
}
.payment_info p{
	padding: 5px 0;
	text-align: left;
}
.payment_info span {
	display: inline-block;
	padding: 5px;
	text-align: left;
	width: 100px;
	border: 1px solid red;
}

</style>
</head>
<body>

	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="container">
		<div class="payment_wrap">
			<p class="payment_title">결제 안내</p>
			<div class="payment_info">
				<p>종로구 1호점 - 37층 아폴론</p>
				<p>38,500원 / 시간</p>
			</div>
			<div class="payment_info">
				<ul>
					<li>
						<span>이용 일자</span>
						<span>2021.07.07(수)</span>		
					</li>
					<li>
						<span>이용 시간</span>
						<span>18:00 ~ 20:30</span>				
					</li>
					<li>
						<span>이용 인원</span>
						<span>2021.07.07(수)</span>		
					</li>
					<li>
						<span>수용 형태</span>
						<span>2021.07.07(수)</span>		
					</li>
				</ul>
			</div>
			<div class="payment_info">
				<span>대관료</span>
				<span>38,500원</span>
			</div>
			<div class="payment_info">
				<span>부가서비스</span>
				<ul class="service_list">
					<li>
						<span>라커룸 1개/종일 1개</span>
						<span>11,000원</span>
					</li>
					<li>
						<span>음료/잔 1개</span>
						<span>7,700원</span>
					</li>
				</ul>
				
			</div>
			<div class="payment_info">
				<span>결제 예상금액</span>
				<span>38,500원</span>
			</div>
			<div class="payment_btns">
				<button class="btn_payment">예약신청</button>
				<button class="btn_print">견적서 출력</button>
			</div>
		</div>
	
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>