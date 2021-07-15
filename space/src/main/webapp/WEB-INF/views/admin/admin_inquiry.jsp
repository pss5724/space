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
.mypage_left_box ul li:last-child a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
}
.mypage_right_box_atable{
	 margin-top:20px;
 width:100%;
 border-spacing:0;
 border-collapse:collapse;
}
  .mypage_right_box_atable tr{
 	font-size:14px; 
 	font-weight:520;   
 	text-align:center;
 	height:60px;
 	border-bottom:1px solid lightgray;
 }
   .mypage_right_box_atable tr button{
   	padding: 5px 10px;
   	background-color:white;
   	border:1px solid lightgray;
   	border-radius:5px;
   	color:red;
   }
 .mypage_right_box_atable tr:first-child{
 	background-color: rgb(251,251,251);
 	font-size:16px;
 	font-weight:700; 
 	text-align:center;
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
.mypage_right_box_title p{
	margin-bottom:20px;
}
  .mypage_right_box_atable tr th:first-child{
 	width:8%;
 }
   .mypage_right_box_atable tr th:nth-child(2){
 	width:10%;
 }
   .mypage_right_box_atable tr th:nth-child(3){
 	width:17%;
 }
   .mypage_right_box_atable tr th:nth-child(4){
 	width:40%;
 }
    .mypage_right_box_atable tr th:nth-child(5){
 	width:15%;
 }
    .mypage_right_box_atable tr th:last-child{
 	width:10%;
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
				
		
			
			<table class="mypage_right_box_atable">
				<tr>
					<th>NO<div class="table_th_after"></div></th>
					<th>작성자<div class="table_th_after"></div></th>
					<th>카테고리<div class="table_th_after"></div></th>
					<th>제목<div class="table_th_after"></div></th>
					<th>작성일<div class="table_th_after"></div></th>
					<th>답변상태</th>
				</tr>
				<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rno }</td>
					<td>${vo.id }</td>
					<td>${vo.qtype } </td>
					<td><a href="admin_inquiry_content.do?qid=${vo.qid }">${vo.qtitle } </a></td>
					<td>${vo.qdate } </td>
					<td>${vo.qstate} </td>
				</tr>
				</c:forEach>
				
			</table>
	
			</div>
			<!-- right box end -->
			
		
	</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>