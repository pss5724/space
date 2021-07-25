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
<script>
$(document).ready(function(){

	
    
   
  
	
	
	$(".totallv").text((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4+'점');
	$("input[name='totallv']").val((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4);
	
	$(".locationlv").change(function(){
		$(".totallv").text((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4+'점');
		$("input[name='totallv']").val((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4);
	});
	
	$(".facilitylv").change(function(){
		$(".totallv").text((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4+'점');
		$("input[name='totallv']").val((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4);
	});
	
	$(".pricelv").change(function(){
		$(".totallv").text((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4+'점');
		$("input[name='totallv']").val((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4);
	});
	$(".servicelv").change(function(){
		$(".totallv").text((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4+'점');
		$("input[name='totallv']").val((parseInt($(".locationlv").val())+parseInt($(".facilitylv").val())+parseInt($(".pricelv").val())+parseInt($(".servicelv").val()))/4);
	});
	
	
	
	
	$(".review_write_btn").click(function(){
		if($(".rcontent").val() == ""){
			alert("내용을 작성해주세요")
			$(".rcontent").focus();
			return false;
		}else {
			review_write.submit();
		}
	
		
		
	});
	
	
		
});
</script>
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
.mypage_right_box_table_review
  {
 margin-top:20px;
 width:100%;
 border-spacing:0;
 border-collapse:collapse;
 }
 .mypage_right_box_table_review tr:first-child,
 .mypage_right_box_table_review tr:nth-child(2){
 	font-size:16px;
 	font-weight:700; 
 	text-align:center;
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
  .mypage_right_box_table_review tr:last-child{
 	font-size:16px;
 	font-weight:700; 
 	text-align:center;
 	height:60px;
 	border-bottom:1px solid lightgray;
  }
   .mypage_right_box_table_review tr th{
 	background-color: rgb(251,251,251);
  }
  .rcontent{
  	width:90%;
  	height:60px;
  	border:1px solid lightgray;
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
				<form id="review_write" action="mypage_review_update_proc.do" method="get">
					<input type="hidden" value="" name="totallv" class="totallv">
					<input type="hidden" value="${vo.rid }" name="rid">
					<input type="hidden" value="${vo.rsid }" name="rsid">
					<input type="hidden" value="${sessionScope.svo.id }" name="id">
				<table class="mypage_right_box_table_review">
				
			
						<tr>
							<th rowspan="2">총 평점</th>
							<td rowspan="2"><div class="totallv"></div></td>
							<th>위치만족도</th>
							<td><select name="locationlv" class="locationlv">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5" selected>5점</option>
							</select></td>
							<th>시설만족도</th>
							<td><select name="facilitylv" class="facilitylv">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5" selected>5점</option>
							</select></td>
						</tr>
						<tr>
							<th>가격만족도</th>
							<td><select name="pricelv" class="pricelv">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5" selected>5점</option>
							</select></td>
							<th>서비스만족도</th>
							<td><select name="servicelv" class="servicelv">
								<option value="1">1점</option>
								<option value="2">2점</option>
								<option value="3">3점</option>
								<option value="4">4점</option>
								<option value="5" selected>5점</option>
							</select></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="5"><textarea name="rcontent" class="rcontent">${vo.rcontent }</textarea></td>
						</tr>
	
				</table>
		
			
			<div class="mypage_btn">
			<button type="button" class="review_write_btn">수정완료</button>
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