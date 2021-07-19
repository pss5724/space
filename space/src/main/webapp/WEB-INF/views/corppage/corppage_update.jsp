<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.mypage_content {
	width: 1000px;
	margin: auto;
}

.mypage_left_box ul li:first-child a {
	text-decoration: none;
	font-size: 19px;
	font-weight: bold;
	color: black;
}
.mypage_right_box_title {
	margin-bottom: 0;
}

.insert_corppage_table {
	margin-top: 40px;
	margin-right: 100px;
	width: 90%;
	border-spacing: 0;
	border-collapse: collapse;
}

.insert_corppage_table tr {
	font-size: 14px;
	font-weight: 600;
	height: 60px;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

.insert_corppage_table tr th {
	padding-left: 12px;
	text-align: left;
	width: 150px;
	background-color: rgb(248, 248, 248);
	font-weight: 600;
	height: 60px;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

.insert_corppage_table tr td {
	padding: 10px;
	text-align: left;
	font-weight: 600;
	height: 60px;
}

.input_subject {
	width: 100%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid lightgray;
}

#address {
	width: 79%;
}

#btn_search_address {
	padding: 8px 10px;
    border: 1px solid darkgray;
    border-radius: 6px;
    background: white;
}
#btn_search_address:hover {
	cursor: pointer;
}
#time1, #time2 {
	width: 47.3%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid lightgray;
}

.ui-menu-item>a {
	font-size: 14px;
}

.blue {
	float: left;
	border: 1px solid rgb(2, 116, 216);
	border-radius: 5px;
	margin-right: 6px;
	padding: 6px 45px;
	color: white;
	font-size: 15px;
	font-weight: 600;
	background-color: rgb(2, 116, 216);
}

