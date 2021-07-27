<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.myspace.vo.SessionVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/join.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					/*사용자가 도로명 주소를 선택했을 때 추가적으로 입려되어야 할 정보를 참고 항목필드에 입력되도록*/
					// document.getElementById("sample6_extraAddress").value = extraAddr;
					/*주소가 입력되는 필드에 추가 항목 피드에 입력될 정보를 함께 입력*/
					addr += extraAddr;

				} else {
					/*추가 항목 필드에 아무것도 입력되지 않게 하기 위한 코드*/
					//document.getElementById("sample6_extraAddress").value = '';
					/*추가항목 필드가 필요없기 때문에 제거*/
					addr += '';

				}

				/* 우편번호와 주소 정보를 해당 필드에 넣는다.*/
				//document.getElementById('sample6_postcode').value = data.zonecode;   //우편번호
				document.getElementById("caddr1").value = addr;
				// $(".caddr1").val(addr);
				/* 커서를 상세주소 필드로 이동한다. */
				document.getElementById("caddr2").focus();
				/* 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동 */
				// $(".caddr2").attr("readonly",false);
				// $(".caddr2").focus();
			}
		}).open();
	}
</script>
<script>
	$(document).ready(function() {
		
		$("#doResgister").click(function() {
			if ($("#name").val() == "") {
				alert("성함을 입력해주세요");
				$("#name").focus();
				return false;
			} else if ($("#id").val() == "") {
				alert("이메일을 선택해주세요");
				$("#id").focus();
				return false;
			} else if ($("#pass").val() == "") {
				alert("비밀번호를 입력해주세요");
				$("#pass").focus();
				return false;
			} else if ($("#cpass").val() == "") {
				alert("비밀번호 확인을 선택해주세요");
				$("#cpass").focus();
				return false;
			} else if ($("#hp").val() == "") {
				alert("휴대폰 번호를 입력해주세요");
				$("#hp").focus();
				return false;
			} else if ($("#tname").val() == "") {
				alert("대표자명을 입력해주세요");
				$("#tname").focus();
				return false;
			} else if ($("#cname").val() == "") {
				alert("상호명을 입력해주세요");
				$("#cname").focus();
				return false;
			} else if ($("#cnum1").val() == "") {
				alert("사업자 번호를 입력해주세요");
				$("#cnum1").focus();
				return false;
			} else if ($("#cnum2").val() == "") {
				alert("사업자 번호를 입력해주세요");
				$("#cnum2").focus();
				return false;
			} else if ($("#cnum3").val() == "") {
				alert("사업자 번호를 입력해주세요");
				$("#cnum3").focus();
				return false;
			} else if ($("#caddr1").val() == "") {
				alert("사업자 주소를 입력해주세요");
				$("#caddr1").focus();
				return false;
			} else if ($("#caddr2").val() == "") {
				alert("사업자 주소를 입력해주세요");
				$("#caddr2").focus();
				return false;
			} else if ($("#chp").val() == "") {
				alert("대표번호를 입력해주세요");
				$("#chp").focus();
				return false;
			} else {
				join_form.submit();
			}
			
		});
	});
</script>

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
				<form name="join_form" action="join_cor_proc.do"  method="POST" enctype="multipart/form-data"
					class="content_layout">
					<div class="join_box">
						<div class="join_tit_box">
							<p class="join_tit">기업 회원가입</p>
							<p class="join_stit">회원가입을 위한 정보를 입력해주세요.</p>
						</div>
						<div class="join_content_box">
							<ul class="join_write_list">
								<li>
									<div class="join_write_list_f">
										<span>*</span> 이름
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="name" placeholder="이름" class="i1"
												id="name">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 이메일
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="id" placeholder="이메일" class="i1"
												id="id">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 비밀번호
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="password" name="pass" placeholder="비밀번호"
												class="i1" id="pass">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 비밀번호 확인
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="password" name="cpass" placeholder="비밀번호 확인"
												class="i1" id="cpass" onblur="passCheck()">
											<div id="msg"></div>
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 휴대폰
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box join_write_hp">
											<input type="text" name="hp" placeholder="휴대폰 번호" class="i1"
												id="hp">
											<!-- <button type="button" class="btn_hp" id="hpcheck">휴대폰
											인증</button> -->
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="join_content_box">
							<ul class="join_write_list">
								<li>
									<div class="join_write_list_f">
										<span>*</span> 대표자명
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="tname" placeholder="대표자명" class="i1"
												id="tname">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 상호명
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="cname" placeholder="상호명" class="i1"
												id="cname">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 사업자 번호
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box type02">
											<input type="text" name="cnum1" id="cnum1">
										</div>
										<span class="normal_ipt_middle_span">-</span>
										<div class="normal_ipt_box type02">
											<input type="text" name="cnum2" id="cnum2">
										</div>
										<span class="normal_ipt_middle_span">-</span>
										<div class="normal_ipt_box type02">
											<input type="text" name="cnum3" id="cnum3">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f"><span>*</span> 사업자주소</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box join_write_addr">
											<input type="text" name="caddr1" placeholder="주소" id="caddr1"
												title="주소">
										</div>
										<button class="join_address_btn" type="button"
											onclick="execDaumPostcode()" id="findAddress">주소검색</button>
										<div class="normal_ipt_box join_write_addr_margin">
											<input type="text" name="caddr2" id="caddr2" title="상세주소">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f"><span>*</span> 사업자등록증</div> <input type="file"
									name="file1" class="bb_ipt_file" id="clic">
								<!-- hidden --> <!-- <button class="join_file_btn" type="button" id="joinFile">첨부파일</button>
									<span class="join_write_list_s_filetext bb_file_txt"></span> -->
								</li>
								<li>
									<div class="join_write_list_f"><span>*</span> 대표번호</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="chp" placeholder="대표번호 입력" id="chp">
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="join_content_box">
							<ul class="join_content_check_list">
								<li><input type="checkbox" name="agree_privacy" value="1"
									class="check_box_input " title="이용약관 및 개인정보 처리방침 동의 체크"
									required>
								<!-- hidden --> <!-- <button class="check_box_btn" type="button"
										title="이용약관 및 개인정보 처리방침 동의 체크"></button> --> <a
									class="join_cont_check_list_text" href="#">이용약관 및 개인정보 처리방침
										동의</a> <span class="red">(필수)</span></li>
								<li><input type="checkbox" name="agree_notify" value="1"
									class="check_box_input" title="이용약관 및 개인정보 처리방침 동의 체크" required>
									<!-- hidden --> <!-- <button class="check_box_btn" type="button"
										title="이용약관 및 개인정보 처리방침 동의 체크"></button> -->
									<p class="join_cont_check_list_text" href="#">이벤트 등 프로모션 알림</p>
									<span>(선택)</span>
									<p
										style="color: red; font-size: 14px; line-height: 20px; letter-spacing: -1px; padding-left: 25px;">※
										동의해주신 회원님들께는 다양한 이벤트와 혜택이 제공됩니다.</p></li>
							</ul>
						</div>
					</div>
					<div class="join_btn_box">
						<!-- <button id="doResgister" type="button">회원가입</button> -->
						<input id="doResgister" type="submit"  value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- footer -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>