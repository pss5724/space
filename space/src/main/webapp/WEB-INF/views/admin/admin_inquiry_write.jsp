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
<script>
$(document).ready(function(){
	
	$("#writeInquiry").click(function(){
		if($(".input_content").val() == ""){
			alert("내용을 입력해주세요");
			$(".input_content").focus();
			return false;
		}else{
			inquiry_write.submit();
		}
		
	});
	
		
		
});
</script>
<style>
.mypage_left_box ul li:last-child a{
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
						<a href="admin_booked.do">예약 내역</a>
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
					<p class="mypage_right_tit">1:1 문의</p>
					
				</div>
				
		
			
		<form id="inquiry_write" action="admin_inquiry_write_proc.do" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="qid" value="${qid }">
		<table class="inquiry_write_table">
	
			<tr>
				<th>내용</th>
				<td>
					<input type="text" name="acontent" class="input_content" title="내용작성">
				</td>
			</tr>
			
		</table>

	<div class="mypage_write_btn">
		<button type="button" id="writeInquiry" class="blue" >답변하기</button>
		<a href="admin_inquiry.do">취소</a>
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