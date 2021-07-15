<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/notice.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script>
		$(function(){
			var selectTit = '.cus_slectbox_tit',
				selectList = '.cus_slectbox_list',
				selectHidden = '.hidden_select';

			$('.cus_slectbox_tit a').on('click', function(){
				if($(this).parent().hasClass('on')){
					$(this).parent(selectTit).siblings(selectList).slideUp(500);
					$(this).parent().removeClass('on');
				} else {
					$(this).parent(selectTit).siblings(selectList).slideDown(500);
					$(this).parent().addClass('on');
				}
			});
			$('.cus_slectbox_list a').on('click', function(){
				var targetIdx = $(this).parent('li').index();
				var thisText = $(this).html();
				$(this).parents(selectList).siblings(selectTit).find('a').html(thisText);
				$(this).parents(selectList).siblings(selectHidden).find('option').eq(targetIdx).prop('selected', true);
				$(this).parents(selectList).slideUp(500);
				$(this).parents(selectList).siblings(selectTit).removeClass('on');
				$(this).closest('form').submit();
			});

			$('.faq_content_btn').on('click', function(){
				if($(this).hasClass('on')){
					$(this).removeClass('on');
					$(this).next('.faq_content_text').slideUp(250);
				} else {
					$(this).addClass('on');
					$(this).next('.faq_content_text').slideDown(250);
				}
			});
		});
	</script>
<style>
/*  자주 묻는 질문{ */
			.cus_slectbox {
				position:relative;
				display:inline-block;
				vertical-align:top;
				margin-right:10px;
			}
			.hidden_select {
				position:absolute;
				visibility:hidden;
			}
			.cus_slectbox_tit a {
				position:relative;
				display:block;
				box-sizing:border-box;
				width:150px;
				height:45px;
				padding:0 30px 0 10px;
				border:1px solid #d7d7d7;
				font-family:"nanumsquare-r";
				font-size:14px;
				line-height:43px;
				color:#252626;
				background:#ffffff;
				border-radius:3px;
				text-align:left;
			}
			.cus_slectbox_tit a:after {
				content:'열기';
				overflow:hidden;
				display:block;
				width:16px;
				height:9px;
				margin-top:-5px;
				position:absolute;
				top:50%;
				right:10px;
				text-indent:-9999px;
				background:url('http:localhost:9000/space/images/cus_slectbox_tit_off.png') no-repeat left top;
			}
			.cus_slectbox_tit.on a:after {
				content:'닫기';
				-webkit-transform:rotate(180deg);
				-moz-transform:rotate(180deg);
				-ms-transform:rotate(180deg);
				-o-transform:rotate(180deg);
				transform:rotate(180deg);
			}
			.cus_slectbox_list {
				display:none;
				width:100%;
				max-height:136px;
				overflow-y:auto;
				position:absolute;
				top:45px;
				left:0;
				-webkit-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.1);
				-moz-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.1);
				box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.1);
				background:#ffffff;
				z-index:1;
			}
			.cus_slectbox_list li {
				padding:10px 16px;
			}
			.cus_slectbox_list li:first-child {
				padding:20px 16px 10px;
			}
			.cus_slectbox_list li:last-child {
				padding:10px 16px 20px;
			}
			.cus_slectbox_list a {
				display:block;
				font-size:14px;
				line-height:14px;
				color:#111111;
				text-align:left;
			}

			.faq_box {
				border-top:2px solid #2d8ee6;
			}
			.faq_content + .faq_content {
				border-top:1px solid #d7d7d7;
			}
			.faq_content_btn {
				position:relative;
				box-sizing:border-box;
				display:block;
				width:100%;
				padding:24px 50px 24px 75px;
				font-size:18px;
				line-height:26px;
				color:#030303;
				text-align:left;
				border:none;
				background:#ffffff;
				letter-spacing:-1px;
			}
			.faq_content_btn:before {
				content:'Q';
				display:block;
				width:34px;
				height:34px;
				margin-top:-17px;
				border-radius:50%;
				font-size:20px;
				line-height:34px;
				color:#ffffff;
				background:#008aff;
				text-align:center;
				position:absolute;
				top:50%;
				left:20px;
			}
			.faq_content_btn:after {
				content:'열기';
				display:block;
				overflow:hidden;
				text-indent:-9999px;
				width:16px;
				height:9px;
				margin-top:-5px;
				background:url('http:localhost:9000/space/images/faq_content_btn_off.png') no-repeat left top;
				position:absolute;
				top:50%;
				right:31px;
			}
			.faq_content_btn.on:after {
				content:'닫기';
				background:url('http:localhost:9000/space/images/faq_content_btn_on.png') no-repeat left top;
			}

			.faq_content_text {
				display:none;
				position:relative;
				padding:16px 50px 16px 75px;
				font-family:"nanumsquare-r";
				font-size:16px;
				line-height:32px;
				color:#030303;
				border-top:1px solid #d7d7d7;
				background:#f6f6f6;
				white-space:pre-line;
				word-break:break-word;
				letter-spacing:-1px;
			}
			.faq_content_text:before {
				content:'A';
				display:block;
				width:34px;
				height:34px;
				border-radius:50%;
				font-size:20px;
				line-height:34px;
				color:#ffffff;
				background:#8f8f8f;
				text-align:center;
				position:absolute;
				top:16px;
				left:20px;
			}
