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
.mypage_right_box_title p{
	margin-bottom:20px; 
}
.inquiry_write_table {
	margin-top:80px;
	margin-right:100px;
 width:90%;
 border-spacing:0;
 border-collapse:collapse;
}

 .inquiry_write_table tr{
 	
  	
   	font-size :14px;
 	font-weight:600; 
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
  .inquiry_write_table tr th{
  	padding-left:12px;
  	text-align:left;
  	width:150px;
   	background-color: rgb(248,248,248);
 	font-weight:600;   
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 } 
 .inquiry_write_table tr td{
  	padding-left:12px;
  	text-align:left;
 	font-weight:600;   
 	height:60px;
 }
 .input_subject {
	width:100%;
	height:45px;
	border-radius:6px;
	border: 1px solid lightgray; 
 }
 .input_content{
 	margin:4px 0;
 	width:100%;
 	height:250px;
 	border-radius:6px;
 	border: 1px solid lightgray;
 }
 .inquiry_category {
 	width :45%;
 	height:45px;
 	border-radius:6px;
	border: 1px solid lightgray; 
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
				
		
			
		<form id="inquiry_write" action="#" method="POST" enctype="multipart/form-data">

		<table class="inquiry_write_table">
	
			<tr>
				<th scope="row">문의유형</th>
				<td>
					<select class="inquiry_category" name="inquiry_category">
						
						<option value="choice" selected>선택</option>
						<option value="book">예약관련</option>
						<option value="cancel">취소관련</option>
						<option value="saved">적립금관련</option>
						<option value="visit">방문 답사관련</option>
						<option value="other">기타문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="subject" class="input_subject" title="제목작성" required>
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" class="input_content" title="내용작성"></textarea>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					<input name="file" type="file">
				</td>
			</tr>
			
		</table>

	<div class="mypage_write_btn">
		<a id="writeInquiry" class="blue" href="#">문의하기</a>
		<a href="https://www.kmeetingroom.com/me/inquiries">취소</a>
	</div>

	</form>

			</div>
			<!-- right box end -->
			
		
		</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>