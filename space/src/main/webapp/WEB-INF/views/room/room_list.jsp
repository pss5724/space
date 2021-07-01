<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {

	$("html").click(function(e) { 
		if(!$(e.target).is(".select_data") && !$(e.target).is("label input")) { 
			$("label").siblings("div").removeClass("on");
		} 
	});

	
	$("label").click(function() {
		$(this).parent("li").siblings().children("div").removeClass("on");
		$(this).siblings("div").toggleClass("on");

	});

	
});
</script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* .nanumgothic * {
	font-family: 'Nanum Gothic', sans-serif;
} */
* {
	font-family: 'Nanum Gothic', sans-serif;
}
body {
	margin: auto;
	padding: 0;
	min-width: 1280px;
 	max-width: 1920px;
	text-align: center;
}
.container {
	margin: 0;
	padding: 0;
}
.search_area {
	margin: auto;
	padding: 0;
	height: 300px;
	text-align: center;
	background: url("http://localhost:9000/space/images/search_box_bg.jpg") center top no-repeat;
}
.search_box {
	margin: auto;
	width: 1000px;
}
.search_box_title {
	display: inline-block;
	width: 1000px;
	margin-top: 40px;
	color: white;
	font-weight: bold;
	text-align: left;
	text-indent: 30px;
}
.search_box_list {
	list-style-type: none;
	display: inline-block;
	padding: 0 20px;
	margin: 0 auto;
}
.search_box_list li {
	float: left;
	display: inline-block;
	position: relative;
	width: 450px;
	padding: 20px 10px;
	margin: 5px;
	text-align: center;
	border-radius: 3px;
	background-color: white;
	box-shadow: 5px 5px 7px 0 rgba(0, 0, 0, 0.4);
}
.search_box_list li:nth-child(4) {
	padding: 0;
	width: 470px;
	height: 63px;
}
.search_box_list label * {
	float: left;
	margin: 0 5px;
}
.search_box_list li input[type=text] {
	padding: 3px 5px;
	width: 350px;
	border: none;
	font-size: 14px;
	background-color: white;
}
.search_box_list li input[type=text]:focus {
	outline: none;
}
.search_box_list li input[type=text]:hover{
	cursor: pointer;
}
.select_data {
	display: none;
	position: absolute;
	top: 60px;
	left: 0;
	width: 450px;
	height: 100px;
	padding: 20px 10px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	background-color: white;
	z-index: 100;
	box-shadow: 7px 7px 7px 0 rgba(0, 0, 0, 0.1);
}
.on {
	display: block;
}
.btn_search_reset {
	background: none;
	border: none;
}
.btn_search {
	border: none;
	width: 100%;
	height: 100%;
	color: white;
	font-size: 15px;
	font-weight: bold;
	text-indent: 20px;
	background: url("http://localhost:9000/space/images/search_icon.png") lightsteelblue no-repeat 170px;
	border-radius: 3px;
}
.btn_search:hover {
	cursor: pointer;
	background-color: steelblue;
}

</style>
</head>
<body>

	<div class="container">
	
		<!-- 상단 검색 박스 -->
		<div class="search_area">
			<div class="search_box">
				<h1 class="search_box_title">어떤 회의실을 찾고 있나요?</h1>
				<ul class="search_box_list">
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_location.png"></span>
							<input type="text" name="location" id="search_location" placeholder="지역" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data">안녕</div>
					</li>
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_date.png"></span>
							<input type="text" name="date" id="search_date" placeholder="날짜/시간" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data"></div>
					</li>
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_person.png"></span>
							<input type="text" name="capacity" id="search_capacity" placeholder="수용인원" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data"></div>
					</li>
					<li>
						<button type="button" class="btn_search">검색하기</button>
					</li>
				</ul>	
			</div>
		</div>
		
		<!-- 좌측 옵션 검색 -->
		<div></div>
		
		<!-- 회의실 리스트(검색 내용) -->
		<div></div>
		
	</div>

</body>
</html>





















