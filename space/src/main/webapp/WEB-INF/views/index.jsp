<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>스페이스 닷컴</title>
<link rel="stylesheet" href="http://localhost:9000/space/css/space.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/carousel.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery.simple-dtpicker.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/space/js/space_javascript.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.countup.js"></script>
<script src="http://localhost:9000/space/js/jquery.simple-dtpicker.js"></script>
<script src="http://localhost:9000/space/js/jquery-ui.js"></script>
<script>
</script>
<style>
header {
	height:0;
	display:absolute;
}
.visual {
	box-sizing:border-box;
	position:relative;
	width:100%;
	min-width:1280px;
	height:646px;
	padding-top:182px;
	background:url('http://localhost:9000/space/images/main_visual.png') no-repeat top center;
}

.visual_box {
	width:1200px;
	margin:0 auto;
}

.main_visual_text_box {
	margin-bottom:30px;
	font-size:0;
}
.main_visual_text_box_logo {
	display:inline-block;
	vertical-align:top;
}
.main_visual_text_box_text {
	position:relative;
	display:inline-block;
	vertical-align:top;
	padding-left:19px;
	margin-left:18px;
	font-family:"nanumsquare-r";
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

.main_visual_search_text {
	width:calc(100% - 33px);
	height:18px;
	margin-left:15px;
	vertical-align:top;
	border:none;
	background:none;
}


/* } */

.main_tit_box{
	position:relative;
	margin-bottom:36px;
	font-weight:bold;
}

.main_tit_box.line:after, .main_tit_box.line:before {
	content:'';
	display:block;
	width:450px;
	height:1px;
	position:absolute;
	top:60%;
	background:#e5e5e5;
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
/* }  */

/************************* carousel *****************************************/
#demo, .section  {
	width:100%;
	min-width:1280px;
}
#demo, .section_center_box, .center_box {
	width:1200px;
	margin:0 auto;
	}
.carousel-inner {
	text-align:center;
	margin-top:80px;
}
.carousel-inner img {
	border-radius:7px;

}

/********************************end carousel *********************************/

/* 02 */

.section.section02 {
	padding:95px 0 100px;
	background:#ffffff;
}
/*02*/

/*03*/
.section.section03 {
	padding:75px 0 80px;
	background:url('http://localhost:9000/space/images/main_section03_bg.jpg') no-repeat center;
}
/* 03*/

/* 04*/
.section.section04 {
	padding:75px 0 25px;
}

/*04 */

/* 05*/
.section.section05 {
	position:relative;
	height:340px;
}
.section.section05:before {
	content:'';
	display:block;
	width:100%;
	height:200px;
	position:absolute;
	left:0;
	top:50%;
	margin-top:-100px;
	background:#dbf0f6;
}
.section.section05 .section_center_box {
	position:relative;
}
.main_section05_slide_box a {
	display:block;
}
.main_section05_slide_box .slick-dots {
	position:absolute;
	right:10px;
	bottom:20px;
}
.main_section05_slide_box .slick-dots li {
	float:left;
	line-height:0;
}
.main_section05_slide_box .slick-dots li button {
	box-sizing:content-box;
	overflow:hidden;
	text-indent:-9999px;
	width:8px;
	height:8px;
	margin:4px;
	border-radius:50%;
	border:none;
	background:#7f8688;
}
.main_section05_slide_box .slick-dots li.slick-active button {
	margin:0;
	background:none;
	border:4px solid #413f3f;
}
/* 05 */

/*06 */
.section.section06 {
	padding:55px 0 65px;
}
.main_section06_content_box:after {
	content:'';
	display:block;
	clear:both;
}
.main_section06_content_box > div {
	float:left;
}
.main_section06_content_box_location {
	width:545px;
}
.main_section06_content_box_text {
	box-sizing:border-box;
	width:655px;
	padding-left:17px;
}
.main_section06_content_box_tit {
	padding-top:90px;
	padding-left:70px;
	font-family:"nanumsquare-r";
	font-size:42px;
	line-height:52px;
	color:#252626;
	letter-spacing:-2px;
}
.main_section06_content_box_tit span {
	position:relative;
	display:inline-block;
	vertical-align:top;
	font-size:42px;
	line-height:52px;
	color:#252626;
}
.main_section06_content_box_tit span:after {
	content:'';
	display:block;
	width:29px;
	height:41px;
	background:url('http:/localhost:9000/space/images/main_section06_content_box_tit_mark.png') no-repeat left top;
	position:absolute;
	top:3px;
	right:-34px;
}

