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

	var now = new Date();
	
	
	
    var clist = "<c:out value='${revo.checkout_time}' />".split(".");
    var checkout_time = clist[0] + ":" ;
    
    if(clist[1]==0) {
       checkout_time += "00";
    } else {
       checkout_time += "30";
    }
    
    var rdate = new Date('${revo.reserve_date} '+checkout_time);
    
    $(".review_write_btn").click(function(){
    	if(now>rdate){
    		return true;
    	}else{
    		alert("회의실 사용 후 후기를 남겨주세요");
    		return false;
    	}
    	
    	
    	
    });
    
    $(".review_delete_btn").click(function(){
    	var choice = confirm("정말로 삭제 하시겠습니까?");
		if(choice){
			return true;
			
		}else{
			return false;
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
				
			
				
				<c:choose>
					<c:when test="${vo.rcontent eq null }">
						<table class="mypage_right_box_table">
						<tr>
							<th>${revo.branch_name } 의 ${revo.room_name } 이용후기를 남겨주세요</th>
						</tr>
						</table>
						
							
							<div class="mypage_btn">
							<button type="button" class="review_write_btn"><a href="mypage_review_write.do?id=${sessionScope.svo.id }&rsid=${revo.rsid }">후기 작성</a></button>
						</div>
					</c:when>
					<c:otherwise>
						<table class="mypage_right_box_table">
						<tr>
							<th>총 평점 : ${vo.totallv }점  <div class="table_th_after"></div></th>
							<th>${revo.branch_name }, ${revo.room_name }   ${vo.rdate }</th>
						</tr>
						<tr>
							<td colspan="2"><br><br><br>
					
							${vo.rcontent }
							<br><br><br><br>
					
							<br><br></td>
						</tr>
						
						</table>
						
							
							<div class="mypage_btn">
							<button type="button" class="review_write_btn"><a href="mypage_review_update.do?id=${sessionScope.svo.id }&rsid=${revo.rsid }">수정</a></button>
							<button type="button" class="review_delete_btn"><a href="mypage_review_delete_proc.do?id=${sessionScope.svo.id }&rsid=${vo.rsid }">삭제</a></button>
						</div>
					</c:otherwise>
				</c:choose>
				
			</div>
			<!-- right box end -->
			
		
	</div>
	
	</div>
	
	<!-- footer -->   
 <jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>