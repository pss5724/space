$(document).ready(function() {
	
	$("html").click(function(e) { 
		if(!$(e.target).is(".select_data") && !$(e.target).is(".select_data ul") && !$(e.target).is("label input") 
				&& !$(e.target).is(".select_data.type *") && !$(e.target).is(".before-month") && !$(e.target).is(".next-month")) { 
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
	

	/* 날짜 선택 */
 	$('*[name=date]').appendDtpicker({
		locale:"ko",
		futureOnly: true,
		minuteInterval: 30,
		dateFormat:"YYYY.MM.DD hh:mm"
    });
   
	/* 지역 선택 */
	$(".main_location").click(function() {
		$("#search_location").val($(this).text());	
		$(".location").removeClass("on");
	});
	
	/* 타입 및 인원수 선택 */	
	$(".up").click(function() {
		var capacity = $(this).siblings(".room_capacity").val();
		capacity = Number(capacity);
		
		$(this).siblings(".room_capacity").val(capacity+5); //5씩 증가
		$(this).siblings(".down").addClass("active");
		$(this).parent().parent().siblings().find("input").val("0"); //다른 옵션 초기화
		$(this).parent().parent().siblings().find(".down").removeClass("active");
		
		var type = $(this).parent().siblings("span").text(); //선택한 타입
		$("#search_type").val(type + " " + $(this).siblings(".room_capacity").val());
	});
	
	$(".down").click(function() {
		var capacity = $(this).siblings(".room_capacity").val();
		capacity = Number(capacity);
		var type = $(this).parent().siblings("span").text();
		
		if(capacity > 5) {
			$(this).siblings(".room_capacity").val(capacity-5);
			$("#search_type").val(type + " " + $(this).siblings(".room_capacity").val());
		} else if(capacity > 0 && capacity <= 5) {
			$(this).siblings(".room_capacity").val(capacity-5);
			$("#search_type").val("");
			$(this).removeClass("active");
		}
	});

	/* 옵션 검색 더보기 */
	$(".btn_more").click(function() {
		$(this).siblings("ul").toggleClass("more");
		
		if($(this).siblings("ul").hasClass("more")) {
			$(this).children("span").text("접기");
			$(this).children("img").attr("src", "http://localhost:9000/space/images/btn_less_img.png");
		} else {
			$(this).children("span").text("더보기");
			$(this).children("img").attr("src", "http://localhost:9000/space/images/btn_more_img.png");
		}
	});
	
	/* 지도 모달창 */
	$("#map").click(function(){
		$("#modal").show();
		$("#overlay").css({"opacity":"1","pointer-events":"auto"});
	});
	$("#exit").click(function(){
		$("#modal").hide();
		$("#overlay").css({"opacity":"0","pointer-events":"none"});
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
		
	/* 금액 슬라이더 */
	$("#slider-range").slider({
		range: true,
		min: 0,
		max: 1000000,
		values: [ 0, 1000000 ],
		slide: function( event, ui ) {
			$("#pay1").html(number_format(ui.values[0]));
			$("#pay2").html(number_format(ui.values[1]));
		}
	});
	
 	$("#pay1").html(number_format($( "#slider-range" ).slider( "values", 0 )));
	$("#pay2").html(number_format($( "#slider-range" ).slider( "values", 1 )));
	

});