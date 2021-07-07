<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/mypage.css">
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
					<p class="mypage_right_tit">1:1 문의</p>
					
				</div>
				
		
			
			<table class="mypage_right_box_table">
				<tr>
					<th>NO<div class="table_th_after"></div></th>
					<th>카테고리<div class="table_th_after"></div></th>
					<th>제목<div class="table_th_after"></div></th>
					<th>작성일<div class="table_th_after"></div></th>
					<th>답변상태</th>
				</tr>
				<tr>
					<td colspan="5">1:1 문의 내역이 없습니다.</td>
				</tr>
				
			</table>
		<div class="mypage_btn">
			<button type="button"><a href="mypage_inquiry_write.do">글쓰기</a></button>
		</div>
			</div>
			<!-- right box end -->
			
		
	</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>