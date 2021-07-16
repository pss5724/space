<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/join_main.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space.js"></script>
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
				<div class="join_box">
					<div class="join_tit_box">
						<p class="join_tit">회원가입</p>
						<p class="join_stit">회원의 종류를 선택해주세요.</p>
					</div>
					<ul class="join_list">
						<li class="join_list01"><a href="http://localhost:9000/space/join_personal.do">
								<p>
									개인회원 <br>
									<span>(회의실 이용 고객)</span>
								</p>
						</a></li>
						<li class="join_list02"><a href="http://localhost:9000/space/join_cor.do">
								<p>
									기업회원 <br>
									<span>(파트너)</span>
								</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- end line -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>