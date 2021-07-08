<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/login.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->	
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
		<!-- center_section_login -->
		<div class="center_section_login">
			<div class="center_box">
				<form name="login_form" action="login_check.do" method="post" class="content_layout">
					<div class="login_box">
						<p class="login_tit">로그인</p>
						<ul class="login_top">
							<li class="id">
								<input type="email" name="email" placeholder="이메일" value title="이메일 입력">
							</li>
							<li class="pass">
								<input type="password" name="password" placeholder="비밀번호" value title="비밀번호 입력">
							</li>
						</ul>
						<div class="login_middle">
							<div class="login_middle_left">
								<a href="http://localhost:9000/space/join_main.do">회원가입</a>
							</div>
							<div class="login_middle_right">
								<a href="http://localhost:9000/space/pass_find.do">비밀번호 찾기</a>
							</div>
						</div>
						<a id="loginEmail" class="login_btn" href="#">이메일로 로그인</a>
						<a id="loginNaver" class="naver_login_btn" href="#"><img src="http://localhost:9000/space/images/naver_btn_text.png">로그인</a>
						<p class="login_comment">*기업, 파트너스 회원가입은 일반 회원가입으로 진행해주시길 바랍니다.</p>
					</div>
				</form>
			</div>		
		</div>
		<!-- end line -->
		
	</div>
	<!-- content end -->	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>