<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/login.css">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style type="text/css">
h1 {
	font-size: 150%;
    font-weight: 500;
}
h2 {
	font-size: 140%;
    font-weight: 600;
}

#click:hover{
	color: blue;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		var name = ${result}.response.name;
		var email = ${result}.response.email;
		$("#name").html("환영합니다. "+name+"님");
		$("#email").html(email);
	  });
</script>

</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	<br>
 
	<!-- content -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
		<!-- center_section_login -->
		<div class="center_section_login">
			<div class="center_box">
				<h2 style="text-align: center" id="name"></h2>
				<h4 style="text-align: center" id="email"></h4><br><br>
				<h1 style="text-align: center; color: Blue" >스페이스닷컴에 오신걸 환영합니다.</h1><br>
				<a href="http://localhost:9000/space/index.do"><h4 style="text-align: center" id="click">메인으로 click</h4></a>
			</div>
		</div>
	</div>


	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include> 
</body>
</html>