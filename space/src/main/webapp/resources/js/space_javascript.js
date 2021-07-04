function mainVisualSlider() {
	var targetLeng01 = $('.main_visual_slide01 > div').length,
		targetLeng01s = parseInt(targetLeng01/6);
	var targetLeng02 = $('.main_visual_slide02 > div').length,
		targetLeng02s = parseInt(targetLeng02/6);

	function mainVisualSliderBtnSetting(t, n) {
		t.addClass('x'+n);
		for(var i = 1; i <= n; i++){
			t.append('<button type="button" title="' + i + '"></button>')
		}
	}
	if(targetLeng01 > 6) {
		if((targetLeng01%6) > 0){
			targetLeng01s = targetLeng01s+1;
		}
		mainVisualSliderBtnSetting($('.main_visual_slide_box01 .main_visual_slide_nav'), targetLeng01s);
	} else {
		mainVisualSliderBtnSetting($('.main_visual_slide_box01 .main_visual_slide_nav'), 1);
	}

	if(targetLeng02 > 6) {
		if((targetLeng02%6) > 0){
			targetLeng02s = targetLeng02s+1;
		}
		mainVisualSliderBtnSetting($('.main_visual_slide_box02 .main_visual_slide_nav'), targetLeng02s);
	} else {
		mainVisualSliderBtnSetting($('.main_visual_slide_box02 .main_visual_slide_nav'), 1);
	}

	$('.main_visual_slide_nav > button:first-child').addClass('on');

	$('.main_visual_slide').each(function(cusidx){
		$(this).slick({
			dots:false,
			arrows:false,
			infinite:true,
			slidesToShow:6,
			slidesToScroll:6,
			speed:300,
			autoplay:true,
			autoplaySpeed:4000,
			pauseOnHover:false
			//variableWidth:true
		});
	});

	$('.main_visual_slide').on('afterChange', function(event, slick, currentSlide, nextSlide){
		var cusCounter01 = parseInt(currentSlide/6);
		var cusCounter02 = parseInt(currentSlide/6);
		cusCounter01 = cusCounter01+1;
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_index').text('0' + cusCounter01);
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_nav button').removeClass('on');
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_nav button').eq(cusCounter02).addClass('on');

	});

	$('.main_visual_slide_nav button').on('click', function(e){
		var target = $(this).index();
		target = parseInt(target*6);

		$(this).parents('.main_visual_slide_control').siblings('.main_visual_slide').slick('slickGoTo',target);

	});
}
function section01Slider() {
	$('.main_section01_slide_box').slick({
		dots:true,
		arrows:false,
		infinite:true,
		slidesToShow:1,
		slidesToScroll:1,
		speed:300,
		autoplay: true,
		autoplaySpeed: 6000
	});
}
function section05Slider() {
	$('.main_section05_slide_box').slick({
		dots:true,
		arrows:false,
		infinite:true,
		slidesToShow:1,
		slidesToScroll:1,
		speed:300,
		autoplay: true,
		autoplaySpeed: 5000
	});
}

