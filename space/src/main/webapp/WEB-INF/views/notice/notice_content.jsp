<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<th scope="col">${vo.ntitle} </th>
							<th class="right" scope="col">${vo.nhit } | ${vo.ndate}</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td colspan="2">
								<div class="board_view_content">
									<p>${content}
									<c:if test="${vo.nsfile ne null }">
										<img style="width: 1000px;" data-filename="" src="http://localhost:9000/space/upload/${vo.nsfile}"><br>
									</c:if>
									</p>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<ul class="view_board_table_control">
				<c:choose>
					<c:when test="${list[1].rno ne null }">
						<li class="prev">
							<span class="prev_f">
	                            <a href="#">이전글</a>
	                        </span>
								<span class="prev_s">
	                             <a href="http://localhost:9000/space/notice_content.do?nid=${list[0].nid}&rno=${list[0].rno}">${list[0].ntitle}</a>
	                        </span>
						</li>
					
						<li class="next">
							<span class="next_f">
	                            <a href="#">다음글</a>
	                        </span>
							<span class="next_s">
	                            <a href="http://localhost:9000/space/notice_content.do?nid=${list[1].nid}&rno=${list[1].rno}">${list[1].ntitle}</a>
	                        </span>
						</li>
					</c:when>
					
					<c:otherwise>
						<li class="prev">
							<span class="prev_f">
	                            <a href="#">이전글</a>
	                        </span>
								<span class="prev_s">
	                             <a href="#">이전글이 존재하지 않습니다.</a>
	                        </span>
						</li>
					
						<li class="next">
							<span class="next_f">
	                            <a href="#">다음글</a>
	                        </span>
							<span class="next_s">
	                            <a href="http://localhost:9000/space/notice_content.do?nid=${list[0].nid}&rno=${list[0].rno}">${list[0].ntitle}</a>
	                        </span>
						</li>
					</c:otherwise>
				</c:choose>
				</ul>

				<div class="common_btn_area right">
					<a class="black_btn" id="delete_btn" href="http://localhost:9000/space/notice_delete_proc.do?nid=${vo.nid }">삭제하기</a>
					<a class="black_btn" href="http://localhost:9000/space/notice.do?rpage=1">목록보기</a>
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