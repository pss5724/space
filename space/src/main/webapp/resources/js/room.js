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
	

	

});