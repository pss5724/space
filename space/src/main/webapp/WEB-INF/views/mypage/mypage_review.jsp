<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.mypage_right_box_title p{ 
	margin-bottom:20px;
}
.review_search {
	float:left;
	width:50%;
	height:40px;
	margin-left:200px;
	border:3px solid lightgray;
	border-radius:7px;
}
.review_search_input {
	height:30px;
	border:none;
	width:50%;
	margin-left:110px;
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
						<a href="mypage.do">예약한 회의실</a>
					</li>
					<li>
						<a href="mypage_review.do">이용 후기</a>
					</li>
					<li>
						<a href="mypage_inquiry.do">1:1 문의</a>
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
					<p class="mypage_right_tit">이용 후기</p>
					
				</div>
				
				<br>
				<br>
				<br>
				<hr color="lightgray">
				<br>
		<form name="review_search" action="mypage_review_search_proc.do" method="get">
			<input type="hidden" name="id" value="${sessionScope.svo.id }">
			<div class="review_search"><input type="text" name="rsid" class="review_search_input" placeholder="예약번호를 입력해주세요" value=""><button type="submit" ><img src="http://localhost:9000/space/images/sub_header_search_btn.jpg" width="20" height="20"></button></div>
		</form>
			</div>
			<!-- right box end -->
			
		
	</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>