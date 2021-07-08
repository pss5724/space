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
.mypage_left_box ul li:nth-child(2) a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
}
.mypage_right_box_title a {
	float:right;
	font-size:15px;
	background-color : white;
	border:1px solid lightgray;
	border-radius:4px;
	padding : 4px 15px;
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
					<span>관리 메뉴</span>
				</p>
				<ul>
					<li>
						<a href="member_list.do">개인회원 관리</a>
					</li>
					<li>
						<a href="corp_list.do">기업회원 관리</a>
					</li>
						<li>
						<a href="admin_booked.do">예약된 회의실</a>
					</li>
						<li>
						<a href="admin_inquiry.do">문의 답변</a>
					</li>
					
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">
					
				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">기업회원 관리</p>
					
					
				</div>
				<br>
				<br>
				<hr color="lightgray">
				<br>
				<!-- 여러개 반복 --> 
				
		
		
			</div>
			<!-- right box end -->
			
		</div>
	
	
	</div>
	
	<!-- footer -->   
<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>