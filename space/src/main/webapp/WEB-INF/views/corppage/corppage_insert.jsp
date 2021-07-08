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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<style>
.mypage_left_box ul li:first-child a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
}
.mypage_right_box_title p{
	margin-bottom:20px;
}
.insert_corppage_table {
	margin-top:80px;
	margin-right:100px;
 width:90%;
 border-spacing:0;
 border-collapse:collapse;
}

 .insert_corppage_table tr{
 	
  	
   	font-size :14px;
 	font-weight:600; 
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
  .insert_corppage_table tr th{
  	padding-left:12px;
  	text-align:left;
  	width:150px;
   	background-color: rgb(248,248,248);
 	font-weight:600;   
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 } 
 .insert_corppage_table tr td{
  	padding-left:12px;
  	text-align:left;
 	font-weight:600;   
 	height:60px;
 }
 .input_subject {
	width:100%;
	padding: 15px;
	border-radius:6px;
	border: 1px solid lightgray; 
 }
 
#time1, #time2 {
 	width:48.3%;
	padding: 15px;
	border-radius:6px;
	border: 1px solid lightgray; 
}
.ui-menu-item>a {
	font-size: 14px;
}
.blue{
	float:left;
	border:1px solid rgb(2,116,216);
	border-radius:5px;
	margin-right:6px;
	padding: 6px 45px; 
	color:white;
	font-size:15px;
	font-weight:600;
	background-color:rgb(2,116,216); 
}
.cancel{
	float:left;
	border:1px solid lightgray;
	border-radius:5px;
	padding: 6px 45px; 
	font-size:15px;
	font-weight:600;
	background-color:white; 
}
.chk {
	vertical-align: middle;
	margin: 5px 5px 5px 0;
}
.chk+p {
	width: 55px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	margin-right: 7px;
	font-weight: normal;
}
.chk+span {
	font-weight: normal;
	margin-right: 7px;
}
</style>
<script>
$(document).ready(function() {
	
	$("#time1").timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '00:00',
        maxTime: '23:30',
        startTime: '00:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
	$("#time2").timepicker({
        timeFormat: 'HH:mm',
        interval: 30,
        minTime: '00:00',
        maxTime: '23:30',
        startTime: '00:00',
        dynamic: false,
        dropdown: true,
        scrollbar: true        
    });
	
});
</script>
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
					<img src="http://localhost:9000/space/images/little_logo.png"/>
					<span>나의 회의실</span>
				</p>
				<ul>
						<li>
						<a href="corppage.do">회의실 관리</a>
					</li>
					<li>
						<a href="corppage_booked.do">예약된 회의실</a>
					</li>
						<li>
						<a href="corppage_inquiry.do">1:1 문의</a>
					</li>
						<li>
						<a href="corppage_booked.do">회원정보 수정</a>
					</li>
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">
					
				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">회의실 등록</p>
					
				</div>
				
		
			
		<form id="insert_corppage" action="#" method="POST" enctype="multipart/form-data">

		<table class="insert_corppage_table">
	
			<tr>
				<th scope="row">지점명</th>
				<td>
					<input type="text" name="branch_name" class="input_subject" title="지점명" required>
				</td>
			</tr>
			<tr>
				<th>회의실명</th>
				<td>
					<input type="text" name="room_name" class="input_subject" title="회의실명" required>
				</td>
			</tr>
			<tr>
				<th scope="row">주소</th>
				<td>
					<input type="text" name="branch_address" class="input_subject" title="주소" required>
				</td>
			</tr>
			<tr>
				<th>한 줄 설명</th>
				<td>
					<input type="text" name="content" class="input_subject" title="한 줄 설명">
				</td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td>
					<input type="text" id="time1" name="time1" title="시작시간"> ~ <input type="text" id="time2" name="time2" title="종료시간">
				</td>
			</tr>
			<tr>
				<th>휴무일</th>
				<td>
					<input type="text" name="dayoff" class="input_subject" title="휴무일">
				</td>
			</tr>
			<tr>
				<th>입,퇴실 시간</th>
				<td>
					<input type="text" name="in_out_time" class="input_subject" title="입,퇴실 시간">
				</td>
			</tr>
			<tr>
				<th>결제구분</th>
				<td>
					<input type="checkbox" name="pay_type" class="chk" value="온라인결제"><span>온라인결제</span>
					<input type="checkbox" name="pay_type" class="chk" value="현장결제"><span>현장결제</span>
				</td>
			</tr>
			<tr>
				<th>수용형태</th>
				<td>
					<input type="radio" name="shape" class="chk" value="ㅁ자형"><p><img src="http://localhost:9000/space/images/shape_icon04.png">ㅁ자형</p>
					<input type="radio" name="shape" class="chk" value="U자형"><p><img src="http://localhost:9000/space/images/shape_icon03.png">U자형</p>
					<input type="radio" name="shape" class="chk" value="강의식"><p><img src="http://localhost:9000/space/images/shape_icon01.png">강의식</p>
					<input type="radio" name="shape" class="chk" value="분임식"><p><img src="http://localhost:9000/space/images/shape_icon02.png">분임식</p>
				</td>
			</tr>
			<tr>
				<th>수용인원</th>
				<td>
					<input type="number" name="people_num" class="input_subject" title="수용인원" min="1">
				</td>
			</tr>
			<tr>
				<th>편의시설</th>
				<td>
					<input type="checkbox" name="convenience" class="chk" value="공용 라운지"><span>공용 라운지</span>
					<input type="checkbox" name="convenience" class="chk" value="흡연실"><span>흡연실</span>
					<input type="checkbox" name="convenience" class="chk" value="주차장"><span>주차장</span>
					<input type="checkbox" name="convenience" class="chk" value="승강기"><span>승강기</span>
					<input type="checkbox" name="convenience" class="chk" value="화물승강기"><span>화물승강기</span><br>
					<input type="checkbox" name="convenience" class="chk" value="자판기"><span>자판기</span>
					<input type="checkbox" name="convenience" class="chk" value="Wi-Fi"><span>Wi-Fi</span>
					<input type="checkbox" name="convenience" class="chk" value="장애인 화장실"><span>장애인 화장실</span>
					<input type="checkbox" name="convenience" class="chk" value="화장실"><span>화장실</span>
					<input type="checkbox" name="convenience" class="chk" value="정수기"><span>정수기</span>
				</td>
			</tr>
			<tr>
				<th>부가서비스</th>
				<td>
					<input type="checkbox" name="additional" class="chk" value="빔프로젝터"><span>빔프로젝터</span>
					<input type="checkbox" name="additional" class="chk" value="화상회의장비"><span>화상회의장비</span>
					<input type="checkbox" name="additional" class="chk" value="마이크"><span>마이크</span>
					<input type="checkbox" name="additional" class="chk" value="강연대"><span>강연대</span>
					<input type="checkbox" name="additional" class="chk" value="TV"><span>TV</span>
					<input type="checkbox" name="additional" class="chk" value="스피커"><span>스피커</span><br>
					<input type="checkbox" name="additional" class="chk" value="PC/노트북"><span>PC/노트북</span>
					<input type="checkbox" name="additional" class="chk" value="포인터"><span>포인터</span>
					<input type="checkbox" name="additional" class="chk" value="현수막"><span>현수막</span>
					<input type="checkbox" name="additional" class="chk" value="화이트보드"><span>화이트보드</span>
					<input type="checkbox" name="additional" class="chk" value="단상"><span>단상</span><br>
					<input type="checkbox" name="additional" class="chk" value="컨퍼런스콜"><span>컨퍼런스콜</span>
					<input type="checkbox" name="additional" class="chk" value="에어컨"><span>에어컨</span>
					<input type="checkbox" name="additional" class="chk" value="난방기"><span>난방기</span>
					<input type="checkbox" name="additional" class="chk" value="유선인터넷"><span>유선인터넷</span>
					<input type="checkbox" name="additional" class="chk" value="영상스튜디오"><span>영상스튜디오</span>
				</td>
			</tr>
			<tr>
				<th>부가서비스</th>
				<td>
					<input type="checkbox" name="food" class="chk" value="다과류 반입가능"><span>다과류 반입가능</span>
					<input type="checkbox" name="food" class="chk" value="다과류 별도판매"><span>다과류 별도판매</span>
					<input type="checkbox" name="food" class="chk" value="식사류 반입가능"><span>식사류 반입가능</span>
					<input type="checkbox" name="food" class="chk" value="식사류 별도판매"><span>식사류 별도판매</span>
				</td>
			</tr>
			<tr>
				<th>회의실 사진1</th>
				<td>
					<input name="file" type="file">
				</td>
			</tr>
			<tr>
				<th>회의실 사진2</th>
				<td>
					<input name="file" type="file">
				</td>
			</tr>
			<tr>
				<th>회의실 사진3</th>
				<td>
					<input name="file" type="file">
				</td>
			</tr>
			
		</table>

	<div class="mypage_write_btn">
		<input type="submit" value="등록" class="blue">
		<a href="http://localhost:9000/space/corppage.do" class="cancel">취소</a>
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