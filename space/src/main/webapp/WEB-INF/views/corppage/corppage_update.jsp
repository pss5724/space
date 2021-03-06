<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${sessionScope.svo != null && sessionScope.svo.id == rvo.id}">
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

                if(data.bname !== '' && /[???|???|???]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                //document.getElementById("address").value = data.jibunAddress;
                document.getElementById("address").value = data.roadAddress;

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
			var $addr_val = $("#address").val();
 			if ($("#branch_name").val() == "") {
				alert("???????????? ??????????????????.");
				$("#branch_name").focus();
				return false;
			} else if ($("#room_name").val() == "") {
				alert("??????????????? ??????????????????.");
				$("#room_name").focus();
				return false;
			} else if ($addr_val == "") {
				alert("????????? ??????????????????.");
				$("#address").focus();
				return false;
			} else if ($addr_val.indexOf("??????") == -1 && $addr_val.indexOf("??????") == -1 && $addr_val.indexOf("??????") == -1 ) {
				alert("????????? ????????? ???????????? ????????? ??? ????????????.");
				$("#address").focus();
				return false;
			} else if ($("#intro").val() == "") {
				alert("??? ??? ????????? ??????????????????.");
				$("#intro").focus();
				return false;
			} else if ($("#time1").val() == "") {
				alert("??????????????? ??????????????????.");
				$("#time1").focus();
				return false;
			} else if ($("#time2").val() == "") {
				alert("??????????????? ??????????????????.");
				$("#time2").focus();
				return false;
			} else if ($("#closed_day").val() == "") {
				alert("???????????? ??????????????????.");
				$("#closed_day").focus();
				return false;
			} else if ($("#check_info").val() == "") {
				alert("????????? ?????? ????????? ??????????????????.");
				$("#check_info").focus();
				return false;
			} else if ($("#payment_type:checked").length == 0) {
				alert("??????????????? ??????????????????.");
				$("#payment_type:eq(2)").focus();
				return false;
			} else if ($("input[name='type']:checked").length == 0) {
				alert("??????????????? ??????????????????.");
				$("input[name='type']:eq(2)").focus();
				return false;
			} else if ($("#capacity").val() == "") {
				alert("???????????? ??????????????????.");
				$("#capacity").focus();
				return false;
			/* } else if ($("#file1").val() == "") {
				alert("??????1??? ??????????????????.");
				$("#file1").focus();
				return false; */
			} else if ($("#charge").val() == "") {
				alert("???????????? ??????????????????.");
				$("#charge").focus();
				return false;
			}

 			/* ????????? ?????? ??? 1??? ?????? */
			$(".chk1").each(function(idx, item) {
				if ($(this).is(":checked") == true) {
					$(this).val(1);
				}
			});

			
			/* ???????????? ????????? ?????? */
			$("input[id^=time]").each(function() {
					var tlist = $(this).val().split(":");
					var time = 0;
	
					if (tlist[0] < 10) { //??????
						time += Number(tlist[0].substr(1, 1))
					} else {
						time += Number(tlist[0]);
					}
	
					if (tlist[1] == 30) { //???
						time += 0.5;
					}
	
					$(this).val(time);
			});
			
			
			/* ????????????, ????????? ????????? ??? null, 0 ???????????? */
			$(".service").each(function() {
				if($(this).hasClass("price")) {
					if($(this).val()=="") {
						$(this).val(0);
					}
					
				} else {
					if($(this).val()=="") {
						$(this).val("null");
					}
				}
			});
		}); //insert_room
		
		
		/* ????????? ?????? ?????? */
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
			if($(this).val() == "null" || $(this).val() == 0) {
				$(this).val("");
			}
		});
		
		/* ????????? ???????????? ?????? */
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
					<img src="http://localhost:9000/space/images/little_logo.jpg" /> <span>?????? ?????????</span>
				</p>
				<ul>
					<li><a href="corppage.do">????????? ??????</a></li>
					<li><a href="corppage_booked.do?rpage=1">?????? ??????</a></li>
					<li><a href="corppage_inquiry.do">1:1 ??????</a></li>
					<li><a href="corppage_booked.do">???????????? ??????</a></li>
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">

				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">????????? ??????</p>
				</div>
				
				<form id="update_corppage" action="room_update_proc.do" method="POST" enctype="multipart/form-data">
					<input type="hidden" name="rid" value="${rvo.rid}">
					<table class="insert_corppage_table">
						<tr class="form_explanation">
							<td class="form_explanation" colspan=2>*??? ?????? ?????????????????????.</td>
						</tr>
						<tr>
							<th scope="row">????????? *</th>
							<td><input type="text" name="branch_name" id="branch_name"
								class="input_subject" title="?????????" value="${rvo.branch_name}">
							</td>
						</tr>
						<tr>
							<th>???????????? *</th>
							<td>
								<input type="text" name="room_name" id="room_name"
								class="input_subject" title="????????????" value="${rvo.room_name}">
							</td>
						</tr>
						<tr>
							<th scope="row">?????? *</th>
							<td>
								<input type="text" name="address" id="address" class="input_subject" title="??????" value="${rvo.address}">
								<button type="button" id="btn_search_address">?????? ??????</button>
							</td>
						</tr>
						<tr>
							<th>??? ??? ?????? *</th>
							<td>
								<input type="text" name="intro" id="intro"
								class="input_subject" title="??? ??? ??????" value="${rvo.intro}">
							</td>
						</tr>
						<tr>
							<th>???????????? *</th>
							<td>
								<input type="text" id="time1" name="opening_time" title="????????????" autocomplete="off"> ~ 
								<input type="text" id="time2" name="closing_time" title="????????????" autocomplete="off">
							</td>
						</tr>
						<tr>
							<th>?????????(?????????) *</th>
							<td>
								<input type="number" id="charge" name="charge"
								title="?????????" class="input_subject"
								placeholder="????????? ???????????? ????????? ???????????????. ???) 75000" value="${rvo.charge}">
							</td>
						</tr>
						<tr>
							<th>????????? *</th>
							<td>
								<input type="text" name="closed_day" id="closed_day"
								class="input_subject" title="?????????" value="${rvo.closed_day}">
							</td>
						</tr>
						<tr>
							<th>???,?????? ?????? ?????? *</th>
							<td>
								<input type="text" name="check_info" id="check_info"
								class="input_subject" title="???,?????? ?????? ??????"
								placeholder="???,?????? ?????? ???????????? 30??? ???/???" value="${rvo.check_info}">
							</td>
						</tr>
						<tr>
							<th>???????????? *</th>
							<td>
								<input type="checkbox" name="online_payment" id="payment_type" class="chk1" value="0"><span>???????????????</span>
								<input type="checkbox" name="offline_payment" id="payment_type" class="chk1" value="0"><span>????????????</span>
							</td>
						</tr>
						<tr>
							<th>???????????? *</th>
							<td>
								<input type="radio" name="type" class="chk" value="?????????">
								<p><img src="http://localhost:9000/space/images/shape_icon04.png">?????????</p> 
								<input type="radio" name="type" class="chk" value="U??????">
								<p><img src="http://localhost:9000/space/images/shape_icon03.png">U??????</p> 
								<input type="radio" name="type" class="chk" value="?????????">
								<p><img src="http://localhost:9000/space/images/shape_icon01.png">?????????</p> 
								<input type="radio" name="type" class="chk" value="?????????">
								<p><img src="http://localhost:9000/space/images/shape_icon02.png">?????????</p>
							</td>
						</tr>
						<tr>
							<th>???????????? *</th>
							<td>
								<input type="number" name="capacity" id="capacity" class="input_subject" title="????????????" min="1"
										value="${rvo.capacity }">
							</td>
						</tr>
						<tr>
							<th>????????????</th>
							<td>
								<input type="checkbox" name="lounge" id="lounge" class="chk1" value="0"><span>?????? ?????????</span> 
								<input type="checkbox" name="smoking_room" id="smoking_room" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="parking_lot" id="parking_lot" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="elevator" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="freight_elevator" class="chk1"value="0"><span>???????????????</span><br>
								<input type="checkbox" name="vending_machine" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="wifi" class="chk1" value="0"><span>Wi-Fi</span>
								<input type="checkbox" name="accessible_toilet" class="chk1"value="0"><span>????????? ?????????</span>
								<input type="checkbox" name="toilet" class="chk1" value="0"><span>?????????</span> 
								<input type="checkbox" name="water_dispenser" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="ktx" class="chk1" value="0"><span>KTX/SRT ??????</span>
							</td>
						</tr>
						<tr>
							<th>???????????????</th>
							<td>
								<input type="checkbox" name="beam" class="chk1" value="0"><span>???????????????</span> 
								<input type="checkbox" name="video_device" class="chk1" value="0"><span>??????????????????</span>
								<input type="checkbox" name="mic" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="lectern" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="tv" class="chk1" value="0"><span>TV</span><br>
								<input type="checkbox" name="speaker" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="pc" class="chk1" value="0"><span>PC/?????????</span>
								<input type="checkbox" name="pointer" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="banner" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="whiteboard" class="chk1" value="0"><span>???????????????</span>
								<input type="checkbox" name="dais" class="chk1" value="0"><span>??????</span>
								<input type="checkbox" name="conference_call" class="chk1"value="0"><span>???????????????</span> 
								<input type="checkbox" name="air_conditional" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="heater" class="chk1" value="0"><span>?????????</span>
								<input type="checkbox" name="internet" class="chk1" value="0"><span>???????????????</span><br>
								<input type="checkbox" name="studio" class="chk1" value="0"><span>??????????????????</span>
							</td>
						</tr>
						<tr>
							<th>?????????</th>
							<td>
								<input type="checkbox" name="snack_carry" class="chk1" value="0"><span>????????? ????????????</span> 
								<input type="checkbox" name="snack_sale" class="chk1" value="0"><span>????????? ????????????</span> 
								<input type="checkbox" name="meal_carry" class="chk1" value="0"><span>????????? ????????????</span> 
								<input type="checkbox" name="meal_sale" class="chk1" value="0"><span>????????? ????????????</span>
							</td>
						</tr>
						<tr>
							<th>????????????1</th>
							<td>
								<input type="text" name="convenience1" class="service" title="????????????1"
										placeholder="???) 6??? ?????? ????????? ??????" value="${svo.convenience1}"> 
								<input type="number" name="convenience1_price" class="service price" title="????????????1 ??????" 
										placeholder="???????????? ????????? ????????? ???????????????. ???) 50000" value="${svo.convenience1_price}">
							</td>
						</tr>
						<tr>
							<th>????????????2</th>
							<td>
								<input type="text" name="convenience2" class="service" title="????????????2"
										placeholder="??????" value="${svo.convenience2}"> 
								<input type="number" name="convenience2_price" class="service price" title="????????????2 ??????" 
										placeholder="??????" value="${svo.convenience2_price}">
							</td>
						</tr>
						<tr>
							<th>????????????3</th>
							<td>
								<input type="text" name="convenience3" class="service" title="????????????3" 
										placeholder="??????" value="${svo.convenience3}"> 
								<input type="number" name="convenience3_price" class="service price" title="????????????3 ??????" 
										placeholder="??????" value="${svo.convenience3_price}">
							</td>
						</tr>
						<tr>
							<th>?????????1</th>
							<td>
								<input type="text" name="beverage1" class="service" title="?????????1" 
										placeholder="???) ????????????(1???)" value="${svo.beverage1}"> 
								<input type="number" name="beverage1_price" class="service price" title="?????????1 ?????????"  
										placeholder="????????? ????????? ????????? ???????????????. ???) 50000" value="${svo.beverage1_price}">
							</td>
						</tr>
						<tr>
							<th>?????????2</th>
							<td>
								<input type="text" name="beverage2" class="service" title="?????????2" 
										placeholder="??????" value="${svo.beverage2}"> 
								<input type="number" name="beverage2_price" class="service price" title="?????????2 ??????" 
										placeholder="??????" value="${svo.beverage2_price}">
							</td>
						</tr>
						<tr>
							<th>?????????3</th>
							<td>
								<input type="text" name="beverage3" class="service" title="?????????3" 
										placeholder="??????" value="${svo.beverage3}"> 
								<input type="number" name="beverage3_price" class="service price" title="?????????3 ??????" 
										placeholder="??????" value="${svo.beverage3_price}">
							</td>
						</tr>
						<tr>
							<th>????????? ??????1 *</th>
							<td><input type="file" name="file1" id="file1"><span class="file_name">${rvo.rfile1}</span></td>
						</tr>
						<tr>
							<th>????????? ??????2</th>
							<td><input type="file" name="file2"><span class="file_name">${rvo.rfile2}</span></td>
						</tr>
						<tr>
							<th>????????? ??????3</th>
							<td><input type="file" name="file3"><span class="file_name">${rvo.rfile3}</span></td>
						</tr>

					</table>

					<div class="mypage_write_btn">
						<input type="submit" value="??????" class="blue" id="update_room">
						<a href="http://localhost:9000/space/corppage.do" class="cancel">??????</a>
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
    </c:when>
    <c:otherwise>
    	<script>
    	alert("????????? ???????????????.");
    	location.href = "http://localhost:9000/space/index.do";
    	</script>
    </c:otherwise>
</c:choose>