.cancel {
	float: left;
	border: 1px solid lightgray;
	border-radius: 5px;
	padding: 6px 45px;
	font-size: 15px;
	font-weight: 600;
	background-color: white;
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

input.service, input.service_price {
	width: 100%;
	padding: 10px;
	border-radius: 6px;
	border: 1px solid lightgray;
}

input.service.price {
	margin-top: 10px;
}
tr.form_explanation {
	border-top: none;
}
.file_name {
	display: inline-block;
    margin-left: -175px;
    width: 330px;
    background: white;
    font-weight: initial;
    font-size: 13px;
}
</style>
<script>

    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
               
                var roadAddr = data.roadAddress;
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                document.getElementById("address").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                
                /* close(); */
            }
        }).open();
    }

	$(document).ready(function() {
		
		$("#btn_search_address").click(function() {
			searchAddress();
		});

		$("#time1").timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '00:00',
			maxTime : '23:30',
			startTime : '00:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});
		$("#time2").timepicker({
			timeFormat : 'HH:mm',
			interval : 30,
			minTime : '00:00',
			maxTime : '23:30',
			startTime : '00:00',
			dynamic : false,
			dropdown : true,
			scrollbar : true
		});

		$("#update_room").click(function() {
 			if ($("#branch_name").val() == "") {
				alert("지점명을 입력해주세요.");
				$("#branch_name").focus();
				return false;
			} else if ($("#room_name").val() == "") {
				alert("회의실명을 입력해주세요.");
				$("#room_name").focus();
				return false;
			} else if ($("#address").val() == "") {
				alert("주소를 입력해주세요.");
				$("#address").focus();
				return false;
			} else if ($("#intro").val() == "") {
				alert("한 줄 설명을 입력해주세요.");
				$("#intro").focus();
				return false;
			} else if ($("#time1").val() == "") {
				alert("오픈시간을 입력해주세요.");
				$("#time1").focus();
				return false;
			} else if ($("#time2").val() == "") {
				alert("마감시간을 입력해주세요.");
				$("#time2").focus();
				return false;
			} else if ($("#closed_day").val() == "") {
				alert("휴무일을 입력해주세요.");
				$("#closed_day").focus();
				return false;
			} else if ($("#check_info").val() == "") {
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
			} else if ($("#capacity").val() == "") {
				alert("수용인원 입력해주세요.");
				$("#capacity").focus();
				return false;
			/* } else if ($("#file1").val() == "") {
				alert("사진1을 첨부해주세요.");
				$("#file1").focus();
				return false; */
			} else if ($("#charge").val() == "") {
				alert("대관료를 입력해주세요.");
				$("#charge").focus();
				return false;
			}

 			/* 체크한 옵션 값 1로 변경 */
			$(".chk1").each(function(idx, item) {
				if ($(this).is(":checked") == true) {
					$(this).val(1);
				}
			});

			
			/* 영업시간 숫자로 변환 */
			$("input[id^=time]").each(function() {
					var tlist = $(this).val().split(":");
					var time = 0;
	
					if (tlist[0] < 10) { //시간
						time += Number(tlist[0].substr(1, 1))
					} else {
						time += Number(tlist[0]);
					}
	
					if (tlist[1] == 30) { //분
						time += 0.5;
					}
	
					$(this).val(time);
			});
			
			
			/* 편의사항, 식음료 미선택 시 -, 0 넣어주기 */
			$(".service").each(function() {
				if($(this).hasClass("price")) {
					if($(this).val()=="") {
						$(this).val(0);
					}
					
				} else {
					if($(this).val()=="") {
						$(this).val("-");
					}
				}
			});
		}); //insert_room
		
		
		/* 선택된 항목 체크 */
		var data = {"option" : 
			[{"name":"lounge", "value": "<c:out value='${ovo.lounge}' />"},
			{"name":"smoking_room", "value": "<c:out value='${ovo.smoking_room}' />"},
			{"name":"parking_lot", "value": "<c:out value='${ovo.parking_lot}' />"},
			{"name":"elevator", "value": "<c:out value='${ovo.elevator}' />"},
			{"name":"freight_elevator", "value": "<c:out value='${ovo.freight_elevator}' />"},
			{"name":"vending_machine", "value": "<c:out value='${ovo.vending_machine}' />"},
			{"name":"wifi", "value": "<c:out value='${ovo.wifi}' />"},
			{"name":"accessible_toilet", "value": "<c:out value='${ovo.accessible_toilet}' />"},
			{"name":"toilet", "value": "<c:out value='${ovo.toilet}' />"},
			{"name":"water_dispenser", "value": "<c:out value='${ovo.water_dispenser}' />"},
			{"name":"ktx", "value": "<c:out value='${ovo.ktx}' />"},
			{"name":"beam", "value": "<c:out value='${ovo.beam}' />"},
			{"name":"video_device", "value": "<c:out value='${ovo.video_device}' />"},
			{"name":"mic", "value": "<c:out value='${ovo.mic}' />"},
			{"name":"lectern", "value": "<c:out value='${ovo.lectern}' />"},
			{"name":"tv", "value": "<c:out value='${ovo.tv}' />"},
			{"name":"speaker", "value": "<c:out value='${ovo.speaker}' />"},
			{"name":"pc", "value": "<c:out value='${ovo.pc}' />"},
			{"name":"pointer", "value": "<c:out value='${ovo.pointer}' />"},
			{"name":"banner", "value": "<c:out value='${ovo.banner}' />"},
			{"name":"whiteboard", "value": "<c:out value='${ovo.whiteboard}' />"},
			{"name":"dais", "value": "<c:out value='${ovo.dais}' />"},
			{"name":"conference_call", "value": "<c:out value='${ovo.conference_call}' />"},
			{"name":"air_conditional", "value": "<c:out value='${ovo.air_conditional}' />"},
			{"name":"heater", "value": "<c:out value='${ovo.heater}' />"},
			{"name":"internet", "value": "<c:out value='${ovo.internet}' />"},
			{"name":"studio", "value": "<c:out value='${ovo.studio}' />"},
			{"name":"snack_carry", "value": "<c:out value='${ovo.snack_carry}' />"},
			{"name":"snack_sale", "value": "<c:out value='${ovo.snack_sale}' />"},
			{"name":"meal_carry", "value": "<c:out value='${ovo.meal_carry}' />"},
			{"name":"meal_sale", "value": "<c:out value='${ovo.meal_sale}' />"},
			{"name":"online_payment", "value": "<c:out value='${ovo.online_payment}' />"},
			{"name":"offline_payment", "value": "<c:out value='${ovo.offline_payment}' />"}
			]
		};
		
		for(var i in data.option) {
 			if(data.option[i].value == 1) {
				document.getElementsByName(data.option[i].name)[0].checked = true;
			}
		}	
		
		$(".service").each(function() {
			if($(this).val() == "-" || $(this).val() == 0) {
				$(this).val("");
			}
		});
		
		/* 숫자를 시간으로 변환 */
 		var opening_time = "<c:out value='${rvo.opening_time}' />";
		var closing_time = "<c:out value='${rvo.closing_time}' />";
		var time_list = {opening_time, closing_time};
		
		for(var i in time_list) {
			var list = time_list[i].split(".");
			var time = "";

			if(list[0]<10) {
				time += "0";
			}
			
			if(list[1]==0) {
				time += list[0] + ":" + "00"; 
			} else {
				time += list[0] + ":" + "30";
			}
			
			if(time_list[i] == opening_time) {
				$("#time1").val(time);
			} else {
				$("#time2").val(time);
			}
		} 
		
		
		$("input[name=type]").each(function() {
			if($(this).val() == "<c:out value='${rvo.type}' />") {
				$(this).prop("checked", true);
			}
		});
		
		$("input[type=file]").each(function() {
			$(this).change(function() {
				$(this).next(".file_name").css("display", "none");
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
					<img src="http://localhost:9000/space/images/little_logo.jpg" /> <span>나의 회의실</span>
				</p>
				<ul>
					<li><a href="corppage.do">회의실 관리</a></li>
					<li><a href="corppage_booked.do">예약 내역</a></li>
					<li><a href="corppage_inquiry.do">1:1 문의</a></li>
					<li><a href="corppage_booked.do">회원정보 수정</a></li>
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">

				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">회의실 등록</p>
				</div>
				
				<form id="update_corppage" action="room_update_proc.do" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="rid" value="${rvo.rid }">
					<table class="insert_corppage_table">
						<tr class="form_explanation">
							<td class="form_explanation" colspan=2>*은 필수 입력사항입니다.</td>
						</tr>
						<tr>
							<th scope="row">지점명 *</th>
							<td><input type="text" name="branch_name" id="branch_name"
								class="input_subject" title="지점명" value="${rvo.branch_name}">
							</td>
						</tr>
						<tr>
							<th>회의실명 *</th>
							<td>
								<input type="text" name="room_name" id="room_name"
								class="input_subject" title="회의실명" value="${rvo.room_name}">
							</td>
						</tr>
						<tr>
							<th scope="row">주소 *</th>
							<td>
								<input type="text" name="address" id="address" class="input_subject" title="주소" value="${rvo.address}">
								<button type="button" id="btn_search_address">주소 검색</button>
							</td>
						</tr>
						<tr>
							<th>한 줄 설명 *</th>
							<td>
								<input type="text" name="intro" id="intro"
								class="input_subject" title="한 줄 설명" value="${rvo.intro}">
							</td>
						</tr>
						<tr>
							<th>영업시간 *</th>
							<td>
								<input type="text" id="time1" name="opening_time" title="시작시간"> ~ 
								<input type="text" id="time2" name="closing_time" title="종료시간">
							</td>
						</tr>
						<tr>
							<th>대관료(시간당) *</th>
							<td>
								<input type="number" id="charge" name="charge"
								title="대관료" class="input_subject"
								placeholder="시간당 대관료를 숫자로 적어주세요. 예) 75000" value="${rvo.charge}">
							</td>
						</tr>
						<tr>
							<th>휴무일 *</th>
							<td>
								<input type="text" name="closed_day" id="closed_day"
								class="input_subject" title="휴무일" value="${rvo.closed_day}">
							</td>
						</tr>
						<tr>
							<th>입,퇴실 시간 안내 *</th>
							<td>
								<input type="text" name="check_info" id="check_info"
								class="input_subject" title="입,퇴실 시간 안내"
								placeholder="입,퇴실 시간 예약시간 30분 전/후" value="${rvo.check_info}">
							</td>
						</tr>
						<tr>
							<th>결제구분 *</th>
							<td>
								<input type="checkbox" name="online_payment" id="payment_type" class="chk1" value="0"><span>온라인결제</span>
								<input type="checkbox" name="offline_payment" id="payment_type" class="chk1" value="0"><span>현장결제</span>
							</td>
						</tr>
						<tr>
							<th>수용형태 *</th>
							<td>
								<input type="radio" name="type" class="chk" value="ㅁ자형">
								<p><img src="http://localhost:9000/space/images/shape_icon04.png">ㅁ자형</p> 
								<input type="radio" name="type" class="chk" value="U자형">
								<p><img src="http://localhost:9000/space/images/shape_icon03.png">U자형</p> 
								<input type="radio" name="type" class="chk" value="강의식">
								<p><img src="http://localhost:9000/space/images/shape_icon01.png">강의식</p> 
								<input type="radio" name="type" class="chk" value="분임식">
								<p><img src="http://localhost:9000/space/images/shape_icon02.png">분임식</p>
							</td>
						</tr>
						<tr>
							<th>수용인원 *</th>
							<td>
								<input type="number" name="capacity" id="capacity" class="input_subject" title="수용인원" min="1"
										value="${rvo.capacity }">
							</td>
						</tr>
						<tr>
							<th>편의시설</th>
							<td>
								<input type="checkbox" name="lounge" id="lounge" class="chk1" value="0"><span>공용 라운지</span> 
								<input type="checkbox" name="smoking_room" id="smoking_room" class="chk1" value="0"><span>흡연실</span>
								<input type="checkbox" name="parking_lot" id="parking_lot" class="chk1" value="0"><span>주차장</span>
								<input type="checkbox" name="elevator" class="chk1" value="0"><span>승강기</span>
								<input type="checkbox" name="freight_elevator" class="chk1"value="0"><span>화물승강기</span><br>
								<input type="checkbox" name="vending_machine" class="chk1" value="0"><span>자판기</span>
								<input type="checkbox" name="wifi" class="chk1" value="0"><span>Wi-Fi</span>
								<input type="checkbox" name="accessible_toilet" class="chk1"value="0"><span>장애인 화장실</span>
								<input type="checkbox" name="toilet" class="chk1" value="0"><span>화장실</span> 
								<input type="checkbox" name="water_dispenser" class="chk1" value="0"><span>정수기</span>
								<input type="checkbox" name="ktx" class="chk1" value="0"><span>KTX/SRT 인근</span>
							</td>
						</tr>
						<tr>
							<th>부가서비스</th>
							<td>
								<input type="checkbox" name="beam" class="chk1" value="0"><span>빔프로젝터</span> 
								<input type="checkbox" name="video_device" class="chk1" value="0"><span>화상회의장비</span>
								<input type="checkbox" name="mic" class="chk1" value="0"><span>마이크</span>
								<input type="checkbox" name="lectern" class="chk1" value="0"><span>강연대</span>
								<input type="checkbox" name="tv" class="chk1" value="0"><span>TV</span><br>
								<input type="checkbox" name="speaker" class="chk1" value="0"><span>스피커</span>
								<input type="checkbox" name="pc" class="chk1" value="0"><span>PC/노트북</span>
								<input type="checkbox" name="pointer" class="chk1" value="0"><span>포인터</span>
								<input type="checkbox" name="banner" class="chk1" value="0"><span>현수막</span>
								<input type="checkbox" name="whiteboard" class="chk1" value="0"><span>화이트보드</span>
								<input type="checkbox" name="dais" class="chk1" value="0"><span>단상</span>
								<input type="checkbox" name="conference_call" class="chk1"value="0"><span>컨퍼런스콜</span> 
								<input type="checkbox" name="air_conditional" class="chk1" value="0"><span>에어컨</span>
								<input type="checkbox" name="heater" class="chk1" value="0"><span>난방기</span>
								<input type="checkbox" name="internet" class="chk1" value="0"><span>유선인터넷</span><br>
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
							<th>편의사항1</th>
							<td>
								<input type="text" name="convenience1" class="service" title="편의사항1"
										placeholder="예) 6시 이후 스태프 대기" value="${svo.convenience1}"> 
								<input type="number" name="convenience1_price" class="service price" title="편의사항1 가격" 
										placeholder="편의사항 가격을 숫자로 적어주세요. 예) 50000" value="${svo.convenience1_price}">
							</td>
						</tr>
						<tr>
							<th>편의사항2</th>
							<td>
								<input type="text" name="convenience2" class="service" title="편의사항2"
										placeholder="항목" value="${svo.convenience2}"> 
								<input type="number" name="convenience2_price" class="service price" title="편의사항2 가격" 
										placeholder="가격" value="${svo.convenience2_price}">
							</td>
						</tr>
						<tr>
							<th>편의사항3</th>
							<td>
								<input type="text" name="convenience3" class="service" title="편의사항3" 
										placeholder="항목" value="${svo.convenience3}"> 
								<input type="number" name="convenience3_price" class="service price" title="편의사항3 가격" 
										placeholder="가격" value="${svo.convenience3_price}">
							</td>
						</tr>
						<tr>
							<th>식음료1</th>
							<td>
								<input type="text" name="beverage1" class="service" title="식음료1" 
										placeholder="예) 다과세트(1인)" value="${svo.beverage1}"> 
								<input type="number" name="beverage1_price" class="service price" title="식음료1 이용료"  
										placeholder="식음료 가격을 숫자로 적어주세요. 예) 50000" value="${svo.beverage1_price}">
							</td>
						</tr>
						<tr>
							<th>식음료2</th>
							<td>
								<input type="text" name="beverage2" class="service" title="식음료2" 
										placeholder="항목" value="${svo.beverage2}"> 
								<input type="number" name="beverage2_price" class="service price" title="식음료2 가격" 
										placeholder="가격" value="${svo.beverage2_price}">
							</td>
						</tr>
						<tr>
							<th>식음료3</th>
							<td>
								<input type="text" name="beverage3" class="service" title="식음료3" 
										placeholder="항목" value="${svo.beverage3}"> 
								<input type="number" name="beverage3_price" class="service price" title="식음료3 가격" 
										placeholder="가격" value="${svo.beverage3_price}">
							</td>
						</tr>
						<tr>
							<th>회의실 사진1 *</th>
							<td><input type="file" name="file1" id="file1"><span class="file_name">${rvo.rfile1}</span></td>
						</tr>
						<tr>
							<th>회의실 사진2</th>
							<td><input type="file" name="file2"><span class="file_name">${rvo.rfile2}</span></td>
						</tr>
						<tr>
							<th>회의실 사진3</th>
							<td><input type="file" name="file3"><span class="file_name">${rvo.rfile3}</span></td>
						</tr>

					</table>

					<div class="mypage_write_btn">
						<input type="submit" value="등록" class="blue" id="update_room">
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