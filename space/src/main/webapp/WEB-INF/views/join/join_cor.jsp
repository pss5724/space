<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/join.css">
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
				<form name="join_form" action="join_proc.do" method="post"
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
										<span>*</span> 아이디
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="id" class="i1" id="id">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 이메일
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="email" class="i1" id="email">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 비밀번호
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="password" name="pass" class="i1" id="pass">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 비밀번호
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="password" name="cpass" class="i1" id="cpass"
												onblur="passCheck()">
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
											<input type="text" name="hp" class="i1" id="hp">
										</div>
										<button type="button" class="btn_hp" id="hpcheck">휴대폰
											인증</button>
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
											<input type="text" name="president" class="i1" id="president">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 상호명
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="cname" class="i1" id="cname">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">
										<span>*</span> 사업자 번호
									</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="crn1" id="crn1"> - <input
												type="text" name="crn2" id="crn2"> - <input
												type="text" name="crn3" id="crn3">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">사업자주소</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box join_write_addr">
											<input type="text" name="address1" class="i1" id="address1"
												title="주소">
										</div>
										<button class="join_address_btn" type="button"
											id="findAddress">주소검색</button>
										<div class="normal_ipt_box join_write_addr_margin">
											<input type="text" name="address2" id="address2" title="상세주소">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">사업자등록증</div> <input type="file"
									name="file1" class="hidden">
									<button class="join_file_btn" type="button" id="joinFile">첨부파일</button>
								</li>
								<li>
									<div class="join_write_list_f">대표번호</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box">
											<input type="text" name="tel" id="tel">
										</div>
									</div>
								</li>
							</ul>
						</div>
						<div class="join_content_box">
							<ul class="join_content_check_list">
								<li><input type="checkbox" name="agree_privacy" value="1"
									class="hidden check_box_input" title="이용약관 및 개인정보 처리방침 동의 체크"
									required>
									<button class="check_box_btn" type="button"
										title="이용약관 및 개인정보 처리방침 동의 체크"></button> <a
									class="join_cont_check_list_text" href="#">이용약관 및 개인정보 처리방침
										동의</a> <span class="red">(필수)</span></li>
								<li><input type="checkbox" name="agree_notify" value="1"
									class="hidden check_box_input" title="이용약관 및 개인정보 처리방침 동의 체크"
									required>
									<button class="check_box_btn" type="button"
										title="이용약관 및 개인정보 처리방침 동의 체크"></button>
									<p class="join_cont_check_list_text" href="#">이벤트 등 프로모션 알림</p>
									<span>(선택)</span>
									<p
										style="color: red; font-size: 14px; line-height: 20px; letter-spacing: -1px; padding-left: 25px;">※
										동의해주신 회원님들께는 다양한 이벤트와 혜택이 제공됩니다.</p></li>
							</ul>
						</div>
					</div>
						<div class="join_btn_box">
							<button id="doResgister" type="button">회원가입</button>
						</div>
				</form>
			</div>
		</div>
	</div>
	<!-- container end -->

	<!-- footer -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>