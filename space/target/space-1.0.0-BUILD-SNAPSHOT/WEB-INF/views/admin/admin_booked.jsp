<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/mypage.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="http://localhost:9000/space/js/am-pagination.js"></script>
<script>
//페이징 처리
	$(document).ready(function(){
		
		var pager = jQuery('#ampaginationsm').pagination({
			
		    maxSize: 5,	    		// max page size
		    totals:${dbcount},	// total pages	
		    page:${rpage},		// initial page		
		    pageSize: ${pagesize},	// max number items per page
		    
			
		    //totals: ${dbcount},	// total pages	
		    //page: ${rpage},		// initial page		
		    //pageSize: ${pageSize},	// max number items per page
		    
		    
		    // custom labels		
		    lastText: '&raquo;&raquo;', 		
		    firstText: '&laquo;&laquo;',		
		    prevText: '&laquo;',		
		    nextText: '&raquo;',
				     
		    btnSize:'sm'	// 'sm'  or 'lg'		
		});
		
		jQuery('#ampaginationsm').on('am.pagination.change',function(e){  //페이지가 변경되면 href의 주소 변경
			   jQuery('.showlabelsm').text('The selected page no: '+e.page);
	           $(location).attr('href', "http://localhost:9000/space/corppage_booked.do?rpage="+e.page);         
	    });
		
	    /* 금액 콤마 표시하기 */
		function number_format(numstr) {
		   var numstr = String(numstr);
		   var re0 = /(\d+)(\d{3})($|\..*)/;
		   if (re0.test(numstr)) {
		      return numstr.replace(re0, function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; });
		   } else {
		      return numstr;
		   }
		}

	    $(".price").each(function(){
	    	var price = number_format($(this).text());
	    	$(this).text(number_format(price)+"원");
	    });
		
		
 	});
</script>
<style>
.mypage_left_box ul li:nth-child(3) a{
	text-decoration: none;
	font-size:19px;
	font-weight:bold;
	color:black;
}
.mypage_right_box_title a {
	float:right;
	font-size:15px;
	background-color : white;
	border:1px solid lightgray;
	border-radius:4px;
	padding : 4px 15px;
}
.mypage_right_box_booked_table{
	 margin-top:20px;
 width:100%;
 border-spacing:0;
 border-collapse:collapse;
}
  .mypage_right_box_booked_table tr{
 	font-size:14px; 
 	font-weight:520;   
 	text-align:center;
 	height:60px;
 	border-bottom:1px solid lightgray;
 }
 
 .mypage_right_box_booked_table tr:last-child{
 	font-size:14px; 
 	font-weight:520;   
 	text-align:center;
 	height:60px;
 	border-bottom:none;
 }
   .mypage_right_box_booked_table tr button{
   	padding: 5px 10px;
   	background-color:white;
   	border:1px solid lightgray;
   	border-radius:5px;
   	color:red;
   }
 .mypage_right_box_booked_table tr:first-child{
 	background-color: rgb(251,251,251);
 	font-size:16px;
 	font-weight:700; 
 	text-align:center;
 	height:60px;
 	border-top:1px solid lightgray;	
 	border-bottom:1px solid lightgray;
 }
 
   .reserve_cancel_btn a{
   	padding: 5px 10px;
   	background-color:white;
   	border:1px solid lightgray;
   	border-radius:5px;
   	color:red;
   }

 .am-pagination-lg > li > a, .am-pagination-lg > li > span {
    padding: 10px 16px;
    font-size: 18px;
    line-height: 1.3333333;

}
.am-pagination-sm > li > a, .am-pagination-sm > li > span {
	padding: 5px 10px;
    font-size: 12px;
    line-height: 1.5;
}
.am-pagination-default {
  display: inline-block;
  padding-left: 0;
  margin: 20px 0;
  border-radius: 4px;
}
.am-pagination-default > li {
  display: inline;
	font-family: -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
}
.am-pagination-default > li > a,
.am-pagination-default > li > span {
  position: relative;
  float: left;
  padding: 6px 12px;
  line-height: 1.42857143;
  text-decoration: none;
  color: #337ab7;
  background-color: #fff;
  border: 1px solid #ddd;
  margin-left: -1px;
}
.am-pagination-default > li:first-child > a,
.am-pagination-default > li:first-child > span {
  margin-left: 0;
  border-bottom-left-radius: 4px;
  border-top-left-radius: 4px;
}
.am-pagination-default > li:last-child > a,
.am-pagination-default > li:last-child > span {
  border-bottom-right-radius: 4px;
  border-top-right-radius: 4px;
}
.am-pagination-default > li > a:hover,
.am-pagination-default > li > span:hover,
.am-pagination-default > li > a:focus,
.am-pagination-default > li > span:focus {
  z-index: 2;
  color: #23527c;
  background-color: #eeeeee;
  border-color: #ddd;
}
.am-pagination-default > .active > a,
.am-pagination-default > .active > span,
.am-pagination-default > .active > a:hover,
.am-pagination-default > .active > span:hover,
.am-pagination-default > .active > a:focus,
.am-pagination-default > .active > span:focus {
  z-index: 3;
  color: #fff;
  background-color: #5eb95e;
  border-color: #5eb95e;
  cursor: default;
}
.am-pagination-default > .disabled > span,
.am-pagination-default > .disabled > span:hover,
.am-pagination-default > .disabled > span:focus,
.am-pagination-default > .disabled > a,
.am-pagination-default > .disabled > a:hover,
.am-pagination-default > .disabled > a:focus {
  color: #777777;
  background-color: #fff;
  border-color: #ddd;
  cursor: not-allowed;
}
.am-pagination-default-lg > li > a,
.am-pagination-default-lg > li > span {
  padding: 10px 16px;
  font-size: 18px;
  line-height: 1.3333333;
}
.am-pagination-default-lg > li:first-child > a,
.am-pagination-default-lg > li:first-child > span {
  border-bottom-left-radius: 6px;
  border-top-left-radius: 6px;
}
.am-pagination-default-lg > li:last-child > a,
.pagination-lg > li:last-child > span {
  border-bottom-right-radius: 6px;
  border-top-right-radius: 6px;
}
.am-pagination-default-sm > li > a,
.am-pagination-default-sm > li > span {
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
}
.am-pagination-default-sm > li:first-child > a,
.am-pagination-default-sm > li:first-child > span {
  border-bottom-left-radius: 3px;
  border-top-left-radius: 3px;
}
.am-pagination-default-sm > li:last-child > a,
.am-pagination-default-sm > li:last-child > span {
  border-bottom-right-radius: 3px;
  border-top-right-radius: 3px;
}
</style>
</head>
<body>

