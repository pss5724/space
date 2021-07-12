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
				<span>스페이스닷컴의 새로운 소식을 알려드립니다.</span>
			</h3>
		</div>
		<!-- e sub_visual -->

		<!-- s sub_section -->
		<div class="sub_section sub_section_view_board01">
			<div class="center_box">
				<div class="view_board_table">
					<table>
						<colgroup>
							<col style="width:80%;">
						</colgroup>
						<thead>
						<tr>
							<th scope="col">[공지] 6월 후기이벤트 참여 회원, 다시 한번 축하드립니다.</th>
							<th class="right" scope="col">조회 6 | 2021-07-05</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td colspan="2">
								<div class="board_view_content">
									<p><img style="width: 1000px;" data-filename="6월.jpg" src="http://localhost:9000/space/images/f32IAekLtAHXo3odgiHPOd6OKTZWFPm1iKZuz6gJ.jpeg"><br></p>

								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<ul class="view_board_table_control">
					<li class="prev">
						<span class="prev_f">
                            <a href="#">이전글</a>
                        </span>
							<span class="prev_s">
                             <a href="#">[안내] 신규 가맹점 금천구 1호점 을 소개합니다.</a>
                        </span>
					</li>
					<li class="next">
						<span class="next_f">
                            <a href="#">다음글</a>
                        </span>
						<span class="next_s">
                            <a href="#">다음글이 없습니다.</a>
                        </span>
						
					</li>
				</ul>

				<div class="common_btn_area right">
					<a class="black_btn" href="http://localhost:9000/space/notice.do">목록보기</a>
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