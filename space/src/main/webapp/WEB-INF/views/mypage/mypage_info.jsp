<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	 $(".member_out_btn").click(function(){
		alert("탈퇴 신청 완료");
		return true;
	
	}); 
	 
	 $(".member_notout_btn").click(function(){
			alert("탈퇴 철회");
			return true;
		
		}); 
	 
	
	var now = new Date();
	
	var date1 = new Date('2021-7-19 '+$("#check").val());
	



		
		
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

.mypage_right_box_table_info {
 margin-top:20px;
 width:100%;
 border-spacing:0;
 border-collapse:collapse;
 }
 .mypage_right_box_table_info tr{
 	
  	
   	font-size :14px;
 	font-weight:600; 
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
  .mypage_right_box_table_info tr th{
  	padding-left:12px;
  	text-align:left;
  	width:150px;
   	background-color: rgb(248,248,248);
 	font-weight:600;   
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 } .mypage_right_box_table_info tr td{
  	padding-left:12px;
  	text-align:left;
 	font-weight:600;   
 	height:60px;
 }
 .mypage_btn a{
 	font-size:14px;
 	font-weight:600;
 	color : rgb(190,192,200);
 }
 .mypage_right_box_table_info tr:nth-child(3) a{
 	border:1px solid lightgray;
 	border-radius:6px;
 	padding : 10px 25px;
 	background-color : white;
 }

</style>
</head>
<body>
<input type="hidden" value="17:30" id="check">
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
					<p class="mypage_right_tit">회원정보 수정</p>
					
				</div>
				
		
			
			<table class="mypage_right_box_table_info">
				<tr>
					<th>이름</th>
					<td>${vo.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${vo.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><a href="mypage_info_pass.do">변경하기</a></td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>${vo.hp }</td>
				</tr>
				
				
			</table>
		<div class="mypage_btn">
			<c:choose>
				<c:when test="${vo.choiceout==0 }">
				<a href="joinout_btn_proc.do" class="member_out_btn">회원탈퇴하기</a>
				</c:when>
				<c:otherwise>
				<a href="joinnotout_btn_proc.do" class="member_notout_btn">회원탈퇴 철회</a>
				</c:otherwise>
			</c:choose>
		</div>
			</div>
			<!-- right box end -->
			
		
	</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>