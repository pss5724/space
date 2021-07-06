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
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
				<!-- s sub_visual -->
		<div class="sub_visual usercenter">
			<h3 class="type02">공지사항
				<span>회의실닷컴의 새로운 소식을 알려드립니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_tab -->
		<div class="sub_tab_box">
			<ul class="sub_tab">
				<li class="on"><a href="#">공지사항</a></li>
				<li><a href="https://localhost:9000/space/faq.do">자주묻는 질문</a></li>
			</ul>
		</div>
		<!-- e sub_tab -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_board01">
			<div class="center_box">
				<p class="sub_tit">공지사항</p>
				<div class="board_search_box">
					<form action="#" method="GET">
					<div class="board_search_box_text"><input type="text" name="q" placeholder="검색어를 입력해주세요." title="검색어 입력" value=""><button type="submit"></button></div>
					</form>
				</div>

				<div class="board_type01">
					<table>
						<colgroup>
							<col style="width:100px;">
							<col style="width:;">
							<col style="width:120px;">
							<col style="width:120px;">
							<col style="width:120px;">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">조회수</th>
							<th scope="col">작성일</th>
						</tr>
						</thead>
						<tbody>
													<tr>
								<td class="board_fix"><img src="http://localhost:9000/space/images/notice_board_fix_icon01.png" alt="공지"></td>
								<td class="al_left board_fix"><a class="over_link" href="#">[안내] 왕초보도 가능! 촬영부터 편집까지 가능한 영상 녹화 스튜디오를 소개합니다.</a></td>
								<td class="board_fix">관리자</td>
								<td class="board_fix">253</td>
								<td class="board_fix">2021.03.31</td>
							</tr>

													<tr>
								<td>120</td>
								<td class="al_left"><a class="over_link" href="#">[안내] 신규 가맹점 &#039;금천구 1호점&#039;을 소개합니다.</a></td>
								<td class="">관리자</td>
								<td class="">14</td>
								<td class="">2021.06.25</td>
							</tr>

												</tbody>
					</table>
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