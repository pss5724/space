<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body{
	min-width:1280px;
	max-width:1920px;
	margin:0 auto;
	position:relative;
}
</style>
</head>
<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>
	
	<!-- content -->
		<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
		
	<!-- s main_visual -->
	<div class="visual">
		<div class="visual_box">
			<div class="main_visual_text_box">
				<div class="main_visual_text_box_logo"><img src="/pc/images/main_visual_logo.png" alt="회의실닷컴"></div>
				<p class="main_visual_text_box_text"><span>회의실의 모든 것. 비즈니스 모임공간 최저가로 한번에 비교! <br>
                        국내 최초 회의실 매칭 플랫폼</span></p>
			</div>
			<div class="main_visual_search_box">
				<label>
					<button class="main_visual_search_btn" type="button" disabled></button>
					<input id="search" class="main_visual_search_text" type="text" placeholder="지역, 역으로 검색해주세요">
				</label>
			</div>
			<!-- main_visual_slide_box01클래스 추가
                    main_visual_slide_index 감싸는 main_visual_slide_index_box div추가
                    main_visual_slide클래스 main_visual_slide01 추가
                -->
			<div class="main_visual_slide_box main_visual_slide_box01">
				<div class="main_visual_slide_control">
					<div class="main_visual_slide_index_box">
						<span class="main_visual_slide_index">01</span>
						수도권
					</div>
					<div class="main_visual_slide_nav"></div>
				</div>
				<div class="main_visual_slide main_visual_slide01 hf_effect">
																		<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11680">강남구</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11110">종로구</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11170">용산구</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11440">마포구</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11140">중구</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=bname&amp;f_value=11740">강동구</a></div>
															</div>
			</div>

			<!-- 전국용 슬라이드 추가
				main_visual_slide_box02클래스 추가
				main_visual_slide_index 감싸는 main_visual_slide_index_box div추가
				main_visual_slide클래스 main_visual_slide02 추가
				main_visual_slide02 아래 div 두번 감싸는 구조
			-->
			<div class="main_visual_slide_box main_visual_slide_box02">
				<div class="main_visual_slide_control">
					<div class="main_visual_slide_index_box">
						<span class="main_visual_slide_index">02</span>
						전국
					</div>
					<div class="main_visual_slide_nav"></div>
				</div>
				<div class="main_visual_slide main_visual_slide02 hf_effect">
																		<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=41">경기</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=28">인천</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=26">부산</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=42">강원</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=30">대전</a></div>
																								<div><a href="https://www.kmeetingroom.com/centers?filter=state&amp;f_value=50">제주</a></div>
															</div>
			</div>

		</div>
	</div>
	<!-- e main_visual -->

	<!-- s main_section01 -->
	<div class="section section01">
		<div class="section_center_box">
			<div class="main_section01_slide_box">
									<div>
						<a href="https://www.kmeetingroom.com/notices/171" >
							<img src="/_storage/banners/dK7qWq21H1a40aasSNZuu0YInYmfCxEylnlY08Ms.jpg" alt=""></a>
					</div>
									<div>
						<a href="https://www.kmeetingroom.com/video/rental" >
							<img src="/_storage/banners/KFaOcLArikVWmRR5mDvwvXsd6SeW02E25AuLxkpl.jpg" alt=""></a>
					</div>
									<div>
						<a href="https://www.kmeetingroom.com/notices/165" >
							<img src="/_storage/banners/dELPSWEY31IE7qYotj3zKzHMOiJytzD3PkpUHBhe.png" alt=""></a>
					</div>
									<div>
						<a href="https://www.kmeetingroom.com/centers?filter=conference" >
							<img src="/_storage/banners/M8ZwruRdKfvHJuJ4h8fuDsnNmkzDJWZgqTe9FH8H.png" alt=""></a>
					</div>
									<div>
						<a href="https://www.kmeetingroom.com/centers?filter=ktxsrt" >
							<img src="/_storage/banners/STokWuWFdhcYj9wIkcwz7kLvw5tAUyfCPai5AclA.png" alt=""></a>
					</div>
							</div>
		</div>
	</div>
	<!-- e main_section01 -->

	<!-- s main_section02 -->
	<div class="section section02">
		<div class="section_center_box">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>화상 회의실</span> 보유 센터</p>
				<p class="main_stit01">줌, 스카이프, 팀즈, 시스코, 폴리콤 등 화상 회의가 가능한 센터입니다.</p>
			</div>
			<div class="cont_list_div_wrap md_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="md_slider cont_list_div hf_effect02">
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/62">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/tLJGa98NdqC1rktEdwEY97aG5JozbFxctxJmnid9.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="62"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">공덕역 대형회의장</p>
									<p class="cont_list_detail_tit">마포구 3호점 (공덕동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">공덕동</li>
											<li class="subway">공덕역</li>
										</ul>
										<p class="cont_list_detail_info_m">120인실, 80인실, 50인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">65,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>4.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/15">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/gwodlXqFzuM2InkKSQTzNMqO0qcKmhhQsys43rQM.jpg') no-repeat center;background-size:cover;">
																			<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="15"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성이 뛰어난 깔끔 회의실</p>
									<p class="cont_list_detail_tit">강남구 9호점 (대치동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">대치동</li>
											<li class="subway">삼성역</li>
										</ul>
										<p class="cont_list_detail_info_m">30인실, 16인실, 10인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">66,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>3.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/9">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/Yu6s34gEIvIqhdjQCpT97YmhPsM29jDvSESOinni.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="9"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">최적의 입지 조건</p>
									<p class="cont_list_detail_tit">종로구 4호점 (청진동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">청진동</li>
											<li class="subway">종각역</li>
										</ul>
										<p class="cont_list_detail_info_m">50인실, 15인실, 12인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">44,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/53">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/zdmiiG4WdeEXEyw2aAzY8Pabkm1UrJvmDxYbyFXH.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="53"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성 및 회의실 컨디션 최상</p>
									<p class="cont_list_detail_tit">부산 연제구 1호점 (거제동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">거제동</li>
											<li class="subway">거제역</li>
										</ul>
										<p class="cont_list_detail_info_m">140인실, 81인실, 54인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">22,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/83">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/uSTq0CYc9Pv6p5LUcYAAyxYU2Amoh59WW9TjQkMH.jpg') no-repeat center;background-size:cover;">
																			<span class="cont_list_thum_cover">7월<br />
20% 할인 프로모션</span>
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="83"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">뛰어난 접근성의 화상회의실</p>
									<p class="cont_list_detail_tit">중구 9호점 (정동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">정동</li>
											<li class="subway">시청역</li>
										</ul>
										<p class="cont_list_detail_info_m">15인실, 4인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">22,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/41">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/VOVTZ4nk7xA0DZo21wiv7zNWaHl6E7cnwKIEsFNU.jpg') no-repeat center;background-size:cover;">
																			<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="41"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">여의도 IFC MALL</p>
									<p class="cont_list_detail_tit">영등포구 1호점 (여의도동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">여의도동</li>
											<li class="subway">여의도역</li>
										</ul>
										<p class="cont_list_detail_info_m">6인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">66,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>3.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/60">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/JPMZgHzbgXadssZMGntS6hOVzIGTpz4uW9p3W9CE.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="60"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">가상 스튜디오 보유 세미나실</p>
									<p class="cont_list_detail_tit">성동구 3호점 (성수동1가)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">성수동1가</li>
											<li class="subway">한양대역</li>
										</ul>
										<p class="cont_list_detail_info_m">40인실, 20인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">79,600원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/29">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/0qX7DrtqqwVMfzMtpXnqQK4VRCAxOQVPWES7Hnde.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="29"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">부부의세계, 갤럭시CF 등 50편이상 촬영. 고급스런 인테리어&amp;최신 화상회의</p>
									<p class="cont_list_detail_tit">강남구 17호점 (신사동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">신사동</li>
											<li class="subway">신사역</li>
										</ul>
										<p class="cont_list_detail_info_m">60인실, 12인실, 10인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">55,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>5.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/5">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/g829ZJObh8C2GjNr1hQi87OThbbNGkfS8pFTvhWN.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="5"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성 및 회의실 컨디션 최상</p>
									<p class="cont_list_detail_tit">종로구 1호점 (세종로)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">세종로</li>
											<li class="subway">광화문역</li>
										</ul>
										<p class="cont_list_detail_info_m">54인실, 36인실, 22인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">38,500원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/10">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/7bb9s1w75XhHyv54QEwSgFmsrupQvPauqKUU8Sc7.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="10"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">실내 인테리어가 고급스러운 회의실</p>
									<p class="cont_list_detail_tit">강남구 7호점 (삼성동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">삼성동</li>
											<li class="subway">삼성역</li>
										</ul>
										<p class="cont_list_detail_info_m">20인실, 17인실, 16인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">88,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/105">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/rsswvK8Io6P7lvSsTFOM0mPVEE4ZToGhMV3uTrDl.jpg') no-repeat center;background-size:cover;">
																			<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="105"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성 좋은 깔끔한 강의장과 회의실</p>
									<p class="cont_list_detail_tit">서초구 4호점 (서초동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">서초동</li>
											<li class="subway">서초역</li>
										</ul>
										<p class="cont_list_detail_info_m">80인실, 20인실, 8인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">30,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/13">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/gS4Mkb2KBKANgYHvBydvTChqDQaUzsbRFP4p1TzK.jpg') no-repeat center;background-size:cover;">
																			<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="13"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">품격있는 회의 진행에 적합</p>
									<p class="cont_list_detail_tit">강남구 8호점 (역삼동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">역삼동</li>
											<li class="subway">역삼역</li>
										</ul>
										<p class="cont_list_detail_info_m">30인실, 12인실, 6인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">66,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/4">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/uuwvGvhy0h81JEXYjbT7CTYxGPoKnJjrvgtCEA9V.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="4"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성 및 회의실 컨디션 최상</p>
									<p class="cont_list_detail_tit">강남구 1호점 (삼성동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">삼성동</li>
											<li class="subway">선릉역</li>
										</ul>
										<p class="cont_list_detail_info_m">30인실, 14인실, 8인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">26,400원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/20">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/U2FV4BvkiIFYAWSwoaVwnafg9qkO9S5lsgXmvbWc.jpg') no-repeat center;background-size:cover;">
																		<button class="heart_btn  " type="button" data-likable="centers" data-target="20"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">서울파이낸스센터 소재</p>
									<p class="cont_list_detail_tit">중구 4호점 (태평로1가)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">태평로1가</li>
											<li class="subway">광화문역</li>
										</ul>
										<p class="cont_list_detail_info_m">50인실, 12인실, 6인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">52,800원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
									</div>
			</div>
		</div>
	</div>
	<!-- e main_section02 -->

	<!-- s main_section03 -->
	<div class="section section03">
		<div class="section_center_box">
			<div class="main_tit_box">
				<p class="main_tit01"><span>회의실닷컴</span> MD 추천</p>
				<p class="main_stit01">예약률, 평점, 재이용률 등 상위 랭킹에 등록된 센터 입니다.</p>
			</div>
			<div class="cont_list_div_wrap popularity_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="popularity_slider cont_list_div hf_effect02">
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/103">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/ZEKveZDIOj4jiuwGPNJXPvE9Q9nhB6RpiqOP6o8j.jpeg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="103"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">수서역 출구와 연결되어 접근성이 뛰어난 공간</p>
									<p class="cont_list_detail_tit">강남구 18호점 (수서동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">수서동</li>
											<li class="subway">수서역</li>
										</ul>
										<p class="cont_list_detail_info_m">17인실, 12인실, 8인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">55,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/85">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/EM1ogbS4cn7dW7yMiV07YVPLB2POVfYvltTymGfT.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="85"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">깔끔한 세미나실 보유</p>
									<p class="cont_list_detail_tit">제주 제주시 1호점 (노형동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">노형동</li>
											<li class="subway"></li>
										</ul>
										<p class="cont_list_detail_info_m">54인실, 10인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">22,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/120">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/R6kuGCuk28iHgwjQrK9I2umKCz5UHFJAQDlnsReB.png') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="120"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">웨비나 솔루션 토탈 패키지 스튜디오</p>
									<p class="cont_list_detail_tit">금천구 1호점 (가산동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">가산동</li>
											<li class="subway">가산디지털단지역</li>
										</ul>
										<p class="cont_list_detail_info_m">54인실, 20인실, 3인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">90,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/107">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/kXkygZXkmE3O4BJVCyeEx363c6GwaDeY0FZNVC96.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="107"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">좋은 접근성 깔끔한 회의실/강의실, 넓은 휴게공간</p>
									<p class="cont_list_detail_tit">부산 사상구 1호점 (모라동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">모라동</li>
											<li class="subway"></li>
										</ul>
										<p class="cont_list_detail_info_m">80인실, 50인실, 30인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">55,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/121">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/20Rce3GnG2IpB8D9q9c2LcdZgIfFSzaa4JLVij48.png') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="121"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">웨비나 솔루션 토탈 패키지 스튜디오</p>
									<p class="cont_list_detail_tit">서대문구 3호점 (충정로3가)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">충정로3가</li>
											<li class="subway">충정로역</li>
										</ul>
										<p class="cont_list_detail_info_m">4인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">150,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/104">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/b2AGiDCN7waudRNSYlImPuZrfk4zifpr1JESubch.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="104"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">역세권, 합리적인 가격과 최고 수준 공간</p>
									<p class="cont_list_detail_tit">서초구 2호점 (서초동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">서초동</li>
											<li class="subway">강남역</li>
										</ul>
										<p class="cont_list_detail_info_m">182인실, 54인실, 30인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">99,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/38">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/Q8EmFlaLdrYIPbntJhOfWKQDkkb4AbNcG8Kdx1t7.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="38"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">비즈니스 공간 대여 전문 업체</p>
									<p class="cont_list_detail_tit">강남구 20호점 (역삼동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">역삼동</li>
											<li class="subway">선릉역</li>
										</ul>
										<p class="cont_list_detail_info_m">68인실, 42인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">66,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>5.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/119">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/KZOYr0tUXBiUWuUFVzDAHp3NFvnuceNakY8vChG3.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="119"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">안양역 1번출구 1분거리. 안양1번가 입구</p>
									<p class="cont_list_detail_tit">경기 안양 1호점 (안양동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">안양동</li>
											<li class="subway">안양역</li>
										</ul>
										<p class="cont_list_detail_info_m">20인실, 9인실, 4인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">17,500원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/114">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/XZDuxGpka5OTHHzgmN3ghEgNcP6CV9BN0opLzcd2.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="114"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">성공적인 비즈니스를 위한 프리미엄센터</p>
									<p class="cont_list_detail_tit">강남구 5호점 (대치동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">대치동</li>
											<li class="subway">삼성역</li>
										</ul>
										<p class="cont_list_detail_info_m">120인실, 90인실, 60인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">16,500원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/25">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/VNmwnFFci9J7yxHH6UpB547dDC3O6Vt6zJ1iwXJY.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="25"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">최적의 입지 조건</p>
									<p class="cont_list_detail_tit">중구 7호점 (서소문동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">서소문동</li>
											<li class="subway">시청역</li>
										</ul>
										<p class="cont_list_detail_info_m">120인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">302,600원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>4.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/28">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/qlUxgOFeBq7e61siRTR8379VMn1pwdRiyKrHyp9v.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="28"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">서울역 연결통로 이동</p>
									<p class="cont_list_detail_tit">용산구 2호점 (동자동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">동자동</li>
											<li class="subway">서울역</li>
										</ul>
										<p class="cont_list_detail_info_m">70인실, 16인실, 12인실</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">55,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/122">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/e0DVSdVIV3Bqpwwf1E8lHxSNw66MfZR0T7PjCBh4.PNG') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="122"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">최상의 만족을 자랑하는 인천의 대표 공간</p>
									<p class="cont_list_detail_tit">인천 부평구 1호점 (부평동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">부평동</li>
											<li class="subway">부평역</li>
										</ul>
										<p class="cont_list_detail_info_m">50인실, 30인실, 20인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">15,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/36">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/wvb0doekMX8OavMD9hZEOOpoMxJ6H4KjOkgLHshB.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="36"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성 및 회의실 컨디션 최상</p>
									<p class="cont_list_detail_tit">강동구 1호점 (천호동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">천호동</li>
											<li class="subway">강동역</li>
										</ul>
										<p class="cont_list_detail_info_m">147인실, 130인실, 100인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">55,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
											<div>
							<a class="move_box" href="https://www.kmeetingroom.com/centers/22">
								<div class="cont_list_thum" style="background:url('/_storage/thumbnails/Pv2XJi1oL1wvr1XhAqVpl5SG8luDKypjPR7MxTiG.jpg') no-repeat center;background-size:cover;">
									
									<button class="heart_btn  " type="button" data-likable="centers" data-target="22"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">컨퍼런스룸과 연회장 보유 센터</p>
									<p class="cont_list_detail_tit">강남구 15호점 (도곡동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">도곡동</li>
											<li class="subway">양재역</li>
										</ul>
										<p class="cont_list_detail_info_m">200인실, 150인실, 120인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">91,800원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>4.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
									</div>
			</div>
		</div>
	</div>
	<!-- e main_section03 -->

		<!-- s main_section04 -->
	<div class="section section04">
		<div class="section_center_box">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>할인 프로모션</span> 센터</p>
				<p class="main_stit01">현재 할인이 진행 중인 센터입니다.</p>
			</div>
			<div class="cont_list_div_wrap discount_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="discount_slider cont_list_div hf_effect02">
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/64">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/WLA7dDyQKpnOB8rHD19ZG1UiJTczyuTIXWV4CoTl.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월 <br />
20% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="64"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">19개 회의실, 전문 면접장 및 강의장</p>
								<p class="cont_list_detail_tit">서대문구 1호점 (충정로2가)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">충정로2가</li>
										<li class="subway">서대문역</li>
									</ul>
									<p class="cont_list_detail_info_m">100인실, 64인실, 60인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">17,600원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/13">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/gS4Mkb2KBKANgYHvBydvTChqDQaUzsbRFP4p1TzK.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="13"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">품격있는 회의 진행에 적합</p>
								<p class="cont_list_detail_tit">강남구 8호점 (역삼동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">역삼동</li>
										<li class="subway">역삼역</li>
									</ul>
									<p class="cont_list_detail_info_m">30인실, 12인실, 6인실</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">59,400원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/15">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/gwodlXqFzuM2InkKSQTzNMqO0qcKmhhQsys43rQM.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="15"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">접근성이 뛰어난 깔끔 회의실</p>
								<p class="cont_list_detail_tit">강남구 9호점 (대치동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">대치동</li>
										<li class="subway">삼성역</li>
									</ul>
									<p class="cont_list_detail_info_m">30인실, 16인실, 10인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">59,400원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>3.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/83">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/uSTq0CYc9Pv6p5LUcYAAyxYU2Amoh59WW9TjQkMH.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
20% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="83"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">뛰어난 접근성의 화상회의실</p>
								<p class="cont_list_detail_tit">중구 9호점 (정동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">정동</li>
										<li class="subway">시청역</li>
									</ul>
									<p class="cont_list_detail_info_m">15인실, 4인실</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">22,000원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/35">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/ndiNsG9lVInVOOo7PSeBI8XrecXYMJCu5OD5pKQr.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월 <br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="35"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">연회 가능한 회의실</p>
								<p class="cont_list_detail_tit">서초구 3호점 (서초동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">서초동</li>
										<li class="subway">남부터미널역</li>
									</ul>
									<p class="cont_list_detail_info_m">280인실, 200인실, 150인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">247,500원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/105">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/rsswvK8Io6P7lvSsTFOM0mPVEE4ZToGhMV3uTrDl.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="105"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">접근성 좋은 깔끔한 강의장과 회의실</p>
								<p class="cont_list_detail_tit">서초구 4호점 (서초동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">서초동</li>
										<li class="subway">서초역</li>
									</ul>
									<p class="cont_list_detail_info_m">80인실, 20인실, 8인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">27,000원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/41">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/VOVTZ4nk7xA0DZo21wiv7zNWaHl6E7cnwKIEsFNU.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="41"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">여의도 IFC MALL</p>
								<p class="cont_list_detail_tit">영등포구 1호점 (여의도동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">여의도동</li>
										<li class="subway">여의도역</li>
									</ul>
									<p class="cont_list_detail_info_m">6인실</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">59,400원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>3.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/100">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/9ioktn56lcw4GLSM9OLs9tZZdHGeXPG02ubbZBHV.PNG') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
20% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="100"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">프라이빗한 소규모 모임을 위한 공간</p>
								<p class="cont_list_detail_tit">종로구 9호점 (낙원동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">낙원동</li>
										<li class="subway">종로3가역</li>
									</ul>
									<p class="cont_list_detail_info_m">20인실</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">24,000원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/102">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/ppUQK03cFGMok3RIjX6NrfAp8WE4QvBZ4kO8mA4e.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="102"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">접근성 좋은 깔끔한 회의실(무료주차)</p>
								<p class="cont_list_detail_tit">송파구 3호점 (가락동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">가락동</li>
										<li class="subway">경찰병원역</li>
									</ul>
									<p class="cont_list_detail_info_m">10인실, 6인실, 4인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">1,440원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>5.0</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/43">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/K9yFUPmOzlRrfGWtNgMlrN24LYelf1vCAxEmnfdN.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="43"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">여의도 IFC MALL</p>
								<p class="cont_list_detail_tit">영등포구 2호점 (여의도동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">여의도동</li>
										<li class="subway">여의도역</li>
									</ul>
									<p class="cont_list_detail_info_m">30인실, 18인실, 12인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">17,820원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
														<div>
						<a class="move_box" href="https://www.kmeetingroom.com/centers/14">
							<div class="cont_list_thum" style="background:url('/_storage/thumbnails/TvBkBt6o3nAgAmg5dHSj0LRsvwdkEGnLBrQrWfls.jpg') no-repeat center;background-size:cover;">
																	<span class="cont_list_thum_cover">7월<br />
10% 할인 프로모션</span>
																<button class="heart_btn  " type="button" data-likable="centers" data-target="14"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">품격있는 회의 진행에 적합</p>
								<p class="cont_list_detail_tit">강남구 6호점 (역삼동)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">역삼동</li>
										<li class="subway">역삼역</li>
									</ul>
									<p class="cont_list_detail_info_m">20인실, 10인실</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">118,800원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
									</p>
								</div>
							</div>
						</a>
					</div>
							</div>
			</div>
		</div>
	</div>
	<!-- e main_section04 -->
	
	<!-- s main_section05 -->
	<div class="section section05">
		<div class="section_center_box">
			<div class="main_section05_slide_box">
									<div>
						<a href="https://www.kmeetingroom.com/guide" >
							<img src="/_storage/banners/uCm6HQXmeQgSTnXmwFjRNtBu4M9lhwRZnIJ5R4GX.png" alt=""></a>
					</div>
								<!--<div><a href="javascript:alert('출시 예정입니다.');"><img src="/pc/images/main_section05_banner_img01.png" alt=""></a></div>-->
			</div>
		</div>
	</div>
	<!-- e main_section05 -->

	<!-- s main_section06 -->
	<div class="section section06">
		<div class="section_center_box">
			<div class="main_section06_content_box">
				<div class="main_section06_content_box_location"><img src="/pc/images/main_section06_img01.png" alt="지도">
				</div>
				<div class="main_section06_content_box_text">
					<p class="main_section06_content_box_tit"><span>국내 최초의</span><br>
						회의실 전문 매칭 플랫폼
					</p>
					<p class="main_section06_content_box_stit">회의실닷컴은 좋은 회의실을 원하는 지역에서 <br>
						누구나 이용할 수 있도록 연결합니다.
					</p>
					<ul class="main_section06_content_box_list">
						<li>
							<span id="count01" class="main_section06_content_box_list_num">94</span>
							<span class="main_section06_content_box_list_text">등록 센터</span>
						</li>
						<li>
							<span id="count02" class="main_section06_content_box_list_num">417</span>
							<span class="main_section06_content_box_list_text">등록된 회의실</span>
						</li>
						<li>
							<span id="count03" class="main_section06_content_box_list_num">53457</span>
							<span class="main_section06_content_box_list_text">누적 이용 고객</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- s main_section06 -->

	<!-- e sub_section -->
	<!-- s sub_section -->
	<div class="sub_section sub_section_videoconference01" style="padding: 80px 0 130px;">
		<div class="center_box">
			<div class="sub_section_videoconference01_contentbox">
				<div class="sub_section_videoconference01_contentbox_right motion02 s_obj opa_obj01 active">
					<p class="sub_section_videoconference01_contentbox_tit" style="font-size: 39px;">고가의 최신형 화상 회의 솔루션을<br>
						<span>월 렌탈</span>로 이용해보세요.</p>
						<br>
					<p class="sub_section_videoconference01_contentbox_tit" style="font-size: 24px;">
						단 하루 사용을 위한 렌탈부터 장기 렌탈까지 가능합니다.
					</p>
					<a class="sub_section_videoconference01_contentbox_btn" href="https://www.kmeetingroom.com/video/rental"><span>화상회의 솔루션</span></a>
				</div>
				<div class="sub_section_videoconference01_contentbox_left motion s_obj left_obj02 active"><img src="/pc/images/sub_section_videoconference01_contentbox_img01.jpg" alt=""></div>
			</div>
		</div>
	</div>
	<!-- e sub_section -->

	</div>
	<!-- e container -->
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>