function mainSlider01() {
	$('.md_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.md_slider_wrap .left',
		nextArrow:'.md_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}
function mainSlider02() {
	$('.popularity_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.popularity_slider_wrap .left',
		nextArrow:'.popularity_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}
function mainSlider03() {
	$('.discount_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.discount_slider_wrap .left',
		nextArrow:'.discount_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}

// gnb
$(function(){
	var gnb = $('#gnb'),
		gnbDepth01 = $('.depth1 h3 a'),
		gnbDepth02 = $('.depth2 h4 a'),
		depth01 = $('.depth1'),
		depth02 = $('.depth2'),
		depth02li = $('.depth2 li'),
		gnbBg = $('.header_bg_box'),
		gnbSpeed = 250,
		logo = $('.logo a img'),
		logoSrc,
		gnbEtc = $('.gnb_etc');

	gnb.on('mouseenter', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
	});
	gnb.on('mouseleave', function(){
		gnb.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});

	gnbDepth01.on('mouseenter focusin', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
		depth01.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		depth02.slideUp(gnbSpeed);
		$(this).parents('.depth1').find('.depth2').slideDown(gnbSpeed);
	});
	gnbDepth01.on('mouseleave focusout', function(){
		depth01.removeClass('focus');
	});

	gnbDepth02.on('mouseenter focusin', function(){
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		$(this).parent().parent().addClass('focus');
	});

	gnbDepth02.on('mouseleave focusout', function(){
		$(this).parent().parent().removeClass('focus');
	});

	depth01.last().find('.depth2').find('li').last().find('h4').find('a').on('focusout', function(){
		gnb.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});
});

$(function(){
	/*$('.main_visual_search_btn').on('click', function(e){
		e.stopPropagation();
		$('.main_visual_search_list').fadeIn(1000);
	});*/
	// $('.main_visual_search_text').on('change', function(e){
	//     if($(this).val() !== ""){
	//         $('.main_visual_search_list').fadeIn(1000);
	//     }
	// });
	/*$('body').on('click', function(){
		$('.main_visual_search_list').fadeOut(1000);
	});*/

});

$(function(){
			mainVisualSlider();
			section01Slider();
			section05Slider();
			mainSlider01();
			mainSlider02();
			mainSlider03();

			var count01 = $('#count01').html(),
				count02 = $('#count02').html(),
				count03 = $('#count03').html();
			count01 = count01.replace(',','');
			count02 = count02.replace(',','');
			count03 = count03.replace(',','');
			var count01Target = new CountUp('count01',0,count01,0,5),
				count02Target = new CountUp('count02',0,count02,0,5),
				count03Target = new CountUp('count03',0,count03,0,5);

			$(window).on('mousewheel scroll', function(){
				var thisTop = $(this).scrollTop(),
					thisHeight = $(this).outerHeight(true),
					thisBottom = thisTop + thisHeight;

				var targetOffsetTop = $('.section06').offset().top;
				var targetOffsetHeight = $('.section06').outerHeight();
				var targetOffsetBottom = targetOffsetTop + targetOffsetHeight;


				if(((targetOffsetTop <= thisBottom) && (targetOffsetBottom >= thisTop))) {

					count01Target.start();
					count02Target.start();
					count03Target.start();
				}
			});

		});
		
		//
function parent_on(e) {
	e.parent().siblings().removeClass('on');
	e.parent().addClass('on');
}
function parent_off(e) {
	e.parent().removeClass('on');
}
function parent_focus_on(e) {
	e.parent().siblings().removeClass('focus');
	e.parent().addClass('focus');
}
function parent_focus_off(e) {
	e.parent().removeClass('focus');
}
function this_on(e) {
	e.addClass('on');
}
function this_off(e) {
	e.removeClass('on');
}

// gnb
$(function(){

});

//quick_menu
$(function(){
	if($('.quick_menu').is(':visible')){
		var quick = $('.quick_menu'),
			quickTop = quick.offset().top,
			quickSts = 0;
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			if(scrollTop > quickTop && quickSts === 0){
				quick.stop().animate({top:(scrollTop+30)}, 500);
			} else if(scrollTop <= quickTop) {
				quick.stop().animate({top:(quickTop)}, 500);
			}
		});
	}
});

//hover focus click
$(function(){
	$('.f_effect a').on('mouseenter focusin',function(e){
		var target = $(e.currentTarget);
		parent_focus_on(target);
	});
	$('.f_effect a').on('mouseleave focusout',function(e){
		var target = $(e.currentTarget);
		parent_focus_off(target);
	});

	$('.hf_effect a').on('mouseenter focusin',function(e){
		var target = $(e.currentTarget);
		this_on(target);
	});
	$('.hf_effect a').on('mouseleave focusout',function(e){
		var target = $(e.currentTarget);
		this_off(target);
	});

	$('.hf_effect02 a').on('mouseenter focusin',function(e){
		var target = $(e.currentTarget);
		parent_on(target);
	});
	$('.hf_effect02 a').on('mouseleave focusout',function(e){
		var target = $(e.currentTarget);
		parent_off(target);
	});

	$('.hf_effect03 a').on('mouseenter focusin',function(e){
		var target = $(e.currentTarget);
		parent_focus_on(target);
	});
	$('.hf_effect03 a').on('mouseleave focusout',function(e){
		var target = $(e.currentTarget);
		parent_focus_off(target);
	});
	$('.hf_effect03 a').on('click', function(e){
		var target = $(e.currentTarget);
		parent_on(target);
	});

	$('.cl_effect button').on('click', function(e){
		var target = $(e.currentTarget);
		if($(this).hasClass('on')){
			this_off(target);
		} else {
			this_on(target);
		}
	});

	$('.cl_effect02 button').on('click', function(e){
		var target = $(e.currentTarget);
		if($(this).hasClass('on')){
			this_off(target);
		} else {
			$(this).parents('.cl_effect02').find('button').removeClass('on');
			this_on(target);
		}
	});

});

$(function(){
	var checkBtn = $('.cus_check_box_btn');
	var checkLabel = $('.cus_check_label');
	var checkBtn02 = $('.cus_check_box_btn02');
	var checkLabel02 = $('.cus_check_label02');
	var checkBtn03 = $('.cus_check_box_btn03');
	var checkLabel03 = $('.cus_check_label03');

	checkBtn.on('click', function(){
		if(!$(this).hasClass('on')){
			$(this).addClass('on');
			$(this).prev('.cus_check_box_input').prop('checked', true);
		} else {
			$(this).removeClass('on');
			$(this).prev('.cus_check_box_input').prop('checked', false);
		}
	});

	checkLabel.on('click', function(){
		// $(this).prev('.cus_check_box_btn').trigger('click');

		if(!$(this).prev('.cus_check_box_btn').hasClass('on')){
			$(this).prev('.cus_check_box_btn').addClass('on');
		} else {
			$(this).prev('.cus_check_box_btn').removeClass('on');
		}
	});

	checkBtn02.on('click', function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		} else {
			$(this).addClass('on');
		}
		// $(this).prev('.cus_check_box_input').prop('checked', true);
		$(this).parent('.cus_chk_sect').siblings('.cus_chk_sect').find('.cus_check_box_input').prop('checked', false);
		$(this).parent('.cus_chk_sect').siblings('.cus_chk_sect').find('.cus_check_box_btn02').removeClass('on');
	});
	checkLabel02.on('click', function(){
		// $(this).prev('.cus_check_box_btn02').trigger('click');
		// $(this).prev().prev('.cus_check_box_input').prop('checked', true);
		if($(this).prev('.cus_check_box_btn02').hasClass('on')){
			$(this).prev('.cus_check_box_btn02').removeClass('on');
		} else {
			$(this).prev('.cus_check_box_btn02').addClass('on');
		}
		$(this).parent('.cus_chk_sect').siblings('.cus_chk_sect').find('.cus_check_box_input').prop('checked', false);
		$(this).parent('.cus_chk_sect').siblings('.cus_chk_sect').find('.cus_check_box_btn02').removeClass('on');
	});

	checkBtn03.on('click', function(){
		if($(this).hasClass('on')){
			$(this).removeClass('on');
		} else {
			$(this).addClass('on');
		}
		// $(this).prev('.cus_check_box_input').prop('checked', true);
		$(this).parent('li').siblings('li').find('.cus_check_box_input').prop('checked', false);
		$(this).parent('li').siblings('li').find('.cus_check_box_btn03').removeClass('on');
	});
	checkLabel03.on('click', function(){
		// $(this).prev('.cus_check_box_btn03').trigger('click');
		// $(this).prev().prev('.cus_check_box_input').prop('checked', true);
		if($(this).prev('.cus_check_box_btn03').hasClass('on')){
			$(this).prev('.cus_check_box_btn03').removeClass('on');
		} else {
			$(this).prev('.cus_check_box_btn03').addClass('on');
		}

		$(this).parent('li').siblings('li').find('.cus_check_box_input').prop('checked', false);
		$(this).parent('li').siblings('li').find('.cus_check_box_btn03').removeClass('on');
	});
});

