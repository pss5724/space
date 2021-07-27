<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 - 회원가입 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/join.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#doResgister").click(function(){
		
		if($("#name").val()==""){
			alert("성함을 입력해주세요");
			$("#name").focus();
			return false;
		}else if($("#id").val()==""){
			alert("이메일을 선택해주세요");
			$("#id").focus();
			return false;
		}else if($("#pass").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pass").focus();
			return false;
		}else if($("#cpass").val()==""){
			alert("비밀번호 확인을 입력해주세요");
			$("#cpass").focus();
			return false;
		}else if($("#hp").val() == ""){
			alert("휴대폰 번호를 입력해주세요");
			$("#hp").focus();
			return false;
		}else{
			join_form.submit();
		}
		
	});
}
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- container -->	
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
		<!-- center_section_join -->
		<div class="center_section_join">
			<div class="center_box">
				<form name="join_form" action="join_per_proc.do" method="post" class="content_layout">
				<div class="join_box">
					<div class="join_tit_box">
						<p class="join_tit">회원가입</p>
						<p class="join_stit">회원가입을 위한 정보를 입력해주세요.</p>
					</div>
					<!-- <div class="join_content_box">
						<a class="join_naver_btn" href="#">네이버로 시작하기</a>
					</div> -->
					<div class="join_content_box">
						<ul class="join_write_list">
							<li>
								<div class="join_write_list_f">
								<span>*</span>
								이름
								</div>
								<div class="join_write_list_s">
									<div class="normal_ipt_box">
										<input type="text" name="name" placeholder="이름" class="i1" id="name">
									</div>
								</div>
							</li>
							<li>
								<div class="join_write_list_f">
								<span>*</span>
								이메일
								</div>
								<div class="join_write_list_s">
									<div class="normal_ipt_box">
										<input type="text" name="id" placeholder="이메일" class="i1" id="id">
									</div>
								</div>
							</li>
							<li>
								<div class="join_write_list_f">
								<span>*</span>
								비밀번호
								</div>
								<div class="join_write_list_s">
									<div class="normal_ipt_box">
										<input type="password" name="pass" placeholder="비밀번호" class="i1" id="pass">
									</div>
								</div>
							</li>
							<li>
								<div class="join_write_list_f">
								<span>*</span>
								비밀번호 확인
								</div>
								<div class="join_write_list_s">
									<div class="normal_ipt_box">
										<input type="password" name="cpass" placeholder="비밀번호 확인" class="i1" id="cpass" onblur="passCheck()">
										<div id="msg"></div>
									</div>
								</div>
							</li>
							<li>
								<div class="join_write_list_f">
								<span>*</span>
								휴대폰
								</div>
								<div class="join_write_list_s">
									<div class="normal_ipt_box join_write_hp">
										<input type="text" name="hp" placeholder="휴대폰 번호" class="i1" id="hp" >
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="join_content_box">
						<ul class="join_content_check_list">
							<li>
								<input type="checkbox" name="agree_privacy" value="1" class="check_box_btn" title="이용약관 및 개인정보 처리방침 동의 체크" required>
								<a class="join_cont_check_list_text" href="#">이용약관 및 개인정보 처리방침 동의</a>
								<span class="red">(필수)</span>
							</li>
							<li>
								<input type="checkbox" class="check_box_btn" title="이용약관 및 개인정보 처리방침 동의 체크" value="1" title="이용약관 및 개인정보 처리방침 동의 체크">
								<p class="join_cont_check_list_text" href="#">이벤트 등 프로모션 알림</p>
								<span>(선택)</span>
								<p style="color:red;font-size:14px;line-height:20px; letter-spacing: -1px;padding-left: 25px;">※ 동의해주신 회원님들께는 다양한 이벤트와 혜택이 제공됩니다.</p>
							</li>
						</ul>
					</div>
				</div>
					<div class="join_btn_box">
						<input id="doResgister" type="submit" value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- container end -->	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>