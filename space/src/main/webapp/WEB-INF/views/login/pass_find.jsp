<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/login.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space.js"></script>
<script>
$(document).ready(function() {
	$(".login_btn").click(function(){
		if($("#email").val() == ""){
			alert('이메일 주소를 입력해주세요');
		}else{
			alert('임시 비밀번호를 이메일로 보냈습니다.');
			passwordForm.submit();
		}
	});
});
</script>
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
				<form name="passwordForm" action="pass_find_check.do" method="post" class="content_layout">
					<div class="login_box">
						<p class="login_tit">비밀번호 찾기</p>
						<ul class="login_top">
							<li class="id">
								<input type="email" id="email" name="id" placeholder="이메일" value title="이메일 입력">
							</li>
						</ul>
						<%-- <c:choose>
						<c:when>
						<a id="loginEmail" class="login_btn" onclick="alert('이메일을 입력해주세요.')">비밀번호 찾기</a>
						</c:when>
						<c:otherwise> --%>
						<a id="loginEmail" class="login_btn">비밀번호 찾기</a>
						<%-- </c:otherwise>
						</c:choose>	 --%>					
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