.main_section06_content_box_stit {
	margin-top:10px;
	padding-left:70px;
	font-size:16px;
	line-height:26px;
	color:#252626;
	letter-spacing:-1px;
}

.main_section06_content_box_list {
	margin-top:50px;
}
.main_section06_content_box_list:after {
	content:'';
	display:block;
	clear:both;
}
.main_section06_content_box_list li {
	position:relative;
	float:left;
	width:210px;
}
.main_section06_content_box_list li + li:after {
	content:'';
	display:block;
	width:1px;
	height:100%;
	background:#d3d4d4;
	position:absolute;
	left:0;
	top:0;
}
.main_section06_content_box_list_num {
	display:block;
	font-size:55px;
	line-height:55px;
	color:#3a7fb9;
	letter-spacing:-2px;
	text-align:center;
}
.main_section06_content_box_list_text {
	display:block;
	margin-top:10px;
	font-size:18px;
	line-height:18px;
	color:#252626;
	letter-spacing:-2px;
	text-align:center;
}

/* 리스트 { */
.cont_list:after {
	content:'';
	display:block;
	clear:both;
}
.cont_list > li {
	float:left;
	width:285px;
	height:400px;
	margin-left:20px;
}
.cont_list > li:nth-of-type(4n + 1) {
	margin-left:0;
}
.cont_list.type02 > li {
	width:283px;
	height:400px;
	margin-left:20px;
}
.cont_list.type02 > li:nth-of-type(3n + 1) {
	margin-left:0;
}
.cont_list.type02 > li + li + li + li {
	margin-top:20px;
}

.move_box {
	overflow:hidden;
	display:block;
	border-radius:15px;
	transition:transform 0.5s;
	width:300px;
	
}
.cont_list > li.on .move_box {
	-webkit-transform:translateY(-10px);
	-moz-transform:translateY(-10px);
	-ms-transform:translateY(-10px);
	-o-transform:translateY(-10px);
	transform:translateY(-10px);
	-webkit-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
	-moz-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
	box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
}

.cont_list_thum {
	position:relative;
	z-index:1;
	width:100%;
	height:200px;
}
.cont_list_thum_cover {
	box-sizing:border-box;
	display:block;
	position:absolute;
	width:200px;
	height:40px;
	padding:4px 0;
	font-family:"nanumsquare-r";
	font-size:12px;
	line-height:15px;
	color:#ffffff;
	text-align:center;
	-webkit-transform:rotate(-45deg);
	-moz-transform:rotate(-45deg);
	-ms-transform:rotate(-45deg);
	-o-transform:rotate(-45deg);
	transform:rotate(-45deg);
	left:-50px;
	top:32px;
	background:url('http://localhost:9000/space/images/cont_list_thum_cover_bg.jpg') repeat-y left top;
}
.cont_list_thum .heart_btn {
	width:30px;
	height:30px;
	position:absolute;
	right:10px;
	bottom:10px;
	border:none;
	background:url('http://localhost:9000/space/images/heart_off.png') no-repeat left top;
}
.cont_list_thum .heart_btn.on {
	background:url('http://localhost:9000/space/images/heart_on.png') no-repeat left top;
}

