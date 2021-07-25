<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 닷컴</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/room.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script>
</script>
<style>
header {
   height:0;
   display:absolute;
}
body {
   text-align: left;
}
.visual {
   box-sizing:border-box;
   position:relative;
   width:100%;
   min-width:1280px;
   height:450px;
   padding-top:182px;
   background:url('http://localhost:9000/space/images/main_visual.png') no-repeat center;
}

.visual_box {
   width:1200px;
   margin:0 auto;
}

.main_visual_text_box {
   margin-bottom:30px;
   margin-left: 120px;
   font-size:0;
}
.main_visual_text_box_logo{
   display:inline-block;
}
.main_visual_text_box_logo span{
   font-size:42px;
   font-weight:bold;
   color:#ffffff;
}
.main_visual_text_box_text {
   position:relative;
   display:inline-block;
   vertical-align:top;
   padding-left:19px;
   margin-left:18px;
   font-size:18px;
   line-height:26px;
   color:#ffffff;
   letter-spacing:-1px;
}
.main_visual_text_box_text span {
   opacity:0.8;
}
.main_visual_text_box_text:before {
   content:'';
   display:block;
   width:1px;
   height:36px;
   margin-top:-18px;
   position:absolute;
   left:0;
   top:50%;
   background:#66a6ec;
}

.main_visual_search_box {
   position:relative;
   box-sizing:border-box;
   background:#f5f5f5;
   border-radius:5px;
   width:640px;
   padding:18px 15px;
   font-size:0;
}

.section  {
   width:100%;
   min-width:1280px;
   position:relative;
   display:inline-block;
}
.section_center_box, .sub_section {
   width:1200px;
   margin:0 auto;
}


/* 카운트 */
.section.count {
   padding:55px 0 65px;
}
.main_count_content_box:after {
   content:'';
   display:block;
   clear:both;
}
.main_count_content_box > div {
   float:left;
}
.main_count_location {
   width:545px;
}
.main_count_text {
   box-sizing:border-box;
   width:655px;
   padding-left:17px;
}
.main_count_tit {
   padding-top:90px;
   padding-left:70px;
   font-size:42px;
   line-height:52px;
   color:#252626;
   letter-spacing:-2px;
}
.main_count_tit span {
   position:relative;
   display:inline-block;
   vertical-align:top;
   font-size:42px;
   line-height:52px;
   color:#252626;
}
.main_count_tit span:after {
   content:'';
   display:block;
   width:29px;
   height:41px;
   /*background:url('http://localhost:9000/space/images/main_count_tit_mark.png') no-repeat left top;*/
   position:absolute;
   top:3px;
   right:-34px;
}

.main_count_stit {
   margin-top:10px;
   padding-left:70px;
   font-size:16px;
   line-height:26px;
   color:#252626;
   letter-spacing:-1px;
}

.main_count_list {
   margin-top:50px;
}
.main_count_list:after {
   content:'';
   display:block;
   clear:both;
}
.main_count_list li {
   position:relative;
   float:left;
   width:210px;
}
.main_count_list li + li:after {
   content:'';
   display:block;
   width:1px;
   height:100%;
   background:#d3d4d4;
   position:absolute;
   left:0;
   top:0;
}
.main_count_list_num {
   display:block;
   font-family:"nanumsquare-l";
   font-size:55px;
   line-height:55px;
   color:#3a7fb9;
   letter-spacing:-2px;
   text-align:center;
}
.main_count_list_text {
   display:block;
   margin-top:10px;
   font-family:"nanumsquare-b";
   font-size:18px;
   line-height:18px;
   color:#252626;
   letter-spacing:-2px;
   text-align:center;
}

.main_tit_box{
	position:relative;
	margin-bottom:36px;
	font-weight:bold;
}

.main_tit_box.line:after {
	left:0;
}
.main_tit_box.line:before {
	right:0;
}
.main_tit01 {
	margin-bottom:12px;
	font-size:35px;
	line-height:32px;
	color:#252626;
	text-align:center;
	letter-spacing:-1px;
}
.main_tit01 span {
	color:#3284e6;
}
.main_stit01 {
	font-size:16px;
	line-height:16px;
	color:#6a6a6a;
	text-align:center;
}

