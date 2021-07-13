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
.chk, .chk1 {
	vertical-align: middle;
	margin: 5px 5px 5px 0;
}
.chk+p, .chk1+p {
	width: 55px;
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	margin-right: 7px;
	font-weight: normal;
}
.chk+span, .chk1+span {
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
	
	
	
	$("#insert_room").click(function(){
		if($("#branch_name").val() == "") {
			alert("지점명을 입력해주세요.");
			$("#branch_name").focus();
			return false;
		} else if($("#room_name").val() == ""){
			alert("회의실명을 입력해주세요.");
			$("#room_name").focus();
			return false;
		} else if($("#address").val() == ""){
			alert("주소를 입력해주세요.");
			$("#address").focus();
			return false;
		} else if($("#intro").val() == ""){
			alert("한 줄 설명을 입력해주세요.");
			$("#intro").focus();
			return false;
		} else if($("#time1").val() == ""){
			alert("오픈시간을 입력해주세요.");
			$("#time1").focus();
			return false;
		} else if($("#time2").val() == ""){
			alert("마감시간을 입력해주세요.");
			$("#time2").focus();
			return false;
		} else if($("#closed_day").val() == ""){
			alert("휴무일을 입력해주세요.");
			$("#closed_day").focus();
			return false;
		} else if($("#check_info").val() == ""){
			alert("입퇴실 시간 안내를 입력해주세요.");
			$("#check_info").focus();
			return false;
		} else if ($("#payment_type:checked").length == 0) {
			alert("결제구분을 입력해주세요.");
			$("#payment_type:eq(2)").focus();
			return false;
		} else if ($("input[name='type']:checked").length == 0) {
			alert("수용형태를 입력해주세요.");
			$("input[name='type']:eq(2)").focus();
			return false;
		} else if($("#capacity").val() == ""){
			alert("수용인원 입력해주세요.");
			$("#capacity").focus();
			return false;
		} else if($("#file1").val() == ""){
			alert("사진1을 첨부해주세요.");
			$("#file1").focus();
			return false;
		} 
		$(".chk1").each(function(idx, item){
			if($(this).is(":checked") == true){
				$(this).val(1);
			}
		});
		
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
					<img src="http://localhost:9000/space/images/little_logo.jpg"/>
					<span>나의 회의실</span>
				</p>
				<ul>
						<li>
						<a href="corppage.do">회의실 관리</a>
					</li>
					<li>
						<a href="corppage_booked.do">예약 내역</a>
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
               <input type="text" name="branch_name" id="branch_name" class="input_subject" title="지점명" required>
            </td>
         </tr>
         <tr>
            <th>회의실명</th>
            <td>
               <input type="text" name="room_name" id="room_name" class="input_subject" title="회의실명" required>
            </td>
         </tr>
         <tr>
            <th scope="row">주소</th>
            <td>
               <input type="text" name="address" id="address" class="input_subject" title="주소" required>
            </td>
         </tr>
         <tr>
            <th>한 줄 설명</th>
            <td>
               <input type="text" name="intro" id="intro" class="input_subject" title="한 줄 설명">
            </td>
         </tr>
         <tr>
            <th>영업시간</th>
            <td>
               <input type="text" id="time1" name="opening_time" title="시작시간"> ~ <input type="text" id="time2" name="closing_time" title="종료시간">
            </td>
         </tr>
         <tr>
            <th>휴무일</th>
            <td>
               <input type="text" name="closed_day" id="closed_day" class="input_subject" title="휴무일">
            </td>
         </tr>
         <tr>
            <th>입,퇴실 시간 안내</th>
            <td>
               <input type="text" name="check_info" id="check_info" class="input_subject" title="입,퇴실 시간 안내" placeholder="입,퇴실 시간 예약시간 30분 전/후">
            </td>
         </tr>
         <tr>
            <th>결제구분</th>
            <td>
               <input type="checkbox" name="online_payment" id="payment_type" class="chk" value="온라인결제"><span>온라인결제</span>
               <input type="checkbox" name="offline_payment" id="payment_type" class="chk" value="현장결제"><span>현장결제</span>
            </td>
         </tr>
         <tr>
            <th>수용형태</th>
            <td>
               <input type="radio" name="type" class="chk" value="ㅁ자형"><p><img src="http://localhost:9000/space/images/shape_icon04.png">ㅁ자형</p>
               <input type="radio" name="type" class="chk" value="U자형"><p><img src="http://localhost:9000/space/images/shape_icon03.png">U자형</p>
               <input type="radio" name="type" class="chk" value="강의식"><p><img src="http://localhost:9000/space/images/shape_icon01.png">강의식</p>
               <input type="radio" name="type" class="chk" value="분임식"><p><img src="http://localhost:9000/space/images/shape_icon02.png">분임식</p>
            </td>
         </tr>
         <tr>
            <th>수용인원</th>
            <td>
               <input type="number" name="capacity" id="capacity" class="input_subject" title="수용인원" min="1">
            </td>
         </tr>
         <tr>
            <th>편의시설</th>
            <td>
               <input type="checkbox" name="lounge" class="chk1" value="0"><span>공용 라운지</span>
               <input type="checkbox" name="smoking_room" class="chk1" value="0"><span>흡연실</span>
               <input type="checkbox" name="parking_lot" class="chk1" value="0"><span>주차장</span>
               <input type="checkbox" name="elevator" class="chk1" value="0"><span>승강기</span>
               <input type="checkbox" name="freight_elevator" class="chk1" value="0"><span>화물승강기</span><br>
               <input type="checkbox" name="vending_machine" class="chk1" value="0"><span>자판기</span>
               <input type="checkbox" name="wifi" class="chk1" value="0"><span>Wi-Fi</span>
               <input type="checkbox" name="accessible_toilet" class="chk1" value="0"><span>장애인 화장실</span>
               <input type="checkbox" name="toilet" class="chk1" value="0"><span>화장실</span>
               <input type="checkbox" name="water_dispenser" class="chk1" value="0"><span>정수기</span>
            </td>
         </tr>
         <tr>
            <th>부가서비스</th>
            <td>
               <input type="checkbox" name="beam" class="chk1" value="0"><span>빔프로젝터</span>
               <input type="checkbox" name="video_device" class="chk1" value="0"><span>화상회의장비</span>
               <input type="checkbox" name="mic" class="chk1" value="0"><span>마이크</span>
               <input type="checkbox" name="lectern" class="chk1" value="0"><span>강연대</span>
               <input type="checkbox" name="tv" class="chk1" value="0"><span>TV</span>
               <input type="checkbox" name="speaker" class="chk1" value="0"><span>스피커</span><br>
               <input type="checkbox" name="pc" class="chk1" value="0"><span>PC/노트북</span>
               <input type="checkbox" name="pointer" class="chk1" value="0"><span>포인터</span>
               <input type="checkbox" name="banner" class="chk1" value="0"><span>현수막</span>
               <input type="checkbox" name="whiteboard" class="chk1" value="0"><span>화이트보드</span>
               <input type="checkbox" name="dais" class="chk1" value="0"><span>단상</span><br>
               <input type="checkbox" name="conference_call" class="chk1" value="0"><span>컨퍼런스콜</span>
               <input type="checkbox" name="air_conditional" class="chk1" value="0"><span>에어컨</span>
               <input type="checkbox" name="heater" class="chk1" value="0"><span>난방기</span>
               <input type="checkbox" name="internet" class="chk1" value="0"><span>유선인터넷</span>
               <input type="checkbox" name="studio" class="chk1" value="0"><span>영상스튜디오</span>
            </td>
         </tr>
         <tr>
            <th>식음료</th>
            <td>
               <input type="checkbox" name="snack_carry" class="chk1" value="0"><span>다과류 반입가능</span>
               <input type="checkbox" name="snack_sale" class="chk1" value="0"><span>다과류 별도판매</span>
               <input type="checkbox" name="meal_carry" class="chk1" value="0"><span>식사류 반입가능</span>
               <input type="checkbox" name="meal_sale" class="chk1" value="0"><span>식사류 별도판매</span>
            </td>
         </tr>
         <tr>
            <th>회의실 사진1</th>
            <td>
               <input name="file1" id="file1" type="file">
            </td>
         </tr>
         <tr>
            <th>회의실 사진2</th>
            <td>
               <input name="file2" type="file">
            </td>
         </tr>
         <tr>
            <th>회의실 사진3</th>
            <td>
               <input name="file3" type="file">
            </td>
         </tr>
         
      </table>

   <div class="mypage_write_btn">
      <input type="button" value="등록" class="blue" id="insert_room">
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