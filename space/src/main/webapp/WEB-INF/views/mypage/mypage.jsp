<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/mypage.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<style>
.mypage_left_box ul li:first-child a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
}

</style>
</head>
<body> 

<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
 
	<!-- content -->
	<div class="mypage_container">
	
		<div class="mypage_content">
			<!-- left_box  -->
			<div class="mypage_left_box">
				<p class="mypage_ltitle">
					<img src="http://localhost:9000/space/images/little_logo.jpg"/>
					<span>나의 회의실</span>
				</p>
				<ul>
					<li>
						<a href="mypage.do?id=${sessionScope.svo.id }">예약한 회의실</a>
					</li>
					<li>
						<a href="mypage_review.do">이용 후기</a>
					</li>
					<li>
						<a href="mypage_inquiry.do?id=${sessionScope.svo.id }">1:1 문의</a>
					</li>
					<li>
						<a href="mypage_info.do">회원정보 수정</a>
					</li>
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">
					
				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">예약한 회의실</p>
					
					
				</div>
				<br>
				<br>
				<hr color="lightgray">
				<br>
				<!-- 여러개 반복 -->
				<div class="bookings">
					<ul>
						<li><a href="#">강남구 17호점/6B </a><a href="#" class="mypage_cancel_btn">예약정보</a></li>
						</ul>
						<img src="http://localhost:9000/space/images/cal_btn_img01.png">
						<span>2021.07.02</span>
						<br>
						<img src="http://localhost:9000/space/images/mypage01_list_bottom_sect_icon02.png">
						<span class="time">22시~24시[2시간]</span>
						<span class="price">132,000원</span>
						
						  
					
				</div>
				<div class="bookings"> 
					<ul>
						<li><a href="#">강남구 17호점/6B </a><button type="button" class="mypage_cancel_btn">예약취소</button></li>
						</ul>
						<img src="http://localhost:9000/space/images/cal_btn_img01.png">
						<span>2021.07.02</span>
						<br>
						<img src="http://localhost:9000/space/images/mypage01_list_bottom_sect_icon02.png">
						<span>22시~24시[2시간]</span>
						<span class="price">132,000원</span>
						
						  
					
				</div>
				<div class="bookings">
					<ul>
						<li><a href="#">강남구 17호점/6B </a><button type="button" class="mypage_cancel_btn">예약취소</button></li>
						</ul>
						<img src="http://localhost:9000/space/images/cal_btn_img01.png">
						<span>2021.07.02</span>
						<br>
						<img src="http://localhost:9000/space/images/mypage01_list_bottom_sect_icon02.png">
						<span>22시~24시[2시간]</span>
						<span class="price">132,000원</span>
						
						  
					
				</div>
		
		
		
			</div>
			<!-- right box end -->
			
		</div>
	
	
	</div>
	
	<!-- footer -->   
<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>