//
function bb_file_upload(){
	var file = $('.bb_ipt_file');
	file.on('change', function(){
		var flag = $(this)[0].files[0];
		var text = $(this).siblings('.bb_file_txt');
		if (flag != undefined){
			var value = $(this)[0].files[0].name;
			text.text(value);
		} else {
			text.text('');
		}
	});

	/* label button */
	var fileBtn = $('.bb_file_lbl');
	fileBtn.on('click', function(){
		$(this).prev('.bb_ipt_file').trigger('click');
	});
}
//
$(function(){
	$('.print_btn').on('click', function(){
		window.print();
	});
});


//
$(function(){
	var initViewTop = $(window).scrollTop(),
		initViewHeight = $(window).outerHeight(true),
		initViewBottom = initViewTop + initViewHeight;

	$('.s_obj').each(function(){
		var initElementTop = $(this).offset().top,
			initElementHeight = $(this).outerHeight(),
			initElementBottom = initElementTop + initElementHeight;

		if(((initElementTop <= initViewBottom) && (initElementBottom >= initViewTop))) {
			$(this).removeClass('active');
		} else {
			$(this).addClass('active');
		}
	});

	$(window).on("mousewheel scroll", function(){
		var viewTop = $(this).scrollTop(),
			viewHeight = $(this).outerHeight(true),
			viewBottom = viewTop + viewHeight;

		$('.s_obj').each(function(){
			var elementTop = $(this).offset().top,
				elementHeight = $(this).outerHeight(),
				elementBottom = elementTop + elementHeight;

			if(((elementTop <= viewBottom) && (elementBottom >= viewTop))) {
				$(this).removeClass('active');
			}
			// else {
			// 	$(this).addClass('active');
			// }
		});
	});
});