.cont_list_detail {
	position:relative;
	z-index:0;
	box-sizing:border-box;
	height:215px;
	padding:32px 17px 17px;
	margin-top:-15px;
	border-radius:15px;
	border:1px solid #ebebeb;
	background:#ffffff;
	font-weight:bold;
}
.cont_list_detail_tit {
	width:100%;
	font-size:20px;
	line-height:20px;
	color:#252626;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
.cont_list_detail_stit {
	width:100%;
	margin-bottom:8px;
	font-size:15px;
	line-height:15px;
	color:#3875e6;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
	letter-spacing:-1px;
}

.cont_list_detail_info {
	margin-top:38px;
}
.cont_list_detail_info_l {
}
.cont_list_detail_info_l li {
	position:relative;
	display:inline-block;
	padding-left:14px;
	margin-right:32px;
	font-size:14px;
	line-height:14px;
	color:#444444;
	vertical-align:top;
}
.cont_list_detail_info_l .mark:before {
	content:'';
	display:block;
	width:11px;
	height:15px;
	position:absolute;
	left:0;
	top:0;
	background:url('http://localhost:9000/space/images/cont_list_detail_info01.png') no-repeat left top;
}
.cont_list_detail_info_l .subway:before {
	content:'';
	display:block;
	width:12px;
	height:14px;
	position:absolute;
	left:0;
	top:0;
	background:url('http://localhost:9000/space/images/images/cont_list_detail_info02.png') no-repeat left top;
}
.cont_list_detail_info_m {
	box-sizing:border-box;
	width:100%;
	position:relative;
	padding-left:14px;
	font-family:"nanumsquare-b";
	font-size:14px;
	line-height:14px;
	color:#444444;
	vertical-align:top;
	overflow:hidden;
	text-overflow:ellipsis;
	white-space:nowrap;
}
.cont_list_detail_info_m:before {
	content:'';
	display:block;
	width:12px;
	height:14px;
	position:absolute;
	left:0;
	top:0;
	background:url('http://localhost:9000/space/images/cont_list_detail_info03.png') no-repeat left top;
}

.cont_list_detail_ps {
	width:calc(100% - 34px);
	display:table;
	position:absolute;
	left:17px;
	bottom:16px;
}
.cont_list_detail_ps p {
	display:table-cell;
	width:50%;
	vertical-align:middle;
}
.cont_list_detail_ps_p {
	font-size:18px;
	line-height:18px;
	color:#222222;
}
.cont_list_detail_ps_p span {
	font-size:14px;
	line-height:18px;
	color:#444444;
	vertical-align:middle;
}
.cont_list_detail_ps_s {
	text-align:right;
	padding-bottom:5px;
}
.cont_list_detail_ps_s span {
	font-size:14px;
	line-height:18px;
	color:#666666;
	vertical-align:middle;
}
.cont_list_detail_ps_s img {
	vertical-align:middle;
}
.cont_list_div_wrap {
	position:relative;
}
.cont_list_div .slick-list {
	padding-top:10px;
	margin-top:-10px;
}
.cont_list_div > div > div > div {
	float:left;
	width:100px;
	height:400px;
	margin-left:20px;
}
.cont_list_div > div > div > div.on .move_box {
	-webkit-transform:translateY(-10px);
	-moz-transform:translateY(-10px);
	-ms-transform:translateY(-10px);
	-o-transform:translateY(-10px);
	transform:translateY(-10px);
	-webkit-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
	-moz-box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
	box-shadow: 0px 5px 10px 0px rgba(0,0,0,0.05);
}
.cont_list_div > div > div > div img {
	display:inline-block;
}

.cont_list_div_wrap .left, .cont_list_div_wrap .right {
	box-sizing:border-box;
	display:block;
	width:40px;
	height:40px;
	margin-top:-20px;
	border:none;
	position:absolute;
	top:50%;
	z-index:1;
	border-radius:20px;
	border:1px solid #c6c6c6;
}
.cont_list_div_wrap .left {
	left:-60px;
	background:url('http://localhost:9000/space/images/item_viewbox_top_slide_left.png') no-repeat center;
}
.cont_list_div_wrap .right {
	right:-60px;
	background:url('http://localhost:9000/space/images/item_viewbox_top_slide_right.png') no-repeat center;
}

/* } 리스트 */

/* 효과 { */
.s_obj.active.left_obj01 {
	-webkit-transform: translateX(-30%) translateY(50px);
	-ms-transform: translateX(-30%) translateY(50px);
	-o-transform: translateX(-30%) translateY(50px);
	transform: translateX(-30%) translateY(50px);
}
.s_obj.active.right_obj01 {
	-webkit-transform: translateX(30%) translateY(50px);
	-ms-transform: translateX(30%) translateY(50px);
	-o-transform: translateX(30%) translateY(50px);
	transform: translateX(30%) translateY(50px);
}
.s_obj.active.left_obj02 {
	-webkit-transform: translateX(-30%);
	-ms-transform: translateX(-30%);
	-o-transform: translateX(-30%);
	transform: translateX(-30%);
}
.s_obj.active.right_obj02 {
	-webkit-transform: translateX(30%);
	-ms-transform: translateX(30%);
	-o-transform: translateX(30%);
	transform: translateX(30%);
}
.s_obj.active.top_obj01 {
	-webkit-transform:translateY(-50%);
	-ms-transform:translateY(-50%);
	-o-transform:translateY(-50%);
	transform:translateY(-50%);
	opacity:0.5;
}
.s_obj.active.bottom_obj01 {
	-webkit-transform:translateY(30px);
	-ms-transform:translateY(30px);
	-o-transform:translateY(30px);
	transform:translateY(30px);
	opacity:0.5;
}
.s_obj.active.opa_obj01 {
	opacity:0.1;
}
.motion {
	-webkit-transition: all .5s ease-in-out;
	-ms-transition: all .5s ease-in-out;
	-o-transition: all .5s ease-in-out;
	transition: all .5s ease-in-out;
}
.motion02 {
	-webkit-transition: all 1s ease-in-out;
	-ms-transition: all 1s ease-in-out;
	-o-transition: all 1s ease-in-out;
	transition: all 1s ease-in-out;
}
/* } 효과 */
.sub_section.sub_section_videoconference01 {
	padding:100px 0 150px;
}
.sub_section_videoconference01_contentbox:after {
	content:'';
	display:block;
	clear:both;
}
.sub_section_videoconference01_contentbox > div {
	float:left;
	box-sizing:border-box;
	width:50%;
}
.sub_section_videoconference01_contentbox_right {
	padding:120px 0 0 60px;
}
.sub_section_videoconference01_contentbox_tit {
	font-family:"nanumsquare-l";
	font-size:42px;
	line-height:54px;
	color:#252626;
	letter-spacing:-2px;
}
.sub_section_videoconference01_contentbox_tit span {
	font-weight:bold;	
}
.sub_section_videoconference01_contentbox_btn {
	display:block;
	width:200px;
	margin-top:32px;
	border-radius:50px;
	font-family:"nanumsquare-b";
	font-size:15px;
	line-height:50px;
	color:#ffffff;
	text-align:center;
	background:linear-gradient(to right, #4d3ccf , #1251bc);
	-webkit-box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
	-moz-box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
	box-shadow: 10px 10px 10px 0px rgba(0,0,0,0.1);
}
.sub_section_videoconference01_contentbox_btn span {
	opacity:0.9;
}

/* 검색 상자 { */
.search_box {
	margin-left:-30px;
	width: 1000px;
}
.search_box_title {
	display: inline-block;
	width: 1000px;
	margin-top: 40px;
	color: white;
	font-weight: bold;
	text-align: left;
	text-indent: 30px;
}
.search_box_list {
	list-style-type: none;
	display: inline-block;
	padding: 0 20px;
	margin: 0 auto;
}
.search_box_list>li {
	float: left;
	display: inline-block;
	position: relative;
	width: 450px;
	padding: 20px 10px;
	margin: 5px;
	text-align: center;
	border-radius: 3px;
	background-color: white;
	box-shadow: 5px 5px 7px 0 rgba(0, 0, 0, 0.4);
}
.search_box_list>li:nth-child(4) {
	padding: 0;
	height: 63px;
}
.search_box_list label * {
	float: left;
	margin: 0 5px;
}
.search_box_list>li>label>input[type=text] {
	padding: 3px 5px;
	width: 350px;
	border: none;
	font-size: 15px;
	background-color: white;
}
.search_box_list li input[type=text]:focus {
	outline: none;
}
.search_box_list li input[type=text]:hover{
	cursor: pointer;
}
.select_data {
	display: none;
	position: absolute;
	top: 60px;
	left: 0;
	width: 450px;
	height: 100px;
	padding: 5px;
	border-bottom-left-radius: 3px;
	border-bottom-right-radius: 3px;
	background-color: white;
	z-index: 100;
	box-shadow: 7px 7px 7px 0 rgba(0, 0, 0, 0.1);
}
.date {
	height: 300px;
}
.open {
	display: block;
}
.btn_search_reset {
	background: none;
	border: none;
}
.btn_search_reset:hover {
	cursor: pointer;	
}
.btn_search {
	border: none;
	width: 100%;
	height: 100%;
	color: white;
	font-size: 15px;
	font-weight: bold;
	text-indent: 20px;
	background: url("http://localhost:9000/space/images/search_icon.png") lightsteelblue no-repeat 170px;
	border-radius: 3px;
}
.btn_search:hover {
	cursor: pointer;
	background-color: steelblue;
}
.location {
	height: 280px;
}
.location p {
	margin: 0 0 10px 0;
	padding-bottom: 10px;
	border-bottom: 1px solid darkgray;
}
.location_list, .location_list ul {
	list-style-type: none;
	padding: 0;
	margin-top: 15px;
}
.location_list ul {
	margin-top: 10px;
}
.location_list>li {
	float: left;
	display: inline-block;
	margin-left: 3px;
	width: 200px;
	height: 220px;
	overflow-y: scroll;
}
.main_location {
	font-weight: bold;
	margin-bottom: 0;
}
.sub_location {
	font-size: 15px;
	padding: 7px 10px;
	border: none;
	background: none;
}
.main_location:hover, .sub_location:hover {
	color: steelblue;
	cursor: pointer;
}

.type {
	padding-top: 0;
	height: 260px;
}
div.type ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}
span.room_type {
	float: left;
	padding: 7px;
	margin-left: 50px;
}
input.room_capacity {
	float: left;
	padding: 7px;
	width: 40px;
 	border: none;
	text-align: center;
}
.room_type_list li {
	padding: 2px;
}
.room_type_list div {
	margin-left: 100px;
	display: inline-block;
}
.room_type_list button {
	float: left;
	width: 32px;
	height: 32px;
	border: none;
}
.room_type_list button:hover {
	cursor: pointer;
}
button.down {
	background-image: url("http://localhost:9000/space/images/down.png");
	background-position: center;
	background-repeat: no-repeat;
}
button.down.active {
	background-image: url("http://localhost:9000/space/images/down_active.png");
}
button.up {
	background-image: url("http://localhost:9000/space/images/up.png");
	background-position: center;
	background-repeat: no-repeat;
}
/* } 검색 상자 */
</style>
<script>
function section01Slider() {
	$('.main_section01_slide_box').slick({
		dots:true,
		arrows:false,
		infinite:true,
		slidesToShow:1,
		slidesToScroll:1,
		speed:300,
		autoplay:true,
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
		autoplay:true,
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

//숫자 카운트 
 $(function(){
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
 
 // 검색 기능
 $(document).ready(function() {
		
		$("html").click(function(e) { 
			if(!$(e.target).is(".select_data") && !$(e.target).is(".select_data *") && !$(e.target).is("label input") 
					&& !$(e.target).is(".before-month") && !$(e.target).is(".next-month")) { 
				$("label").siblings("div").removeClass("open");
				$('*[name=date]').handleDtpicker('hide');
			}
		});

		$("label").click(function() {
			$(this).parent("li").siblings().children("div").removeClass("open");
			$(this).siblings("div").toggleClass("open");
			
			if($(this).siblings("div").hasClass("open")) {
				$('*[name=date]').handleDtpicker('show');
			} else {
				$('*[name=date]').handleDtpicker('hide');
			}
		});
		
		$(".btn_search_reset").click(function() {
			$(this).siblings("label").children("input").val("");
		});
		
		/* 날짜 선택 */
		$('*[name=date]').appendDtpicker({
			locale:"ko",
			futureOnly: true,
			minuteInterval: 30,
			dateFormat:"YYYY.MM.DD 일 hh:mm"
	    });
		
		/* 지역 선택 */
		$(".main_location").click(function() {
			$("#search_location").val($(this).text());	
			$(".location").removeClass("on");
		});
		
		$(".sub_location").click(function() {
			var location = $(this).parent().parent().siblings("span").text() + " > " + $(this).text()
			$("#search_location").val(location);
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
				<div class="main_visual_text_box_logo"><img src="http://localhost:9000/space/images/main_visual_logo.png" width=133px; height=27px; alt="회의실닷컴"></div>
				<p class="main_visual_text_box_text"><span>회의실의 모든 것. 비즈니스 모임공간 최저가로 한번에 비교! <br>
                        국내 최초 회의실 매칭 플랫폼</span></p>
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
										<ul>
											<li><button class="sub_location">강남구</button></li>
											<li><button class="sub_location">강동구</button></li>
											<li><button class="sub_location">강서구</button></li>
											<li><button class="sub_location">광진구</button></li>
											<li><button class="sub_location">구로구</button></li>
											<li><button class="sub_location">금천구</button></li>
											<li><button class="sub_location">동작구</button></li>
											<li><button class="sub_location">마포구</button></li>
											<li><button class="sub_location">서대문구</button></li>
											<li><button class="sub_location">서초구</button></li>
											<li><button class="sub_location">성동구</button></li>
											<li><button class="sub_location">송파구</button></li>
											<li><button class="sub_location">영등포구</button></li>
											<li><button class="sub_location">용산구</button></li>
											<li><button class="sub_location">종로구</button></li>
											<li><button class="sub_location">중구</button></li>
										</ul>
									</li>
									<li>
										<span class="main_location">경기</span>
										<ul>
											<li><button class="sub_location">고양시</button></li>
											<li><button class="sub_location">광명시</button></li>
											<li><button class="sub_location">성남시</button></li>
											<li><button class="sub_location">안산시</button></li>
											<li><button class="sub_location">안양시</button></li>
										</ul>
									</li>																
								</ul>
							</div>
						</div>
					</li>
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_date.png"></span>
							<input type="text" name="date" id="search_date" placeholder="날짜/시간" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data date"></div>
					</li>
					<li>
						<label>
							<span><img src="http://localhost:9000/space/images/search_icon_person.png"></span>
							<input type="text" name="type" id="search_type" placeholder="구조/인원" readonly>
						</label>
						<button type="button" class="btn_search_reset"><img src="http://localhost:9000/space/images/btn_reset_icon.png"></button>
						<div class="select_data type">
							<ul class="room_type_list">
								<li>
									<span class="room_type">강의식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">분임식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">U자형</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">□자형</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">연회식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
								<li>
									<span class="room_type">극장식</span>
									<div>
										<button type="button" class="down"></button>
										<input type="text" class="room_capacity" value="0" readonly>
										<button type="button" class="up"></button>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li>
						<button type="button" class="btn_search">검색하기</button>
					</li>
				</ul>	
			</div>
		</div>
	</div>
	</div>
	<!-- e main_visual -->
	
			<!-- 캐러셀 시작 -->
		<div id="demo" class="carousel slide" data-ride="carousel">
		
		<!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li class="item1 active"></li>
		    <li class="item2"></li>
		    <li class="item3"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <a href="#" >
		      <img src="http://localhost:9000/space/images/dK7qWq21H1a40aasSNZuu0YInYmfCxEylnlY08Ms.jpg"></a>
		    </div>
		    <div class="carousel-item">
			    <a href="#" >
				<img src="http://localhost:9000/space/images/KFaOcLArikVWmRR5mDvwvXsd6SeW02E25AuLxkpl.jpg"></a>
		    </div>
		    <div class="carousel-item">
		      	<a href="#" >
				<img src="http://localhost:9000/space/images/dELPSWEY31IE7qYotj3zKzHMOiJytzD3PkpUHBhe.png"></a>
		    </div>
		    <div class="carousel-item">
		      	<a href="#" >
				<img src="http://localhost:9000/space/images/M8ZwruRdKfvHJuJ4h8fuDsnNmkzDJWZgqTe9FH8H.png"></a>
		    </div>
		    <div class="carousel-item">
		      	<a href="#" >
				<img src="http://localhost:9000/space/images/STokWuWFdhcYj9wIkcwz7kLvw5tAUyfCPai5AclA.png"></a>
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#myCarousel">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#myCarousel">
		    <span class="carousel-control-next-icon"></span>
		  </a>
	</div>
	<!-- 캐러셀종료 -->


	<!-- s main_section02 -->
	<div class="section section02">
		<div class="section_center_box">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>화상 회의실</span> 보유 센터</p>
				<p class="main_stit01">줌, 스카이프, 팀즈, 시스코, 폴리콤 등 화상 회의가 가능한 센터입니다.</p>
			</div>
			<div class="cont_list_div_wrap md_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="md_slider cont_list_div hf_effect02">

						<div>
							<a class="move_box" href="#">
								<div class="cont_list_thum" style="background:url('http://localhost:9000/space/images/gwodlXqFzuM2InkKSQTzNMqO0qcKmhhQsys43rQM.jpg') no-repeat center;background-size:cover;">
									<span class="cont_list_thum_cover">7월<br />10% 할인 프로모션</span>
									<button class="heart_btn  " type="button" data-likable="centers" data-target="15"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">접근성이 뛰어난 깔끔 회의실</p>
									<p class="cont_list_detail_tit">강남구 9호점 (대치동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">대치동</li>
											<li class="subway">삼성역</li>
										</ul>
										<p class="cont_list_detail_info_m">30인실, 16인실, 10인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">66,000원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star40.png" alt=""> <span>3.5</span>
										</p>
									</div>
								</div>
							</a>
						</div>
			</div>
		</div>
	</div>
	</div>
	<!-- e main_section02 -->

		<!-- s main_section03 -->
	<div class="section section03">
		<div class="section_center_box">
			<div class="main_tit_box">
				<p class="main_tit01"><span>회의실닷컴</span> MD 추천</p>
				<p class="main_stit01">예약률, 평점, 재이용률 등 상위 랭킹에 등록된 센터 입니다.</p>
			</div>
			<div class="cont_list_div_wrap popularity_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="popularity_slider cont_list_div hf_effect02">
				
						<div>
							<a class="move_box" href="#">
								<div class="cont_list_thum" style="background:url('http://localhost:9000/space/images/KZOYr0tUXBiUWuUFVzDAHp3NFvnuceNakY8vChG3.jpg') no-repeat center;background-size:cover;">
									<button class="heart_btn  " type="button" data-likable="centers" data-target="119"></button>
								</div>
								<div class="cont_list_detail">
									<p class="cont_list_detail_stit">안양역 1번출구 1분거리. 안양1번가 입구</p>
									<p class="cont_list_detail_tit">경기 안양 1호점 (안양동)</p>

									<div class="cont_list_detail_info">
										<ul class="cont_list_detail_info_l">
											<li class="mark">안양동</li>
											<li class="subway">안양역</li>
										</ul>
										<p class="cont_list_detail_info_m">20인실, 9인실, 4인실...</p>
									</div>

									<div class="cont_list_detail_ps">
										<p class="cont_list_detail_ps_p">17,500원<span>부터</span></p>
										<p class="cont_list_detail_ps_s"><img src="/pc/images/star00.png" alt=""> <span>0.0</span>
										</p>
									</div>
								</div>
							</a>
						</div>
			</div>
		</div>
	</div>
	</div>
	<!-- e main_section03 -->

		<!-- s main_section04 -->
	<div class="section section04">
		<div class="section_center_box">
			<div class="main_tit_box line">
				<p class="main_tit01"><span>할인 프로모션</span> 센터</p>
				<p class="main_stit01">현재 할인이 진행 중인 센터입니다.</p>
			</div>
			<div class="cont_list_div_wrap discount_slider_wrap">
				<button class="right" type="button" title="다음"></button>
				<button class="left" type="button" title="이전"></button>
				<div class="discount_slider cont_list_div hf_effect02">
				
					<div>
						<a class="move_box" href="#">
							<div class="cont_list_thum" style="background:url('http://localhost:9000/space/images/WLA7dDyQKpnOB8rHD19ZG1UiJTczyuTIXWV4CoTl.jpg') no-repeat center;background-size:cover;">
								<span class="cont_list_thum_cover">7월 <br />20% 할인 프로모션</span>
								<button class="heart_btn  " type="button" data-likable="centers" data-target="64"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">19개 회의실, 전문 면접장 및 강의장</p>
								<p class="cont_list_detail_tit">서대문구 1호점 (충정로2가)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">충정로2가</li>
										<li class="subway">서대문역</li>
									</ul>
									<p class="cont_list_detail_info_m">100인실, 64인실, 60인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">17,600원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
					<div>
						<a class="move_box" href="#">
							<div class="cont_list_thum" style="background:url('http://localhost:9000/space/images/WLA7dDyQKpnOB8rHD19ZG1UiJTczyuTIXWV4CoTl.jpg') no-repeat center;background-size:cover;">
								<span class="cont_list_thum_cover">7월 <br />20% 할인 프로모션</span>
								<button class="heart_btn  " type="button" data-likable="centers" data-target="64"></button>
							</div>
							<div class="cont_list_detail">
								<p class="cont_list_detail_stit">19개 회의실, 전문 면접장 및 강의장</p>
								<p class="cont_list_detail_tit">서대문구 1호점 (충정로2가)</p>

								<div class="cont_list_detail_info">
									<ul class="cont_list_detail_info_l">
										<li class="mark">충정로2가</li>
										<li class="subway">서대문역</li>
									</ul>
									<p class="cont_list_detail_info_m">100인실, 64인실, 60인실...</p>
								</div>

								<div class="cont_list_detail_ps">
									<p class="cont_list_detail_ps_p">17,600원<span>부터</span></p>
									<p class="cont_list_detail_ps_s"><img src="/pc/images/star50.png" alt=""> <span>4.5</span>
									</p>
								</div>
							</div>
						</a>
					</div>
			</div>
		</div>
	</div>
	<!-- e main_section04 -->
	
	<!-- s main_section05 -->
	<div class="section section05">
		<div class="section_center_box">
			<div class="main_section05_slide_box">
			
					<div>
						<a href="#" >
							<img src="http://localhost:9000/space/images/uCm6HQXmeQgSTnXmwFjRNtBu4M9lhwRZnIJ5R4GX.png" alt=""></a>
					</div>
			</div>
		</div>
	</div>
	<!-- e main_section05 -->

	<!-- s main_section06 -->
	<div class="section section06">
		<div class="section_center_box">
			<div class="main_section06_content_box">
				<div class="main_section06_content_box_location"><img src="http://localhost:9000/space/images/main_section06_img01.png" alt="지도">
				</div>
				<div class="main_section06_content_box_text">
					<p class="main_section06_content_box_tit"><span>국내 최초의</span><br>
						회의실 전문 매칭 플랫폼
					</p>
					<p class="main_section06_content_box_stit">회의실닷컴은 좋은 회의실을 원하는 지역에서 <br>
						누구나 이용할 수 있도록 연결합니다.
					</p>
					<ul class="main_section06_content_box_list">
						<li>
							<span id="count01" class="main_section06_content_box_list_num">94</span>
							<span class="main_section06_content_box_list_text">등록 센터</span>
						</li>
						<li>
							<span id="count02" class="main_section06_content_box_list_num">417</span>
							<span class="main_section06_content_box_list_text">등록된 회의실</span>
						</li>
						<li>
							<span id="count03" class="main_section06_content_box_list_num">53457</span>
							<span class="main_section06_content_box_list_text">누적 이용 고객</span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- s main_section06 -->

	<!-- s sub_section -->
	<div class="sub_section sub_section_videoconference01" style="padding: 80px 0 130px;">
		<div class="center_box">
			<div class="sub_section_videoconference01_contentbox">
				<div class="sub_section_videoconference01_contentbox_right motion02 s_obj opa_obj01 active">
					<p class="sub_section_videoconference01_contentbox_tit" style="font-size: 37px;">고가의 최신형 화상 회의 솔루션을<br>
						<span>월 렌탈</span>로 이용해보세요.</p>
						<br>
					<p class="sub_section_videoconference01_contentbox_tit" style="font-size: 22px;">
						단 하루 사용을 위한 렌탈부터 장기 렌탈까지 가능합니다.
					</p>
					<a class="sub_section_videoconference01_contentbox_btn" href="#"><span>화상회의 솔루션</span></a>
				</div>
				<div class="sub_section_videoconference01_contentbox_left motion s_obj left_obj02 active"><img src="http://localhost:9000/space/images/sub_section_videoconference01_contentbox_img01.jpg" alt=""></div>
			</div>
		</div>
	</div>
	<!-- e sub_section -->

	</div>
	<!-- e container -->
	
	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>