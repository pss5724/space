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
.mypage_right_box_title a {
	float:right;
	font-size:15px;
	background-color : white;
	border:1px solid lightgray;
	border-radius:4px;
	padding : 4px 15px;
}


.my_room {
	border: 1px solid lightgray;
	border-radius: 7px;
	width: 400px;
	height: 110px;
	text-align: left;
	overflow: hidden;
	display: inline-block;
	margin: 0 5px 7px 0;
}
.my_room>img {
	height: 110px;
	width: 150px;
}
.my_room>div {
	display: inline-block;
	margin-left: 10px;
	vertical-align: top;
}
.my_room>div>p:first-child {
	font-size: 18px;
	font-weight: bold;
	padding: 8px 0 3px 0;
}
.my_room>div>p:nth-child(2) {
	font-size: 14px;
	font-weight: bold;
	color: #006be0;
	padding-bottom: 5px;
}
.my_room>div>div {
	width: 150px;
	display: flex;
	justify-content: space-between;
	padding-top: 15px;
}
.my_room>div>div>div{
	width: 1px;
	height: 16px;
	background: lightgray;
}
.my_room>div>div>span {
	font-size: 14px;
}
.my_room>div>div>span>img {
	margin-right: 2px;
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
						<a href="corppage.do">회의실 관리</a>
					</li>
					<li>
						<a href="corppage_booked.do">예약 내역</a>
					</li>
						<li>
						<a href="corppage_inquiry.do">1:1 문의</a>
					</li>
						<li>
						<a href="corppage_info.do">회원정보 수정</a>
					</li> 
					
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">
					
				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">회의실 관리</p>
					
					<a href="http://localhost:9000/space/corppage_insert.do">등록하기</a>
					
				</div>
				<br>
				<br>
				<hr color="lightgray">
				<br>
				
				<!-- 여러개 반복 -->
				<div class="my_room">
					<img src="http://localhost:9000/space/images/carousel1.jpg">
					<div>
						<p><a href="http://localhost:9000/space/room_content.do">종로구 1호점/컨퍼런스룸</a></p>
						<p>접근성 및 회의실 컨디션 최상</p>
						<div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info01.png">세종로</span><div></div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info03.png">54인실</span>
						</div>
					</div>
				</div>
				<div class="my_room">
					<img src="http://localhost:9000/space/images/carousel1.jpg">
					<div>
						<p><a href="http://localhost:9000/space/room_content.do">종로구 1호점/컨퍼런스룸</a></p>
						<p>접근성 및 회의실 컨디션 최상</p>
						<div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info01.png">세종로</span><div></div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info03.png">54인실</span>
						</div>
					</div>
				</div>
				<div class="my_room">
					<img src="http://localhost:9000/space/images/carousel1.jpg">
					<div>
						<p><a href="http://localhost:9000/space/room_content.do">종로구 1호점/컨퍼런스룸</a></p>
						<p>접근성 및 회의실 컨디션 최상</p>
						<div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info01.png">세종로</span><div></div>
							<span><img src="http://localhost:9000/space/images/cont_list_detail_info03.png">54인실</span>
						</div>
					</div>
				</div>
				
			</div>
			<!-- right box end -->
			
		</div>
	
	
	</div>
	
	<!-- footer -->   
<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>