function mainVisualSlider() {
	var targetLeng01 = $('.main_visual_slide01 > div').length,
		targetLeng01s = parseInt(targetLeng01/6);
	var targetLeng02 = $('.main_visual_slide02 > div').length,
		targetLeng02s = parseInt(targetLeng02/6);

	function mainVisualSliderBtnSetting(t, n) {
		t.addClass('x'+n);
		for(var i = 1; i <= n; i++){
			t.append('<button type="button" title="' + i + '"></button>')
		}
	}
	if(targetLeng01 > 6) {
		if((targetLeng01%6) > 0){
			targetLeng01s = targetLeng01s+1;
		}
		mainVisualSliderBtnSetting($('.main_visual_slide_box01 .main_visual_slide_nav'), targetLeng01s);
	} else {
		mainVisualSliderBtnSetting($('.main_visual_slide_box01 .main_visual_slide_nav'), 1);
	}

	if(targetLeng02 > 6) {
		if((targetLeng02%6) > 0){
			targetLeng02s = targetLeng02s+1;
		}
		mainVisualSliderBtnSetting($('.main_visual_slide_box02 .main_visual_slide_nav'), targetLeng02s);
	} else {
		mainVisualSliderBtnSetting($('.main_visual_slide_box02 .main_visual_slide_nav'), 1);
	}

	$('.main_visual_slide_nav > button:first-child').addClass('on');

	$('.main_visual_slide').each(function(cusidx){
		$(this).slick({
			dots:false,
			arrows:false,
			infinite:true,
			slidesToShow:6,
			slidesToScroll:6,
			speed:300,
			autoplay:true,
			autoplaySpeed:4000,
			pauseOnHover:false
			//variableWidth:true
		});
	});

	$('.main_visual_slide').on('afterChange', function(event, slick, currentSlide, nextSlide){
		var cusCounter01 = parseInt(currentSlide/6);
		var cusCounter02 = parseInt(currentSlide/6);
		cusCounter01 = cusCounter01+1;
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_index').text('0' + cusCounter01);
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_nav button').removeClass('on');
		$(this).siblings('.main_visual_slide_control').find('.main_visual_slide_nav button').eq(cusCounter02).addClass('on');

	});

	$('.main_visual_slide_nav button').on('click', function(e){
		var target = $(this).index();
		target = parseInt(target*6);

		$(this).parents('.main_visual_slide_control').siblings('.main_visual_slide').slick('slickGoTo',target);

	});
}
function section01Slider() {
	$('.main_section01_slide_box').slick({
		dots:true,
		arrows:false,
		infinite:true,
		slidesToShow:1,
		slidesToScroll:1,
		speed:300,
		autoplay: true,
		autoplaySpeed: 6000
	});
}
function section05Slider() {
	$('.main_section05_slide_box').slick({
		dots:true,
		arrows:false,
		infinite:true,
		slidesToShow:1,
		slidesToScroll:1,
		speed:300,
		autoplay: true,
		autoplaySpeed: 5000
	});
}

