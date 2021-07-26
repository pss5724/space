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
	
	$("#pass_change_btn").click(function(){
		if($(".old_pass").val() ==""){
			alert("기존 비밀번호를 입력해주세요");
			$(".old_pass").focus();
			return false;
		}else if($(".new_pass").val() == ""){
			alert("변경할 비밀번호를 입력해주세요");
			$(".new_pass").focus();
			return false;
		}else if($(".new_pass_c").val() == ""){
			alert("비밀번호 확인을 입력해주세요");
			$(".new_pass_c").focus();
			return false;
		}else if($("input[name='old_pass_c']").val() != $(".old_pass").val()){
			alert("기존 비밀번호가 일치하지 않습니다.");
			$(".old_pass").val("").focus();
			return false;
		}
			else{
			pass_change.submit();
		}
		
	});
	
	$(".new_pass_c").blur(function(){
		if($(".new_pass").val() != "" && $(".new_pass_c").val() != ""){
			if($(".new_pass").val() == $(".new_pass_c").val()){
				$("#msg").text("패스워드가 동일합니다.").css({"color":"blue","fontSize":"13px"});
				return true
			}else{
				$("#msg").text("패스워드가 동일하지 않습니다.").css({"color":"red","fontSize":"13px"});
				$(".new_pass_c").val("");
				$(".new_pass").val("").focus();
				return false;
			}
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
 }
 .mypage_right_box_table_info tr:nth-child(3) a{
 	border:1px solid lightgray;
 	border-radius:6px;
 	padding : 10px 25px;
 	background-color : white;
 }
 #msg {
 	display:inline-block;
 	float:left;
 	margin-left:20px;
 }
 .new_pass_c {
 	display:inline-block;
 	float:left;
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
					<p class="mypage_right_tit">회원정보 수정</p>
					
				</div>
				
		
			<form name="pass_change" action="mypage_pass_change_proc.do" method="post">
			<input type="hidden" name="old_pass_c" value="${vo.pass }">
			<table class="mypage_right_box_table_info">
				<tr>
					<th>기존 비밀번호</th>
					<td><input type="password" name="old_pass" class="old_pass"></td>
				</tr>
				<tr>
					<th>변경 비밀번호</th>
					<td><input type="password" name="new_pass" class="new_pass"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="new_pass_c" class="new_pass_c"><div id="msg"></div></td>
				</tr>
			
				
				
			</table>
		<div class="mypage_btn">
			<button type="button" id="pass_change_btn">변경하기</button>
			<button type="button"><a href="mypage_info.do">돌아가기</a></button>
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