<!-- header -->
<jsp:include page="../header.jsp"></jsp:include>
 
	<!-- content -->
	<div class="mypage_container">
	
		<div class="mypage_content">
			<!-- left_box  -->
			<div class="mypage_left_box">
				<p class="mypage_ltitle">
					<img src="http://localhost:9000/space/images/little_logo.jpg"/>
					<span>관리 메뉴</span>
				</p>
				<ul>
					<li>
						<a href="member_list.do">개인회원 관리</a>
					</li>
					<li>
						<a href="corp_list.do">기업회원 관리</a>
					</li>
						<li>
						<a href="admin_booked.do?rpage=1">예약 내역</a>
					</li>
					<li>
						<a href="admin_inquiry.do?rpage=1">문의 답변</a>
					</li>
					
				</ul>
			</div>
			<!-- left_box end -->

			<!-- right_box -->
			<div class="mypage_right_box">
					
				<div class="mypage_right_box_title">
					<div class="title_deco"></div>
					<p class="mypage_right_tit">예약 내역</p>
					
					
				</div>
				<br>
				<table class="mypage_right_box_booked_table">
				<tr>
					<th>NO<div class="table_th_after"></div></th>
					<th>예약자<div class="table_th_after"></div></th>
					<th>지점<div class="table_th_after"></div></th>
					<th>회의실명<div class="table_th_after"></div></th>
					<th>예약일<div class="table_th_after"></div></th>
					<th>예약시간<div class="table_th_after"></div></th>
					<th>결제금액 (원)<div class="table_th_after"></div></th>
					<th>관리</th>
				</tr>
				<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.rno }</td>
					<td><a href="room_reserve_confirm.do?rsid=${vo.rsid}">${vo.email }</a></td>
					<td>${vo.branch_name }</td>
					<td>${vo.room_name }</td>
					<td>${vo.reserve_date }</td>
					<td><c:choose>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 0}">
									${fn:split(vo.checkin_time,'.')[0]}:00 ~
								</c:when>
								<c:when test="${fn:split(vo.checkin_time,'.')[1] == 5}">
									${fn:split(vo.checkin_time,'.')[0]}:30 ~
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 0}">
									${fn:split(vo.checkout_time,'.')[0]}:00
								</c:when>
								<c:when test="${fn:split(vo.checkout_time,'.')[1] == 5}">
									${fn:split(vo.checkout_time,'.')[0]}:30
								</c:when>
							</c:choose></td>
					<td class="price">${vo.amount }</td>
					<td class="reserve_cancel_btn"><a href="admin_booked_cancel_proc.do?rsid=${vo.rsid }">취소</a></td>
				</tr>
				</c:forEach>
				<tr>
				<td colspan="8"><div id="ampaginationsm"></div>	</td>
				</tr>
				
			</table>
				
		
		
			</div>
			<!-- right box end -->
			
		</div>
	
	
	</div>
	
	<!-- footer -->   
<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>