function mainSlider01() {
	$('.md_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.md_slider_wrap .left',
		nextArrow:'.md_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}
function mainSlider02() {
	$('.popularity_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.popularity_slider_wrap .left',
		nextArrow:'.popularity_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}
function mainSlider03() {
	$('.discount_slider').slick({
		dots:false,
		arrows:true,
		infinite:true,
		slidesToShow:4,
		slidesToScroll:1,
		speed:300,
		prevArrow:'.discount_slider_wrap .left',
		nextArrow:'.discount_slider_wrap .right',
		autoplay:true,
		autoplaySpeed:5000,
		pauseOnHover:false,
		variableWidth:true,
		focusOnSelect:true
	});
}

// gnb
$(function(){
	var gnb = $('#gnb'),
		gnbDepth01 = $('.depth1 h3 a'),
		gnbDepth02 = $('.depth2 h4 a'),
		depth01 = $('.depth1'),
		depth02 = $('.depth2'),
		depth02li = $('.depth2 li'),
		gnbBg = $('.header_bg_box'),
		gnbSpeed = 250,
		logo = $('.logo a img'),
		logoSrc,
		gnbEtc = $('.gnb_etc');

	gnb.on('mouseenter', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
	});
	gnb.on('mouseleave', function(){
		gnb.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});

	gnbDepth01.on('mouseenter focusin', function(){
		gnb.addClass('on');
		gnbBg.addClass('on');
		gnbEtc.addClass('on');
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_off','_on');
		logo.attr('src', logoSrc);
		depth01.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		depth02.slideUp(gnbSpeed);
		$(this).parents('.depth1').find('.depth2').slideDown(gnbSpeed);
	});
	gnbDepth01.on('mouseleave focusout', function(){
		depth01.removeClass('focus');
	});

	gnbDepth02.on('mouseenter focusin', function(){
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		$(this).parents('.depth1').addClass('focus');
		$(this).parent().parent().addClass('focus');
	});

	gnbDepth02.on('mouseleave focusout', function(){
		$(this).parent().parent().removeClass('focus');
	});

	depth01.last().find('.depth2').find('li').last().find('h4').find('a').on('focusout', function(){
		gnb.removeClass('on');
		gnbBg.removeClass('on');
		gnbEtc.removeClass('on');
		depth01.removeClass('focus');
		depth02li.removeClass('focus');
		depth02.stop(true).slideUp(gnbSpeed);
		logoSrc = logo.attr('src');
		logoSrc = logoSrc.replace('_on','_off');
		logo.attr('src', logoSrc);
	});
});

$(function(){
	/*$('.main_visual_search_btn').on('click', function(e){
		e.stopPropagation();
		$('.main_visual_search_list').fadeIn(1000);
	});*/
	// $('.main_visual_search_text').on('change', function(e){
	//     if($(this).val() !== ""){
	//         $('.main_visual_search_list').fadeIn(1000);
	//     }
	// });
	/*$('body').on('click', function(){
		$('.main_visual_search_list').fadeOut(1000);
	});*/

});




// gnb
$(function(){
	var subGnb = $('#subGnb'),
		subGnbDepth01 = $('.sub_depth1 h3 a'),
		subGnbDepth02 = $('.sub_depth2 h4 a'),
		subDepth01 = $('.sub_depth1'),
		subDepth02 = $('.sub_depth2'),
		subDepth02li = $('.sub_depth2 li'),
		subGnbBg = $('.sub_header_bg_box'),
		subGnbSpeed = 250,
		subGnbEtc = $('.gnb_etc');

	subGnb.on('mouseenter', function(){
		//subGnbBg.addClass('on');
		//subGnbEtc.addClass('on');
	});
	subGnb.on('mouseleave', function(){
		//subGnbBg.removeClass('on');
		//subGnbEtc.removeClass('on');
		subDepth01.removeClass('focus');
		subDepth02li.removeClass('focus');
		subDepth02.stop(true).slideUp(subGnbSpeed);
	});

	subGnbDepth01.on('mouseenter focusin', function(){
		//subGnbBg.addClass('on');
		//subGnbEtc.addClass('on');
		subDepth01.removeClass('focus');
		$(this).parents('.sub_depth1').addClass('focus');
		subDepth02.slideUp(subGnbSpeed);
		$(this).parents('.sub_depth1').find('.sub_depth2').slideDown(subGnbSpeed);
	});
	subGnbDepth01.on('mouseleave focusout', function(){
		subDepth01.removeClass('focus');
	});

	subGnbDepth02.on('mouseenter focusin', function(){
		subDepth01.removeClass('focus');
		subDepth02li.removeClass('focus');
		$(this).parents('.sub_depth1').addClass('focus');
		$(this).parent().parent().addClass('focus');
	});

	subDepth02.on('mouseleave focusout', function(){
		$(this).parent().parent().removeClass('focus');
	});

	subDepth01.last().find('.sub_depth2').find('li').last().find('h4').find('a').on('focusout', function(){
		//subGnbBg.removeClass('on');
		//subGnbEtc.removeClass('on');
		subDepth01.removeClass('focus');
		subDepth02li.removeClass('focus');
		subDepth02.stop(true).slideUp(subGnbSpeed);
	});

});