.main_content{
	width: 100%;
    min-width: 1280px;
    position: relative;
    display: inline-block;
}
.video {
	position:relative;
    width: 1000px;
    margin: 70px auto;
	overflow: hidden;
}
.rec_background {
	width:100%;
	padding: 70px 0;
	background: url('http://localhost:9000/space/images/main_section03_bg.jpg');
	background-position: bottom;
}
.rec{
	position:relative;
    width: 1000px;
    margin: 0 auto;
	overflow: hidden;
}
.slider, .slider1 {
	text-align: left;
	margin: 0 100px;
	display: flex;
	justify-content: space-around;
	text-align: center;
}
.item, .ritem {
	height: 220px;
	display: inline-block;
	box-sizing:border-box;
	border-radius: 10px;
	border: 1px solid lightgray;
	border-radius: 10px;
	overflow: hidden;
	text-align: left;
}
.item>a>div, .ritem>a>div {
	padding: 7px;
}
.item>a>div>div>img, .item>a>div>img, .ritem>a>div>div>img, .ritem>a>div>img {
	display: inline-block;
	vertical-align: middle;
}
.item>a>div>span:first-child, .ritem>a>div>span:first-child {
	font-size: 11px;
	color: #3875e6;
	font-weight: bold;
	display: block;
}
.item>a>div>span:nth-child(2),.ritem>a>div>span:nth-child(2) {
	font-size: 15px;
	font-weight: bold;
	display: block;
}
.item>a>div>div:nth-child(3),.ritem>a>div>div:nth-child(3) {
	margin-top: 15px;
}
.item>a>div>div:nth-child(3)>span,.ritem>a>div>div:nth-child(3)>span {
	font-size: 11px;
	margin-left: 2px;
	color: #444444;
	font-weight: bold;
}
.item>a>div>div:nth-child(3)>span:nth-child(2),.ritem>a>div>div:nth-child(3)>span:nth-child(2) {
	margin-right: 10px;	
}
.item>a>div>div:last-child,.ritem>a>div>div:last-child {
	margin-top: 10px;
}
.item>a>div>div:last-child>span:first-child,.ritem>a>div>div:last-child>span:first-child {
	font-weight: bold;
	font-size: 15px;
}
.item>a>div>div:last-child>span:nth-child(2),.ritem>a>div>div:last-child>span:nth-child(2) {
	font-size: 11px;
	color: #444444;
}
.item>a>div>div:last-child>img, .ritem>a>div>div:last-child>img {
	width: 55px;
	vertical-align: middle;
	margin-left: 2px;
}
.item>a>div>div:last-child>span:last-child, .ritem>a>div>div:last-child>span:last-child {
	margin-left: 5px;
	font-size: 11px;
	color: #666666;
	font-weight: bold;
	vertical-align: middle;
}

/* Arrows */
.slick-prev,
.slick-next,
.slick-prev1,
.slick-next1
{
    font-size: 0;
    line-height: 0;

    position: absolute;
    top: 65%;

    display: block;

    padding: 0;
    -webkit-transform: translate(0, -50%);
    -ms-transform: translate(0, -50%);
    transform: translate(0, -50%);

    cursor: pointer;

    color: transparent;
    outline: none;
    
    border: 1px solid #c6c6c6;
    border-radius: 20px;
    width: 40px;
    height: 40px;
    z-index: 100;
}

.slick-prev,.slick-prev1
{	
    left: 0;
    background-image: url("http://localhost:9000/space/images/item_viewbox_top_slide_left.png");
}

.slick-next,.slick-next1
{
    right: 0;
    background-image: url("http://localhost:9000/space/images/item_viewbox_top_slide_right.png");
}


</style>
<script>
//숫자 카운트 
$(function(){

   $(window).one('mousewheel scroll', function(){
      var thisTop = $(this).scrollTop(),
         thisHeight = $(this).outerHeight(true),
         thisBottom = thisTop + thisHeight;

      var targetOffsetTop = $('.count').offset().top;
      var targetOffsetHeight = $('.count').outerHeight();
      var targetOffsetBottom = targetOffsetTop + targetOffsetHeight;


      if(((targetOffsetTop <= thisBottom) && (targetOffsetBottom >= thisTop))) {
         countUp($("#count01"), "<c:out value='${room_count}' />");
         countUp($("#count02"), "<c:out value='${reserve_count}' />");
         countUp($("#count03"), "<c:out value='${review_count}' />");
      }
   });
      

      function countUp(target, target_num) {
         var cnt0 = 0;
         target_num = parseInt(target_num);
         
         intv = setInterval(count, 100);
   
         function count() {
            cnt0++;
   
            if (cnt0 > target_num) {
               clearInterval(intv);
            } else {
               target.text(cnt0);
            }
         }
      }   
});

 
 // 검색 기능