/* } 자주 묻는 질문 */

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
			<!-- s sub_visual -->
		<div class="sub_visual usercenter">
			<h3 class="type02">자주묻는 질문
				<span>고객님께서 자주 하는 질문을 빠르게 찾을 수 있습니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_tab -->
	<div class="sub_tab_box">
		<ul class="sub_tab">
			<li><a href="http://localhost:9000/space/notice.do?rpage=1">공지사항</a></li>
			<li class="on"><a href="#">자주묻는 질문</a></li>
		</ul>
	</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_board01">
			<div class="center_box">
				<p class="sub_tit">자주묻는 질문</p>
				<div class="board_search_box">
					<form action="#" method="GET">
					<div class="cus_slectbox">
						<select class="hidden_select" name="q_category" id="">
							<option value="0" selected=&quot;selected&quot;>전체</option>
															<option value="1" >공통</option>
															<option value="10" >이용관련</option>
															<option value="11" >예약/결제</option>
															<option value="12" >취소/환불</option>
															<option value="13" >적립금</option>
															<option value="14" >회원 관련</option>
															<option value="15" >기타</option>
													</select>
						<p class="cus_slectbox_tit"><a href="#">전체</a></p>
						<ul class="cus_slectbox_list">
							<li><a href="#">전체</a></li>
															<li><a href="#">공통</a></li>
															<li><a href="#">이용관련</a></li>
															<li><a href="#">예약/결제</a></li>
															<li><a href="#">취소/환불</a></li>
															<li><a href="#">적립금</a></li>
															<li><a href="#">회원 관련</a></li>
															<li><a href="#">기타</a></li>
													</ul>
					</div>
					<div class="board_search_box_text"><input type="text" name="q" placeholder="검색어를 입력해주세요." title="검색어 입력" value=""><button type="submit"></button></div>
					</form>
				</div>

				<div class="faq_box">
											<div class="faq_content">
							<button class="faq_content_btn" type="button">휴대폰 인증이 되지 않습니다.</button>
							<div class="faq_content_text"><p>아래의 경우에는 휴대폰 인증이 불가할 수 있습니다.<p>+ 이미 인증된 다른 계정이 있다면 인증이 불가합니다.</p><p>+ 선블 휴대폰을 사용 중이신 경우 인증이 불가할 수 있습니다.</p><p>+ 휴대폰이 분실 또는 일시정시 (이용자의 요청/요금 미납) 상태인 경우</p><p>+ 이동통신사에 미등록된 휴대폰 (해지/미개통)인 경우</p><p>+ 인증을 시도한 휴대폰이 법인 명의로 개통된 경우 휴대폰 인증이 불가능합니다.<br>   (법인에서 이용하실 경우 관리 담당자의 실명 인증을 통해 이용해주시기 바랍니다.)</p><p>+ 본인인증 연동 모듈 사의 사정으로 인증이 불가능한 경우<br>   휴대폰 본인 인증은 24시간 가능하나, 간헐적으로 새벽시간 중 연동 모듈사의 서버 점검 등의 사요류 30분~1시간 정도 인증이 불가능한 경우가 발생할 수 있습니다.<br>   이 경우, 아래 채널로 문의하실 수 있습니다.<br>   - KCB 고객센터 : 02-708-1000</p><p><br></p><p></p></p>
