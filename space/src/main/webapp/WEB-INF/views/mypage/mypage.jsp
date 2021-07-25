<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/mypage.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
 
    /* 금액 콤마 표시하기 */
	function number_format(numstr) {
	   var numstr = String(numstr);
	   var re0 = /(\d+)(\d{3})($|\..*)/;
	   if (re0.test(numstr)) {
	      return numstr.replace(re0, function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; });
	   } else {
	      return numstr;
	   }
	}

    $(".price").each(function(){
    	var price = number_format($(this).text());
    	$(this).text(number_format(price)+"원");
    });
});
</script>
<style>
.mypage_left_box ul li:first-child a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
	
}

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
					<p class="mypage_right_tit">예약한 회의실</p>
					
					
				</div>
				<br>
				<br>
				<hr color="lightgray">
				<br>
				<!-- 여러개 반복 -->
				
				<c:forEach var="vo" items="${list}">
				<div class="bookings">
					<ul>
						<li><a href="room_content.do?rid=${vo.rid }">${vo.branch_name }/${vo.room_name } </a>	<a href="room_reserve_confirm.do?rsid=${vo.rsid }" class="mypage_cancel_btn">예약정보</a></li>
						</ul>
						<img src="http://localhost:9000/space/images/cal_btn_img01.png">
						<span>${vo.reserve_date }</span>
						<br>
						<img src="http://localhost:9000/space/images/mypage01_list_bottom_sect_icon02.png">

						<span class="time">
						<c:choose>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 0}">
									${fn:split(vo.checkin_time,'.')[0]}시~ 
								</c:when>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 5}">
									${fn:split(vo.checkin_time,'.')[0]}시 30분~ 
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 0}">
									${fn:split(vo.checkout_time,'.')[0]}시[${fn:split(vo.used_hours,'.')[0]}시간]
								</c:when>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 5}">
									${fn:split(vo.checkout_time,'.')[0]}시 30분[${fn:split(vo.used_hours,'.')[0]}시간]
								</c:when>
							</c:choose>
							</span> 
						<br> 
						<span class="price">${vo.amount }</span>
					
				</div>
				</c:forEach>
				
			
		
		
		
			</div>
			<!-- right box end -->
			
		</div>
	
	
	</div>
	
	<!-- footer -->   
<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>