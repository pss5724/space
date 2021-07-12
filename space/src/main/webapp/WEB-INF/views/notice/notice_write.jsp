<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 닷컴</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<style>
.notice_container {
 	width: 100%;
 	margin : 40px 0;
 	display:inline-block;
 	position:relative;
 }
 .notice_content{
 	width:70%;
 	margin : auto;
 	
 }
.notice_write_table {
	margin-top:50px;
	margin-right:100px;
 width:90%;
 border-spacing:0;
 border-collapse:collapse;
}

 .notice_write_table tr{
   	font-size :14px;
 	font-weight:600; 
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
  .notice_write_table tr th{
  	padding-left:12px;
  	text-align:left;
  	width:150px;
   	background-color: rgb(248,248,248);
 	font-weight:600;   
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 } 
 .notice_write_table tr td{
  	padding-left:12px;
  	text-align:left;
 	font-weight:600;   
 	height:60px;
 }
 .input_subject {
	width:100%;
	height:45px;
	border-radius:6px;
	border: 1px solid lightgray; 
 }
 .input_content{ 
 	margin:4px 0;
 	width:100%;
 	height:250px;
 	border-radius:6px;
 	border: 1px solid lightgray;
 }
 .notice_category {
 	width :45%;
 	height:45px;
 	border-radius:6px;
	border: 1px solid lightgray; 
 }
 .table_th_after{ 
	margin-top:2px;  
	float:right;  
    width: 2px;
    height: 16px;
    background: #d7d7d7; 
}
.notice_write_btn {
	width: 50%;
	margin: 30px auto 40px auto;	
}
.notice_write_btn a:first-child{
	float:left;
	border:1px solid rgb(2,116,216);
	border-radius:5px;
	margin-right:6px;
	padding: 6px 30px; 
	color:white;
	font-size:15px;
	font-weight:600;
	background-color:rgb(2,116,216); 
}
.notice_write_btn a:last-child{
	float:left;
	border:1px solid lightgray;
	border-radius:5px;
	padding: 6px 45px; 
	font-size:15px;
	font-weight:600;
	background-color:white; 
}

</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../header.jsp"></jsp:include>
	
	<!-- content -->
	<div class="notice_container">
	
			<div class="notice_content">
			<h1>공지사항 등록</h1>
			
		<form id="notice_write" action="notice_write_proc.do" method="POST" enctype="multipart/form-data">
			<table class="notice_write_table">
				<tr>
					<th scope="row">상단 고정</th>
					<td>
						<select class="notice_category" name="notice_category">
							
							<option value="choice" selected>선택</option>
							<option value="important">중요</option>
							<option value="normal">기본</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="subject" class="input_subject" title="제목작성" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<input type="text" name="content" class="input_content" title="내용작성">
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td>
						<input name="file" type="file"><span></span>
					</td>
				</tr>
				
			</table>
	
		<div class="notice_write_btn">
			<a id="writeNotice" class="blue" href="#">등록하기</a>
			<a href="#">취소</a>
		</div>
	
		</form>
	</div>
</div>
		
	<!-- footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>