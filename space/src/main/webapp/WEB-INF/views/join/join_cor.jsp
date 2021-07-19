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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
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
$(document).ready(function(){
	/* $("#doResgister").click(function(){
		if($("#name").val()==""){
			alert("성함을 입력해주세요");
			$("#name").focus();
			return false;
		}else if($("#id").val()==""){
			alert("이메일을 선택해주세요");
			$("#id").focus();
			return false;
		}else if($("#pass").val()==""){
			alert("비밀번호를 입력해주세요");
			$("#pass").focus();
			return false;
		}else if($("#cpass").val()==""){
			alert("비밀번호 확인을 선택해주세요");
			$("#cpass").focus();
			return false;
		}else if($("#hp").val() == ""){
			alert("휴대폰 번호를 입력해주세요");
			$("#hp").focus();
			return false;
		}else if($("#tname").val() == ""){
			alert("대표자명을 입력해주세요");
			$("#tname").focus();
			return false;
		}else if($("#cname").val() == ""){
			alert("상호명을 입력해주세요");
			$("#cname").focus();
			return false;
		}else if($("#cnum1").val() == ""){
			alert("사업자 번호를 입력해주세요");
			$("#cnum1").focus();
			return false;
		}else if($("#cnum2").val() == ""){
			alert("사업자 번호를 입력해주세요");
			$("#cnum2").focus();
			return false;
		}else if($("#cnum3").val() == ""){
			alert("사업자 번호를 입력해주세요");
			$("#cnum3").focus();
			return false;
		}else if($("#caddr1").val() == ""){
			alert("사업자 주소를 입력해주세요");
			$("#caddr1").focus();
			return false;
		}else if($("#caddr2").val() == ""){
			alert("사업자 주소를 입력해주세요");
			$("#caddr2").focus();
			return false;
		}else if($("#chp").val() == ""){
			alert("대표번호를 입력해주세요");
			$("#chp").focus();
			return false;
		}else{
			join_form.submit();
		}
	}); */
	
}
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
				<form name="join_form" action="join_cor_proc.do" method="post"
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
											<input type="text" name="cnum1" id="cnum1"> - <input
												type="text" name="cnum2" id="cnum2"> - <input
												type="text" name="cnum3" id="cnum3">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">사업자주소</div>
									<div class="join_write_list_s">
										<div class="normal_ipt_box join_write_addr">
											<input type="text" name="caddr1" placeholder="주소" id="caddr1" title="주소">
										</div>
										<button class="join_address_btn" type="button" onclick="execDaumPostcode()" id="findAddress">주소검색</button>
										<div class="normal_ipt_box join_write_addr_margin">
											<input type="text" name="caddr2" id="caddr2" title="상세주소">
										</div>
									</div>
								</li>
								<li>
									<div class="join_write_list_f">사업자등록증</div> <input type="file"
									name="clic" class="bb_ipt_file "><!-- hidden -->
									<!-- <button class="join_file_btn" type="button" id="joinFile">첨부파일</button>
									<span class="join_write_list_s_filetext bb_file_txt"></span> -->
								</li>
								<li>
									<div class="join_write_list_f">대표번호</div>
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
									required><!-- hidden -->
									<!-- <button class="check_box_btn" type="button"
										title="이용약관 및 개인정보 처리방침 동의 체크"></button> --> <a
									class="join_cont_check_list_text" href="#">이용약관 및 개인정보 처리방침
										동의</a> <span class="red">(필수)</span></li>
								<li><input type="checkbox" name="agree_notify" value="1"
									class="check_box_input" title="이용약관 및 개인정보 처리방침 동의 체크"
									required> <!-- hidden -->
									<!-- <button class="check_box_btn" type="button"
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
						<input id="doResgister" type="submit" value="회원가입">
					</div>
				</form>
				<div id="layer"
					style="display: none; position: fixed; overflow: hidden; z-index: 100; -webkit-overflow-scrolling: touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
			</div>
		</div>
	</div>
	<!-- container end -->
	<!-- 약관 -->
<!-- 	<div class="more_pop">
		<p class="more_pop_tit">이용약관</p>
		<div>
			<ul>
				<li>
					<p class="more_pop_text"></p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="" 맑은="" 고딕";"="">이용약관</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">시행일자 : 2018년 11월
							1일</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 1 조 (목적)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">이 약관은 주식회사
							회의실닷컴("회사")이 제공하는 회의실닷컴(<span
							style="border: 1pt none windowtext; padding: 0cm;"><a
								href="http://www.spacecloud.kr/" style="outline: none;">https://www.<span
									lang="EN-US">회의실.com</span></a></span>) 온라인 서비스(이하 “서비스”라고 합니다.)의 이용과 관련하여
							회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
						</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 2 조 (정의)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">이 약관에서 사용하는 용어의
							정의는 다음과 같습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>서비스"라 함은 유휴 공간(이하 “공간”) 정보의 공유 및
							예약을 위하여 “회사”가 회의실닷컴을 통해 제공하는 온라인 서비스를 말합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>사이트”라 함은 “회사” 가 “서비스”를 운영하는
							웹사이트를 의미하며, 현재는 (<span lang="EN-US"
							style="border: 1pt none windowtext; padding: 0cm;"><a
								href="http://www.xn--3v4bl5fu7p.com/" style="outline: none;">www.회의실.com</a></span><span
							lang="EN-US" style="">)&nbsp;</span>입니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3.&nbsp;</span>회사의 "서비스"에 접속하여 이 약관에 따라
							"회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객은 서비스 이용목적에 따라 “게스트회원”과
							“호스트회원”으로 구분됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">A.&nbsp;</span>게스트회원: 이 약관에 따라 “회사”와 이용계약을
							체결하고 “회사”가 제공하는 “서비스”를 이용하여 호스트 회원의 공간 및 컨텐츠를 사용하는 “회원”을 말합니다. 이하
							이 약관에서 “회원”이라 함은 “게스트회원”을 말합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">B.&nbsp;</span>호스트회원: “회의실닷컴 호스트 이용약관”에 따라
							“회사”와 이용계약을 체결하고 “회사”가 제공하는 “서비스”를 통해 “공간” 및 컨텐츠를 제공하거나 제안할 수 있는
							회원을 말합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어
							"서비스”에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을
							말하며, "회원"이 “서비스”를 통해 이용한 “공간”의 이용후기를 포함합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 3 조 (약관의 게시와
							개정)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록
							“서비스” 초기 화면에 게시합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "약관의 규제에 관한 법률", "정보통신망
							이용촉진 및 정보보호등에 관한 법률(이하 "정보통신망법")" 등 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할
							수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"가 이 약관을 개정할 경우에는 적용일자 및 개정사유를
							명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 7일 전부터 적용일자 전일까지 공지합니다. 다만
							“회원”에게 불리한 개정인 경우 30일 전부터 적용일자 전일까지 변경 사항을 공지하며, 공지 외에도 “회원”이 등록한
							전자우편, “서비스” 로그인 시 동의창 등의 전자적 수단을 통해 따로 명확히 통지합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. “</span>회사”가 전항에 따라 개정약관을 공지 또는 통지하면서
							“회원”에게 개정약관의 공지기간 내에 거부의 의사표시를 하지 않으면 승낙의 의사표시가 표명된 것으로 본다는 뜻을
							명확하게 공지 또는 통지하였음에도 “회원”이 명시적으로 거부의 의사표시를 하지 아니한 경우 “회원”이 개정약관에
							동의한 것으로 봅니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5. “</span>회원”이 개정약관의 적용에 동의하지 않는 경우 “회사”는
							개정약관의 내용을 적용할 수 없으며, 이 경우 “회원”은 이용계약을 해지할 수 있습니다. 다만, 기존약관을 적용할 수
							없는 특별한 사정이 있는 경우에는 “회사”는 이용계약을 해지할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 4 조 (약관의 해석)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 “공간”의 이용 및 예약, 취소, 환불 등에 관한
							구체적인 사항을 별도의 이용정책으로 둘 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2.&nbsp;</span>이 약관 또는 이용정책에서 정하지 아니한 사항이나
							해석에 관하여는 관련 법령 또는 상관례에 따릅니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 5 조 (이용계약 체결)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1.&nbsp;</span>이용계약은 "예약"을 하고자 하는 자(이하
							"예약신청자")가 이 약관의 내용에 대하여 동의를 한 다음 예약신청을 하고 "회사"가 이러한 신청에 대하여
							승낙함으로써 체결됩니다. “회사”는 이용계약이 체결되면 “회원”의 성명, 연락처, 전자우편주소를 제공받아 보관하며,
							“서비스” 제공 목적 범위 내에서 이를 “호스트회원”에게 제공할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "예약신청자"의 신청에 대하여 "서비스" 이용을
							승낙할 수 있습니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을
							해지할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">A. “</span>예약신청자”가 이 약관에 의하여 이전에 회원자격을 상실한
							적이 있는 경우. 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">B.&nbsp;</span>실명이 아니거나 타인의 명의를 이용한 경우.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">C.&nbsp;</span>허위의 정보를 기재하거나, "회사"가 요구하는
							내용을 기재하지 않은 경우.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">D.&nbsp;</span>만19세 미만의 미성년자가 법정대리인의 동의 없이
							신청하는 경우.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">E. “</span>예약신청자”의 귀책사유로 인하여 승인이 불가능하거나 기타
							규정한 제반 사항을 위반하며 신청하는 경우.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3.&nbsp;</span>제1항에 따른 예약신청에 있어 "회사"는 전문기관을
							통한 실명확인 및 본인인증을 요청할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회사"는 “서비스” 관련 설비의 여유가 없거나, 기술상
							또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5.&nbsp;</span>제2항과 제4항에 따라 예약신청의 승낙을 하지
							아니하거나 유보한 경우, "회사"는 원칙적으로 이를 예약신청자에게 알리도록 합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">6.&nbsp;</span>이용계약의 성립 시기는 "회사"가 예약완료를
							신청절차 상에서 표시한 시점으로 합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">7. “</span>회사”는 “회원”에 대하여 “영화 및 비디오물의 진흥에
							관한 법률” 및 “청소년보호법” 등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 6 조 (회원정보의 변경)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">“</span>회원”은 예약신청 시 기재한 사항이 변경되었을 경우
							“회의실닷컴”의 예약 이메일, 유선을 통하여 수정하여야 합니다. “회원”이 변경사항을 수정하지 아니하여 발생한
							불이익에 대하여 “회사”는 책임지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 7 조 (개인정보보호 의무)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라
							"회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련 법령 및 "회사"의
							개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이
							적용되지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회사”가 개인정보의 보호를 위하여 상당한 주의를
							기울였음에도 불구하고, “호스트회원”이 관련 법령 및 “회의실닷컴 호스트 이용약관”을 위반하여 “회원”의 개인정보를
							유출 또는 유용한 경우 “회사”는 그에 대하여 아무런 책임을 부담하지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 8 조 ("회원"에 대한
							통지)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도
							규정이 없는 한 예약신청 시 기재한 전자우편주소 등으로 할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "회원" 전체에 대한 통지의 경우 7일 이상
							"회사"의 공지게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 9 조 ("회사"의 의무)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 관련 법령과 이 약관이 금지하거나 미풍양속에
							반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록
							개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 “서비스” 이용과 관련하여 발생하는 “회원”의
							불만 또는 피해구제요청을 적절하게 처리할 수 있도록 필요한 인력 및 시스템을 구비합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회사"는 서비스이용과 관련하여 "회원"으로부터 제기된
							의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는
							게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 10 조 ("회원"의 의무)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회원"은 다음 행위를 하여서는 안 됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">A.&nbsp;</span>공간 예약 신청 또는 변경 시 허위내용의 등록</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">B.&nbsp;</span>타인의 정보도용</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">C. “</span>회사"가 게시한 정보의 변경</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">D. "</span>회사"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의
							송신 또는 게시</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">E. "</span>회사"와 기타 제3자의 저작권 등 지식재산권에 대한 침해</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">F. “</span>회사" 및 기타 제3자의 명예를 손상시키거나 업무를
							방해하는 행위</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">G.&nbsp;</span>외설 또는 폭력적인 메시지, 화상, 음성, 기타
							공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">H. “</span>회사”의 동의 없이 영리를 목적으로 "서비스"를 사용하는
							행위</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">I.&nbsp;</span>기타 불법적이거나 부당한 행위</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회원"은 관련 법령, 이 약관의 규정, 이용정책 및
							"서비스"와 관련하여 공지한 주의사항, "회사"가 통지하는 사항 등을 준수하여야 하며, 기타 "회사"의 업무에
							방해되는 행위를 하여서는 안 됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 11 조 ("서비스"의 제공
							등)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. “</span>회사”가 “회원”에게 제공하는 “서비스”는 아래 각호와
							같습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">A.&nbsp;</span>공간 검색 서비스</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">B.&nbsp;</span>공간 예약 서비스</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">C.&nbsp;</span>결제 서비스 (“호스트회원”이 결제 진행이 불가한
							경우에만 적용)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">D.&nbsp;</span>게시판 및 이용후기 등록 서비스</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">E.&nbsp;</span>기타 "회사"가 추가 개발하거나 다른 회사와의
							제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회사”는 "서비스"를 일정범위로 분할하여 각 범위 별로
							이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및
							고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우
							"회사"는 제8조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "회사"가 사전에 통지할 수
							없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회사"는 “서비스”의 제공에 필요한 경우 정기점검을 실시할
							수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 12 조 ("서비스"의
							변경)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 운영상, 기술상 상당한 이유가 있는 경우 제공하고
							있는 “서비스”의 전부 또는 일부를 변경할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회사”는 "서비스"의 내용, 이용방법, 이용시간에 대하여
							변경이 있는 경우 변경사유, 변경될 “서비스”의 내용 및 제공일자 등을 그 변경 전에 해당 “서비스” 초기화면에
							게시합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 무료로 제공되는 “서비스”의 일부 또는 전부를
							회사의 정책 및 운영상 필요에 따라 수정, 중단, 변경할 수 있으며, 이에 대하여 관련 법령에 특별한 규정이 없는 한
							"회원"에게 별도의 보상을 하지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 13 조 (정보의 제공 및
							광고의 게재)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는
							다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련 법령에
							따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수
							있습니다. 이때 “회원”의 수신거절로 인하여 “회원”이 필요한 정보를 제공받지 못한 경우 그에 대하여 “회사”는
							책임이 없습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회사”가 제1항의 정보를 전화 및 모사전송기기에 의하여
							전송하려고 하는 경우 “회사”는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및
							고객문의 등에 대한 회신은 “회원”의 사전 동의 없이 전송할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 "서비스"의 운영과 관련하여 “서비스” 화면,
							홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을
							"회사"에게 할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 14 조 ("게시물"의
							저작권 및 관리)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당
							“게시물”의 저작자에게 귀속됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과
							내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제,
							편집되어 게시될 수 있습니다. 이 경우, “회사”는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는
							"서비스" 내 관리기능을 통해 해당 “게시물”에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 제2항 이외의 방법으로 "회원"의 "게시물"을
							이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회원"은 “서비스”에서 제3자의 권리를 침해해서는 아니
							되며, “회원”의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련 법령에 위반되는 내용을 포함하는 경우 관련
							권리자는 관련 법령이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 “회사”에 요청할 수 있으며,
							"회사"는 관련 법령에 따라 조치를 취할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5. "</span>회사"는 전항에 따른 권리자의 요청이 없는 경우라도
							권리침해가 인정될 만한 사유가 있거나 기타 “회사” 정책 및 관련 법령에 위반되는 경우에는 관련 법령에 따라 해당
							"게시물"에 대해 임시조치, 삭제 등을 취할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 15 조 (권리의 귀속)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>서비스"에 대한 저작권 및 지식재산권은 "회사"에
							귀속됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "회원"에게 "회사"가 정한 이용조건에 따라
							“서비스”를 이용할 수 있는 이용권만을 부여하며, "회원"은 “아이디” 등에 관하여 양도, 판매, 담보제공 등의
							처분행위를 할 수 없습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 16 조 (계약해제, 해지
							등)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회원"이 이용계약을 해지할 경우, 관련 법령 및
							개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는
							소멸됩니다. 다만 "회원"이 이용계약을 해지하는 경우에도 “회원”이 게시판에 등록한 "게시물"은 자동으로 삭제되지
							않으니 이용계약 해지 전 “게시물”을 삭제하시기 바랍니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회원”은 이용계약 해지 신청일로부터 90일 내에 공간 사용
							신청이 확정되어 있는 경우에는 해지할 수 없으므로, 사전에 해당 신청을 취소하여야 합니다. “회원”이 공간 사용
							신청을 취소하지 않을 경우 “회사”는 제1항에도 불구하고 “회원”의 이용계약 해지 요청을 거절할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 17 조 (공간의 예약 및
							취소 등)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. “</span>서비스”에 등록된 “공간”을 예약하고자 하는 “회원”은
							“서비스”에서 제공하는 방법에 따라 신청하고, “호스트회원”이 “서비스”상에서 이를 승낙함으로써 “공간” 예약이
							완료됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. “</span>회사”는 등록된 “공간” 사용의 상세 조건에 대해서 어떠한
							보증을 하지 않습니다. “회원”은 “공간”을 예약하기 전에 반드시 작성한 “공간” 사용의 상세 조건을 정확하게
							확인해야 합니다. 이를 확인하지 않고 예약하여 발생한 모든 손실과 손해는 “회원”에게 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3.&nbsp;</span>선택에 따라 “공간”에 대한 이용대금 사전 결제가
							필수인 “공간”을 “회원”이 예약하고자 하는 경우 “회원”은 신용카드 등 “회사”가 지정하는 결제수단을 통해
							“공간”에 대한 이용대금을 사전에 결제하여야 “공간”에 대한 예약이 완료됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">미성년자인 “회원”이 “공간”을
							예약한 경우 그 법정대리인이 동의하지 않으면 “회원” 본인 또는 법정대리인이 이를 취소할 수 있으며, 미성년자의
							거래에 관한 상세한 사항은 관련 법령이 정하는 바에 따릅니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5. “</span>회사”는 “서비스”에서 “회원”과 “호스트회원” 간
							“공간” 예약이 완료되면 “회원”에게 이를 통지합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">6. “</span>서비스”에 등록된 “공간” 예약은 청약철회가 가능한 경우와
							청약철회가 제한되는 경우로 구분되며, 청약철회 가능 여부는 이 약관이나 이용정책 또는 “공간”의 상세 조건에서
							안내됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">7.&nbsp;</span>청약철회가 가능한 “공간”을 예약한 “회원”은 본
							조 제6항의 통지를 받은 날로부터 7일 이내에 “회사”의 고객센터를 통하여 청약철회를 할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">8. “</span>회원”은 전항의 청약철회 기간이 경과되거나 전자상거래
							등에서의 소비자 보호에 관한 법률 등 관련 법령에서 정한 청약철회 제한 사유에 해당하는 “공간” 예약에 대해서는
							청약철회를 할 수 없습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">9. “</span>회원”이 청약철회 기간 경과 후 또는 청약철회 제한 사유에
							해당함에도 불구하고 “회사” 및 “호스트회원”의 책임 없는 사유를 이유로 예약의 취소를 요청하는 경우 “공간”의
							상세조건 또는 이용정책 등에서 사전에 안내된 취소수수료가 부과될 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">10. “</span>호스트회원”의 귀책사유로 “회원”이 “공간” 사용일에
							“공간”을 정상적으로 사용하지 못한 경우 “호스트회원”이 그에 관한 모든 책임을 부담하며, “회사”는 이에 관한
							책임을 지지 않습니다. “회사”는 통신판매중개시스템의 제공자로서 통신판매의 당사자가 아니므로 “서비스” 내에서
							“호스트회원”과 “회원” 간에 발생한 “공간”의 예약, 결제, 취소, 환불 관련 분쟁에 대하여 책임을 지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 18 조 (이용제한 등)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 "회원"이 이 약관의 의무를 위반하거나
							"서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지, 이용계약해지 등으로 "서비스" 이용을
							단계적으로 제한할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 전항에도 불구하고, "주민등록법"을 위반한
							명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해,
							"정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련 법령을 위반한
							경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 기타 혜택
							등도 모두 소멸되며, "회사"는 이에 대해 별도로 보상하지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 "회원"이 계속해서 3개월 이상 서비스를 이용하지
							않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회사"는 본 조의 이용제한의 범위에 대한 구체적인 사항은
							이용정책에서 정합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5.&nbsp;</span>본 조에 따라 "서비스" 이용을 제한하거나 계약을
							해지하는 경우에는 "회사"는 제9조["회원"에 대한 통지]에 따라 통지합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">6. "</span>회원"은 본 조에 따른 이용제한 등에 대해 "회사"가 정한
							절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "회사"가 인정하는 경우 "회사"는 즉시
							"서비스"의 이용을 재개합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 19 조 (책임제한)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여
							"서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의
							장애에 대하여는 책임을 지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3. "</span>회사"는 "회원" 및 “호스트회원”이 "서비스"와 관련하여
							게재한 “게시물”, 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">4. "</span>회사"는 "회원" 간 또는 "회원"과 제3자 상호간에
							"서비스"를 매개로 하여 이루어진 거래에 관하여는 책임을 지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">5. "</span>회사"는 무료로 제공되는 서비스 이용과 관련하여 관련
							법령에 특별한 규정이 없는 한 책임을 지지 않습니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">제 20 조 (준거법 및
							재판관할)</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">1. "</span>회사"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로
							합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">2. "</span>회사"와 "회원"간 발생한 분쟁에 관한 소송은 제소 당시의
							"회원"의 주소를 관할하는 지방법원을 전속관할로 하고, 주소가 없는 경우 거소를 관할하는 지방법원의 전속관할로
							합니다. 단, 제소 당시 "회원"의 주소 또는 거소가 명확하지 아니한 경우의 관할법원은 민사소송법에 따라 정합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"=""><span
							lang="EN-US" style="">3.&nbsp;</span>해외에 주소나 거소가 있는 "회원"의 경우
							"회사"와 "회원"간 발생한 분쟁에 관한 소송은 전항에도 불구하고 대한민국 서울중앙지방법원을 관할법원으로 합니다.</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">&nbsp;</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="font-family:" 맑은="" 고딕";"="">부칙</span>
					</p>
					<p class="MsoNoSpacing"
						style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px;">
						<span style="" 맑은="" 고딕";"="">이 약관은 2018년 11월 01일부터 적용됩니다.</span>
					</p>
					<p></p>
				</li>
			</ul>
		</div>
		<a class="more_pop_closebtn" href="javascript:void(0);" title="팝업닫기"><img
			src="/pc/images/more_pop_closebtn_img.png" alt=""></a>
	</div>
 -->
	<!-- footer -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>