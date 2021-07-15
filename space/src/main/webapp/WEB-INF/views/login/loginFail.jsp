<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/login.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->	
	<div class="content">
		<section class="login">
			<h1 class="title">로그인</h1>
			<h3>로그인에 실패하셨습니다.</h3>
			<a href="http://localhost:9000/space/login.do"><button type="button">다시 로그인하기</button></a>
			<a href="http://localhost:9000/space/pass_find.do"><button type="button">패스워드 찾기</button></a>
		</section>
	</div>	
	
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>






