</div>
						</div>
											<div class="faq_content">
							<button class="faq_content_btn" type="button">센터 방문답사는 어떻게 신청하나요?</button>
							<div class="faq_content_text"><p>회의실 예약 신청을 완료 한 후,<p><나의 회의실> 메뉴의 <예약한 회의실>에서 예약 건을 클릭하시면</p><p>우측에 <방문답사 신청>버튼을 통해 신청이 가능합니다.</p><p></p></p>
</div>
						</div>
											<div class="faq_content">
							<button class="faq_content_btn" type="button">스페이스닷컴 이용에 문의가 있어요.</button><span class="img"></span>
							<div class="faq_content_text"><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: none; line-height: 1.5em;"><span style="font-size: 1rem;">회의실닷컴 이용에 대한 자세한 문의는 회원가입 후<b> </b></span>
							<span style="font-size: 1rem; margin: 0px; padding: 0px; border: none; font-family: noto-sans-scott-m;"><b>1:1 문의</b></span><span style="font-size: 1rem;">를 통해 남겨주시면 신속하게 답변드리도록 하겠습니다.</span><br><p style="margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: none; line-height: 1.5em;"><br style="color: rgb(72, 72, 72); letter-spacing: -1px; white-space: pre-line; font-family: dotum, 돋움 !important;"></p><p>*고객센터 운영시간 : 평일 오전 9시 ~ 오후 6시 (점심시간 11:30 ~ 12:30)</p><p></p></p>
</div>
						</div>
											<div class="faq_content">
							<button class="faq_content_btn" type="button">센터 측 취소/환불 정책은 어디서 확인할 수 있나요?</button>
							<div class="faq_content_text"><p>"마이페이지 > 예약 회의실" 에서 확인하거나 회의실 찾기를 통해 센터의 세부정보를 확인할 수 있습니다.<p>규정에 명시된 취소 가능 기간은 평일 9~18시 기준입니다. *주말/공휴일 미포함*</p></p>
</div>
						</div>
											<div class="faq_content">
							<button class="faq_content_btn" type="button">예약취소 여부는 어떻게 확인할 수 있나요?</button>
							<div class="faq_content_text"><p>예약 취소시 카카오톡 알림톡으로 해당 내용을 전송해드리며, "마이페이지 > 예약 회의실"에서 내역을 확인할 수 있습니다.<br></p>
</div>
						</div>

									</div>
				<div class="content_paging">
				<a class="content_paging_prev" href="javascript:void(0);"><img src="http://localhost:9000/space/images/content_paging_left.png" alt="이전"></a>
				<ul class="content_paging_list hf_effect03">
							<li class="on "><a href="#">1</a></li>
							<li class=" "><a href="#">2</a></li>
							<li class=" "><a href="#">3</a></li>
							<li class=" "><a href="#">4</a></li>
							<li class=" "><a href="#">5</a></li>
					</ul>
							<a class="content_paging_next" href="#"><img src="http://localhost:9000/space/images/content_paging_right.png" alt="다음"></a>
				</div>

			</div>
		</div>
		<!-- e sub_section -->

	</div>
	<!-- e container -->

	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>