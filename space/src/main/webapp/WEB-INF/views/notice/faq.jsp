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
<link rel="stylesheet" href="http://localhost:9000/space/css/am-pagination.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script src="http://localhost:9000/space/js/am-pagination.js"></script>
<script>
//페이징 처리
$(document).ready(function(){
	
	var pager = jQuery('#ampaginationsm').pagination({
		
	    maxSize: 5,	    		// max page size
	    totals: 4 ,	// total pages	
	    page: ${rpage},		// initial page		
	    pageSize: 2,	// max number items per page
		
	    //totals: ${dbcount},	// total pages	
	    //page: ${rpage},		// initial page		
	    //pageSize: 2,	// max number items per page
	    
	    
	    // custom labels		
	    lastText: '&raquo;&raquo;', 		
	    firstText: '&laquo;&laquo;',		
	    prevText: ' ',		
	    nextText: ' ',
			     
	    btnSize:'sm'	// 'sm'  or 'lg'		
	});
	
	jQuery('#ampaginationsm').on('am.pagination.change',function(e){  //페이지가 변경되면 href의 주소 변경
		   jQuery('.showlabelsm').text('The selected page no: '+e.page);
           $(location).attr('href', "http://localhost:9000/space/faq.do?rpage="+e.page);         
    });
	});
	
	//컨텐츠 BOX
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
			
			
			
			$(".search_btn").click(function(){
				console.log('클릭');
					var question = $("#q").val();
					$(".board_type01>table>tbody>tr").hide();
					var temp = $(".board_type01>table>tbody>tr>td:nth-child(2n+2):contains('"+ question +"')");
					
					console.log('dd',question);
					
					$(temp).parent().show();
					
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
				background:url('http://localhost:9000/space/images/cus_slectbox_tit_off.png') no-repeat left top;
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
				margin-top: 50px;
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
				margin-top:-20px;
				background:url('http://localhost:9000/space/images/faq_content_btn_off.png') no-repeat left top;
				width: 35px;
				height:25px;
				position:absolute;
				top:50%;
				right:31px;
			}
			.faq_content_btn.on:after {
				content:'닫기';
				background:url('http://localhost:9000/space/images/faq_content_btn_on.png') no-repeat left top;
				width: 35px;
				height:25px;
				margin-top:-20px;
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
				<!-- <div class="board_search_box">
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
				</div> -->

				<div class="faq_box">
				
				<c:forEach var="vo" items="${list}">
						<div class="faq_content">
							<button class="faq_content_btn" type="button">${vo.ftitle}</button>
							<div class="faq_content_text"> <p>${vo.fcontent}</p>
							</div>
						</div>
						</c:forEach>
											
				<div class="content_paging">
					<a class="content_paging_prev" href="javascript:void(0);"><img src="http://localhost:9000/space/images/content_paging_left.png" alt="이전"></a>
					<div id="ampaginationsm"></div>		
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