$(document).ready(function() {
    
      $("html").click(function(e) { 
         if(!$(e.target).is(".select_data") && !$(e.target).is(".select_data *") && !$(e.target).is("label input")) { 
            $("label").siblings("div").removeClass("open");
         }
      });

      $("label").click(function() {
         $(this).parent("li").siblings().children("div").removeClass("open");
         $(this).siblings("div").toggleClass("open");
      });
      
      $(".btn_search_reset").click(function() {
         $(this).siblings("label").children("input").val("");
      });

      /* 지역선택 */
      var addr_list = new Array();
      <c:forEach items="${addr_list}" var="addr">
         addr_list.push("${addr}");
      </c:forEach>
      
      var seoul="", gyeonggi="", incheon="";
      for(var i in addr_list) {
         if(addr_list[i].indexOf("서울") != -1) {
            $(".seoul li").remove();
            var list = addr_list[i].split(" ");
            seoul += "<li><button class='sub_location'>" + list[1] + "</button></li>";
         } else if(addr_list[i].indexOf("경기") != -1){
            $(".gyeonggi li").remove();
            var list = addr_list[i].split(" ");
            gyeonggi += "<li><button class='sub_location'>" + list[1] + "</button></li>";
         } else {
            $(".incheon li").remove();
            var list = addr_list[i].split(" ");
            incheon += "<li><button class='sub_location'>" + list[1] + "</button></li>";
         }
      }
      
      $(".seoul").append(seoul);
      $(".gyeonggi").append(gyeonggi);
      $(".incheon").append(incheon);
      
      $(".sub_location").click(function() {
         var location =  $(this).parent().parent().siblings("span").text() + " > " + $(this).text();
         $("#search_location").val(location);
         $(".location").removeClass("open");
      });
      
      $(".main_location").click(function() {
         $("#search_location").val($(this).text());   
         $(".location").removeClass("open");
      });
      
      $(".btn_search").click(function() {
         var location1, location2;
         
         if($("#search_location").val()!="") {
            if($("#search_location").val().indexOf(">") != -1) {
               var location_list = $("#search_location").val().split(" > ");
               location1 = location_list[0];  //서울
               location2 = location_list[1];  //강남구
            } else {
               location1 = $("#search_location").val();
               location2 = "";
            }
         } else {
            location1 = "";
            location2 = "";
         }
         
         location.href = "http://localhost:9000/space/room_list.do?location1=" + location1 + "&location2=" + location2;
      });

	
	var rolist = new Array();
    <c:forEach var="room" items="${roomlist}">
	    rolist.push("${room.rid}");
	    rolist.push("${room.rsfile1}");
	    rolist.push("${room.intro}");
	    rolist.push("${room.branch_name}");
    	rolist.push("${room.address}".split(' ')[1]);
	    rolist.push("${room.capacity}");
	    rolist.push("${room.charge}");
	    rolist.push("${room.grade}");
	</c:forEach>
	console.log(rolist);
	
	var oplist = new Array();
	<c:forEach var="option" items="${roomoptionlist}">
		<c:if test="${option.video_device == 1}">
			oplist.push("${option.rid}");
		</c:if>
	</c:forEach>
	console.log(oplist);
	

	var video = "";
	var num = 0;
	var k=0;
	for(var j=0;j<oplist.length;j++){
		for(var i=0;i<rolist.length;i++){
			if(rolist[i] == oplist[j]){
				video += "<div class='item item"+num+"' data-index='"+num+"'>";
				video += "<a href='http://localhost:9000/space/room_content.do?rid=" + rolist[i] + "&rpage=1'><img src='http://localhost:9000/space/upload/" + rolist[++i] + "' width='178px'>";
				if(rolist[++i].length > 15){
					video += "<div><span>" + rolist[i].substring(0,15) + "...</span>";
				}else {
					video += "<div><span>" + rolist[i] + "</span>";
				}
				video += "<span>" + rolist[++i] + "</span>";
				video += "<div><img src='http://localhost:9000/space/images/cont_list_detail_info01.png'><span>" + rolist[++i] + "</span>";
				video += "<img src='http://localhost:9000/space/images/cont_list_detail_info03.png'><span>" + rolist[++i] + "인실</span>";
				video += "</div><div><span class='item_price'>" + rolist[++i] + "</span>";
				num++;
				k=++i;
				console.log('k',rolist[k]);
				if(rolist[k] == 0.0){
					video += "<img src='http://localhost:9000/space/images/star00.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }else if(rolist[k] < 1.5){
	            	video += "<img src='http://localhost:9000/space/images/star10.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }else if(rolist[k] < 2.5){
	            	video += "<img src='http://localhost:9000/space/images/star20.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }else if(rolist[k] < 3.5){
	            	video += "<img src='http://localhost:9000/space/images/star30.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }else if(rolist[k] < 4.5){
	            	video += "<img src='http://localhost:9000/space/images/star40.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }else if(rolist[k] >= 4.5){
	            	video += "<img src='http://localhost:9000/space/images/star50.png'><span>"+rolist[k]+"</span></div></div></a></div>";
	            }
			}
		}
	}
	$(".slider").append(video);
	$(".video").prepend("<button class='slick-prev slick-arrow' aria-label='Previous' type='button' style=''>Previous</button>");
	$(".video").append("<button class='slick-next slick-arrow' aria-label='Next' type='button' style=''>Next</button>");
   
  	$(".slick-prev").click(function(){
  		var count = 1;
   		$(".item").each(function(){
   			$(this).attr('data-index', count++);
   			console.log('dddddd1',$(this).attr('data-index'));
   			if($(this).attr('data-index') == num){
   				$(this).attr('data-index',0);
   			}
   			if($(this).attr('data-index') >= 4) {
   	 		   	$(this).hide();
   	 	   }else {
   	 		  	$(this).show();
   	 	   }
   		});
   		$(".item:last").prependTo(".slider");
   	});
   
   	$(".slick-next").click(function(){
   		var count = num;
   		$(".item").each(function(){
   			$(this).attr('data-index', count--);
   			console.log('dddddd2',$(this).attr('data-index'));
   			if($(this).attr('data-index') == num){
   				$(this).attr('data-index',0);
   			}
   			if($(this).attr('data-index') < 4) {
   	 		   	$(this).show();
   	 	   }else {
   	 		  	$(this).hide();
   	 	   }
   		});
   		$(".item:first").appendTo(".slider");
   	});
   
   	$(".item").each(function(){
 	   	if($(this).attr('data-index') >= 4) {
 		   	$(this).hide();
 	   	}else {
 		  	$(this).show();
 	   	}
    });
   	
   	//추천 회의실 - 예약률, 평점 상위 10퍼
   	var trlist = new Array();
    <c:forEach var="toprlist" items="${topreservation}">
	    trlist.push("${toprlist.rid}");
	    trlist.push("${toprlist.rsfile1}");
	    trlist.push("${toprlist.intro}");
	    trlist.push("${toprlist.branch_name}");
	    trlist.push("${toprlist.address}".split(' ')[1]);
	    trlist.push("${toprlist.capacity}");
	    trlist.push("${toprlist.charge}");
	    trlist.push("${toprlist.grade}");
	</c:forEach>
	console.log('tr',trlist);
	
	
	var tglist = new Array();
	<c:forEach var="topglist" items="${topgrade}">
		tglist.push("${topglist.rid}");
		tglist.push("${topglist.rsfile1}");
		tglist.push("${topglist.intro}");
		tglist.push("${topglist.branch_name}");
		tglist.push("${topglist.address}".split(' ')[1]);
		tglist.push("${topglist.capacity}");
		tglist.push("${topglist.charge}");
		tglist.push("${topglist.grade}");
	</c:forEach>
	
	var recommend = "";
	var rnum = 0;
	var rk=0;
	for(var i=0;i<trlist.length;i++){
		recommend += "<div class='ritem item"+rnum+"' rdata-index='"+rnum+"'>";
		recommend += "<a href='http://localhost:9000/space/room_content.do?rid=" + trlist[i] + "&rpage=1'><img src='http://localhost:9000/space/upload/" + trlist[++i] + "' width='178px'>";
		if(trlist[++i].length > 15){
			recommend += "<div><span>" + trlist[i].substring(0,15) + "...</span>";
		}else {
			recommend += "<div><span>" + trlist[i] + "</span>";
		}
		recommend += "<span>" + trlist[++i] + "</span>";
		recommend += "<div><img src='http://localhost:9000/space/images/cont_list_detail_info01.png'><span>" + trlist[++i] + "</span>";
		recommend += "<img src='http://localhost:9000/space/images/cont_list_detail_info03.png'><span>" + trlist[++i] + "인실</span>";
		recommend += "</div><div><span class='item_price'>" + trlist[++i] + "</span>";
		rnum++;
		rk=++i;
		console.log('k',trlist[rk]);
		if(trlist[rk] == 0.0){
			recommend += "<img src='http://localhost:9000/space/images/star00.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }else if(trlist[rk] < 1.5){
           	recommend += "<img src='http://localhost:9000/space/images/star10.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }else if(trlist[rk] < 2.5){
           	recommend += "<img src='http://localhost:9000/space/images/star20.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }else if(trlist[rk] < 3.5){
           	recommend += "<img src='http://localhost:9000/space/images/star30.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }else if(trlist[rk] < 4.5){
           	recommend += "<img src='http://localhost:9000/space/images/star40.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }else if(trlist[rk] >= 4.5){
           	recommend += "<img src='http://localhost:9000/space/images/star50.png'><span>"+trlist[rk]+"</span></div></div></a></div>";
           }
	}
	var gk=0;
	for(var i=0;i<tglist.length;i++){
		recommend += "<div class='ritem item"+rnum+"' rdata-index='"+rnum+"'>";
		recommend += "<a href='http://localhost:9000/space/room_content.do?rid=" + tglist[i] + "&rpage=1'><img src='http://localhost:9000/space/upload/" + tglist[++i] + "' width='178px'>";
		if(tglist[++i].length > 15){
			recommend += "<div><span>" + tglist[i].substring(0,15) + "...</span>";
		}else {
			recommend += "<div><span>" + tglist[i] + "</span>";
		}
		recommend += "<span>" + tglist[++i] + "</span>";
		recommend += "<div><img src='http://localhost:9000/space/images/cont_list_detail_info01.png'><span>" + tglist[++i] + "</span>";
		recommend += "<img src='http://localhost:9000/space/images/cont_list_detail_info03.png'><span>" + tglist[++i] + "인실</span>";
		recommend += "</div><div><span class='item_price'>" + tglist[++i] + "</span>";
		rnum++;
		gk=++i;
		console.log('k',tglist[gk]);
		if(tglist[gk] == 0.0){
			recommend += "<img src='http://localhost:9000/space/images/star00.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }else if(tglist[gk] < 1.5){
           	recommend += "<img src='http://localhost:9000/space/images/star10.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }else if(tglist[gk] < 2.5){
           	recommend += "<img src='http://localhost:9000/space/images/star20.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }else if(tglist[gk] < 3.5){
           	recommend += "<img src='http://localhost:9000/space/images/star30.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }else if(tglist[gk] < 4.5){
           	recommend += "<img src='http://localhost:9000/space/images/star40.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }else if(tglist[gk] >= 4.5){
           	recommend += "<img src='http://localhost:9000/space/images/star50.png'><span>"+tglist[gk]+"</span></div></div></a></div>";
           }
	}
	$(".slider1").append(recommend);
	$(".rec").prepend("<button class='slick-prev1 slick-arrow' aria-label='Previous' type='button' style=''>Previous</button>");
	$(".rec").append("<button class='slick-next1 slick-arrow' aria-label='Next' type='button' style=''>Next</button>");
   
  	$(".slick-prev1").click(function(){
  		var count = 1;
   		$(".ritem").each(function(){
   			$(this).attr('rdata-index', count++);
   			if($(this).attr('rdata-index') == rnum){
   				$(this).attr('rdata-index',0);
   			}
   			if($(this).attr('rdata-index') >= 4) {
   	 		   	$(this).hide();
   	 	   }else {
   	 		  	$(this).show();
   	 	   }
   		});
   		$(".ritem:last").prependTo(".slider1");
   	});
   
   	$(".slick-next1").click(function(){
   		var count = rnum;
   		$(".ritem").each(function(){
   			$(this).attr('rdata-index', count--);
   			console.log('dddddd',$(this).attr('rdata-index'));
   			if($(this).attr('rdata-index') == rnum){
   				$(this).attr('rdata-index',0);
   			}
   			if($(this).attr('rdata-index') < 4) {
   	 		   	$(this).show();
   	 	   }else {
   	 		  	$(this).hide();
   	 	   }
   		});
   		$(".ritem:first").appendTo(".slider1");
   	});
   
   	$(".ritem").each(function(){
 	   	if($(this).attr('rdata-index') >= 4) {
 		   	$(this).hide();
 	   	}else {
 		  	$(this).show();
 	   	}
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

    $(".item_price").each(function(){
    	var price = number_format($(this).text());
    	$(this).text(number_format(price)+"원");
    });
   	console.log('999',$(".item_price").text());
	
});
</script>
</head>
<body>
<!-- header -->
	<jsp:include page="header_main.jsp"></jsp:include>
	<!-- content -->
	
	<!-- s container -->
	<div class="container">
		<h2 id="content" class="hidden">콘텐츠 영역</h2>
		
	<!-- s main_visual -->
   <div class="visual">
      <div class="visual_box">
         <div class="main_visual_text_box">
            <div class="main_visual_text_box_logo"><span>스페이스닷컴</span></div>
            <p class="main_visual_text_box_text"><span>회의실의 모든 것. 비즈니스 모임공간 최저가로 한번에 비교! <br>
                        수도권 회의실 매칭 플랫폼</span></p>
         </div>
         <div class="search_box">
            <ul class="search_box_list">
               <li>
                  <label>
                     <span><img src="http://localhost:9000/space/images/search_icon_location.png"></span>
                     <input type="text" name="location" id="search_location" placeholder="지역" readonly>
                  </label>
                  <button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
                  <div class="select_data location">
                     <p>방문할 지역을 선택해주세요</p>
                     <div>
                        <ul class="location_list">
                           <li>
                              <span class="main_location">서울</span>
                              <ul class="seoul">                              
                              </ul>
                           </li>
                           <li>
                              <span class="main_location">경기</span>
                              <ul class="gyeonggi">                              
                              </ul>
                           </li>                                                
                           <li>
                              <span class="main_location">인천</span>
                              <ul class="incheon">                              
                              </ul>
                           </li>                                                
                        </ul>
                     </div>
                  </div>
               </li>
               <li class="btn_search_style">
                  <button type="button" class="btn_search">검색하기</button>
               </li>
            </ul>   
         </div>
      </div>
   </div>
   <!-- e main_visual -->

	<div class="main_content">
		<!-- 화상 회의실 -->
		<div class="video">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>화상 회의실</span> 보유 센터</p>
				<p class="main_stit01">줌, 스카이프, 팀즈, 시스코, 폴리콤 등 화상 회의가 가능한 센터입니다.</p>
			</div>
			<div class="slider">
			</div>
		</div>
		
		<!-- 추천 회의실(예약률, 평점) -->
		<div class="rec_background"><div class="rec">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>스페이스닷컴</span> 추천 회의실</p>
				<p class="main_stit01">예약률, 평점 등 상위 랭킹에 등록된 센터 입니다.</p>
			</div>
			<div class="slider1">
			</div>
		</div></div>
   </div>
	<!-- s main_count -->
   <div class="section count">
      <div class="section_center_box">
         <div class="main_count_content_box">
            <div class="main_count_location"><img src="http://localhost:9000/space/images/main_section06_img01.png" alt="지도">
            </div>
            <div class="mcounton06_text">
               <p class="main_count_tit">
                  <span>국내 최초의</span><br>
                  회의실 전문 매칭 플랫폼
               </p>
               <p class="main_count_stit">
                  스페이스닷컴은 좋은 회의실을 누구나 쉽고 빠르게<br>
                  이용할 수 있도록 연결합니다.
               </p>
               <ul class="main_count_list">
                  <li>
                     <span id="count01" class="main_count_list_num"></span>
                     <span class="main_count_list_text">누적 예약 수</span>
                  </li>
                  <li>
                     <span id="count02" class="main_count_list_num"></span>
                     <span class="main_count_list_text">등록된 총 회의실 수</span>
                  </li>
                  <li>
                     <span id="count03" class="main_count_list_num"></span>
                     <span class="main_count_list_text">누적 리뷰 수</span>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
   <!-- s main_count -->
	
	
   </div>
</body>
</html>