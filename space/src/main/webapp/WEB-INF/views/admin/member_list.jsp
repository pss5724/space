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
.mypage_right_box_booked_table{
	 margin-top:20px;
 width:100%;
 border-spacing:0;
 border-collapse:collapse;
}
  .mypage_right_box_booked_table tr{
 	font-size:14px; 
 	font-weight:520;   
 	text-align:center;
 	height:60px;
 	border-bottom:1px solid lightgray;
 }
   .mypage_right_box_booked_table tr button{
   	padding: 5px 10px;
   	background-color:white;
   	border:1px solid lightgray;
   	border-radius:5px;
   	color:red;
   }
 .mypage_right_box_booked_table tr:first-child{
 	background-color: rgb(251,251,251);
 	font-size:16px;
 	font-weight:700; 
 	text-align:center;
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
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
					<p class="mypage_right_tit">개인회원 관리</p>
					
					
				</div>
				<br>
				<br>
				<hr color="lightgray">
				<br>
			<table class="mypage_right_box_booked_table">
				<tr>
					<th>NO<div class="table_th_after"></div></th>
					<th>회원명<div class="table_th_after"></div></th>
					<th>이메일<div class="table_th_after"></div></th>
					<th>전화번호<div class="table_th_after"></div></th>
					<th>탈퇴승인</th>
				</tr>
				<!-- <tr>
					<td>1</td>
					<td>홍길동</td>
					<td>hong@naver.com</td>
					<td>010-1111-2222</td>
					<td><button type="button">승인</button></td>
				</tr> -->
				<c:forEach var="vo" items="${plist }">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="member_content.do?name=${vo.name}&rno=${vo.rno }">${vo.name }</a></td>
					<td>${vo.id }</td>
					<td>${vo.hp }</td>
					<c:choose>
					<c:when test="${vo.choiceout==0 }">
					<td><button type="button" disabled>-</button></td>
					</c:when>
					<c:otherwise>
					<td><a href="member_delete_proc.do?id=${vo.id}"><button type="button" >승인</button></td>
					</c:otherwise>
					</c:choose>
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