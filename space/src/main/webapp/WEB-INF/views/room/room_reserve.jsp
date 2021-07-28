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
<link rel="stylesheet" href="http://localhost:9000/space/css/datepicker.css" />
<link rel="stylesheet" href="http://localhost:9000/space/css/jquery.timepicker.css" />
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css"> -->
<link rel="stylesheet" href="http://localhost:9000/space/css/room_bootstrap.css">
<link rel="stylesheet" href="http://localhost:9000/space/css/room_reserve.css">
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script> -->
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="http://localhost:9000/space/js/jquery.timepicker.js"></script>

<style>

</style>
<script>
$(document).ready(function() {
   $("#btn_reserve").click(function(){
      /* 영업시간 숫자로 변환 */
       $("input[id^=time]").each(function() { 
          var tlist = $(this).val().split(":");
          var time = 0;

          if (tlist[0] < 10) { //시간
             time += Number(tlist[0].substr(1, 1))
          } else {
             time += Number(tlist[0]);
          }

          if (tlist[1] == 30) { //분
             time += 0.5;
          }

          $(this).val(time);
       });
      var used_hours = Number($("#time2").val()) - Number($("#time1").val());
      $("#amount").append('<input type="text" name="used_hours" id="uhours" style="display:none">')
      $("#uhours").val(used_hours);

      if("<c:out value='${svo.convenience1}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="conv1" name="convenience1_num"></li>');
      }
      if("<c:out value='${svo.convenience2}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="conv2" name="convenience2_num"></li>');
      }
      if("<c:out value='${svo.convenience3}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="conv3" name="convenience3_num"></li>');
      }
      if("<c:out value='${svo.beverage1}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="bev1" name="beverage1_num"></li>');
      }
      if("<c:out value='${svo.beverage2}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="bev2" name="beverage2_num"></li>');
      }
      if("<c:out value='${svo.beverage3}'/>" == ""){
         $("#slist").append('<li style="display:none"><input type="text" value="0" id="bev3" name="beverage3_num"></li>');
      }

      var amount = (Number('${vo.charge}')*Number($("#uhours").val()));
      if('${svo.convenience1}' != 'null'){
         amount = amount + (Number('${svo.convenience1_price}') * Number($("#conv1").val()));
      }
      if('${svo.convenience2}' != 'null'){
         amount = amount + (Number('${svo.convenience2_price}') * Number($("#conv2").val()));
      }
      if('${svo.convenience3}' != 'null'){
         amount = amount + (Number('${svo.convenience3_price}') * Number($("#conv3").val()));
      }
      if('${svo.beverage1}' != 'null'){
         amount = amount + (Number('${svo.beverage1_price}') * Number($("#bev1").val()));
      }
      if('${svo.beverage2}' != 'null'){
         amount = amount + (Number('${svo.beverage2_price}') * Number($("#bev2").val()));
      }
      if('${svo.beverage3}' != 'null'){
         amount = amount + (Number('${svo.beverage3_price}') * Number($("#bev3").val()));
      }
      console.log('amount',amount);
      
         var mname = $("#r_name").val();

      $("#amount").append('<input type="text" name="amount" id="r_amount" style="display:none">')
      $("#r_amount").val(amount);

      if($("#datepicker").val() == ""){
         alert("이용일자를 선택해주세요");
         $("#datepicker").focus();
      }else if($("#time1").val()==0){
         alert("입실시간을 선택해주세요");
         $("#time1").focus();
      }else if($("#time2").val()==0){
         alert("퇴실시간을 선택해주세요");
         $("#time2").focus();
      }else if($("#headcount").val() == 0){
         alert("이용인원을 입력해주세요");
         $("#headcount").focus();
      }else if($("#r_name").val() == ""){
         alert("예약자를 입력해주세요");
         $("#r_name").focus();
      }else if($("#phone1").val() == ""){
         alert("연락처를 입력해주세요");
         $("#phone1").focus();
      }else if($("#phone2").val() == ""){
         alert("연락처를 입력해주세요");
         $("#phone2").focus();
      }else if($("#phone3").val() == ""){
         alert("연락처를 입력해주세요");
         $("#phone3").focus();
      }else if($("#email").val() == ""){
         alert("로그인을 해주세요");
         $("#email").focus();
      }else if($("#c_name").val() == ""){
         alert("회사명을 입력해주세요");
         $("#c_name").focus();
      }else if($("#event_name").val() == ""){
         alert("행사명을 입력해주세요");
         $("#event_name").focus();
      }else if($("#online").is(":checked")==false && $("#onsite").is(":checked")==false){
         alert("결제방식을 선택해주세요");
         $("#online").focus();
      }else {
         var phone = $("#phone1").val() + "-" + $("#phone2").val() + "-" + $("#phone3").val();
         $("#phone").append('<input type="text" name="hp" id="hp" style="display:none">');
         $("#hp").val(phone);
         
         $("form").attr("action", "room_reserve_proc.do?rid=${vo.rid}&branch_name=${vo.branch_name}&room_name=${vo.room_name}&type=${vo.type}&email=${sessionScope.svo.id }&name="+mname);
         room_reserve.submit();
      }
      
   });
   
   $('#datepicker').datepicker({
      dateFormat: 'yy.mm.dd',
        prevText: ' ',
        nextText: ' ',
      minDate: 0,
        monthNames: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        monthNamesShort: ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '.',
        showOn: 'button',
        buttonImage: 'http://localhost:9000/space/images/cal_btn_img01.png'
   });
   $("#datepicker").datepicker().datepicker("setDate", new Date());
   
    var opening_time, closing_time;
    var olist = "<c:out value='${vo.opening_time}' />".split(".");
    var clist = "<c:out value='${vo.closing_time}' />".split(".");
    
    if(olist[1]==0) {
       opening_time = olist[0] + ":" + "00";
    } else {
       opening_time = olist[0] + ":" + "30";
    }
    if(clist[1]==0) {
       closing_time = clist[0] + ":" + "00";
    } else {
       closing_time = clist[0] + ":" + "30";
    }
   
   
   $(".number-spinner input").click(function(){   
      var btn = $(this),
         oldValue = btn.closest('.number-spinner').find('input[type="text"]').val().trim(),
         newVal = 0;
      
      if (btn.attr('data-dir') == 'up') {
         newVal = parseInt(oldValue) + 1;
      } else {
         if (oldValue > 1) {
            newVal = parseInt(oldValue) - 1;
         } else {
            newVal = 0;
         }
      }
      btn.closest('.number-spinner').find('input[type="text"]').val(newVal);
   });
   
   $(".large_img>img").click(function(){
       $(".large_img>div").show();
       $(".large_img>div").css('box-shadow','rgba(0,0,0,0.5) 0 0 0 9999px');
    });
    
    $(".large_img>div>img:first-child").click(function(){
       $(".large_img>div").hide();
    });
    

    
    var timelist = new Array();
    <c:forEach var="rsvo" items="${list}">
       timelist.push("${rsvo.checkin_time}");
       timelist.push("${rsvo.checkout_time}");
   </c:forEach>
    
    var rlist = new Array();
    <c:forEach var="rsvo" items="${list}">
       rlist.push("${rsvo.reserve_date}");
    </c:forEach>
    
    
    var tlist = new Array();
    for(var i=0;i<timelist.length;i++){
       tlist.push(timelist[i].split("."));
    }
    
    var checkinlist = new Array();
    var checkoutlist = new Array();
    for(var i=0;i<tlist.length;i=i){
       if(tlist[i][1]==0) {
          checkinlist.push(tlist[i++][0]+":"+"00");
       }else {
          checkinlist.push(tlist[i++][0]+":"+"30");
       }
       if(tlist[i][1]==0) {
          checkoutlist.push(tlist[i++][0]+":"+"00");
       }else {
          checkoutlist.push(tlist[i++][0]+":"+"30");
       }
    }
    
    for(var i=0;i<checkinlist.length;i++){
       console.log('chk',checkinlist[i]);
    }

    var now_time = new Date();
    console.log('ddd',now_time);
    console.log('date',now_time.getMonth());
    var now_month = now_time.getMonth()+1;
    if(String(now_month).length == 1){
       today = now_time.getFullYear()+".0"+now_month+"."+now_time.getDate();
    } else if(String(now_month).length == 2){
       today = now_time.getFullYear()+"."+now_month+"."+now_time.getDate();
    }
    now_hours = now_time.getHours();
    if(String(now_hours).length == 1){
       now_hours="0"+now_hours;
    }
    now_minutes = now_time.getMinutes();
    if(String(now_minutes).length == 1){
       now_minutes="0"+now_minutes;
    }
    now_time = now_hours + ":" + now_minutes;
    var timelength = disableAllTheseHours($("#datepicker").val()).length;
      var length = rlist.length;
   $("input[id^=time]").timepicker({
        timeFormat: 'H:i',
        interval: 30,
        minDate: 0,
        minTime: opening_time,
        maxTime: closing_time,
        startTime: opening_time,
        dynamic: false,
        dropdown: true,
        scrollbar: true,
        disableTimeRanges:
           disableAllTheseHours($("#datepicker").val(), null)
    });
    
    $("#datepicker").change(function(){
       $("input[id^=time]").val("");
       $("input[id^=time]").timepicker({
           timeFormat: 'H:i',
           interval: 30,
           minDate: 0,
           minTime: opening_time,
           maxTime: closing_time,
           startTime: opening_time,
           dynamic: false,
           dropdown: true,
           scrollbar: true,
           disableTimeRanges:
              disableAllTheseHours($("#datepicker").val(), null)
       });
    });
    
    $("#time1").change(function(){
         $("#time2").timepicker({
             timeFormat: 'H:i',
             interval: 30,
             minDate: 0,
             minTime: opening_time,
             maxTime: closing_time,
             startTime: opening_time,
             dynamic: false,
             dropdown: true,
             scrollbar: true,
             disableTimeRanges: disableAllTheseHours($("#datepicker").val(), $(this).val())
         });
      });
    
    //특정 시간 비활성화
    function disableAllTheseHours(date, time1){
       var hours = new Array();
       if(date == today){
          if(olist[0] <= now_hours && olist[1] <= now_minutes){
             hours.push([opening_time,now_time]);
          }
       }
       for(var i=0;i<length;i++){
          if(rlist[i]==date){
             hours.push([checkinlist[i],checkoutlist[i]]);
          }
       }
       
       if(time1 != null) {
           var timelist = time1.split(":");
          var time_add1 = [time1, (Number(timelist[0])+1) + ":" + timelist[1]]; //1시간 단위
           var before = [opening_time, (Number(timelist[0])+1) + ":" + timelist[1]];
          hours.push(time_add1);
          hours.push(before);
          
           for(var i=0;i<length;i++){
               if(rlist[i]==date){
                  if(Number(timelist[0]) < Number(checkinlist[i].split(":")[0])) {
                       hours.push([checkoutlist[i], Number(closing_time.split(":")[0])+1+":00"]);
                  }
               }
            }
       }
       
       return hours;
    }
    
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
   <jsp:include page="../header.jsp"></jsp:include>
   
   <div class="title"><h1>예약하기</h1></div>
   <form name="room_reserve" action="room_reserve_proc.do" method="POST">
      <div class="room_reserve_content">
         
         <!-- 회의실 정보1 -->
         <div class="name">
            <div class="label"><div class="l_line"></div><label>${vo.branch_name }</label><div></div><label>${vo.room_name }</label></div>
            <div id="image" style="background:url('http://localhost:9000/space/upload/${vo.rsfile1 }'); background-size: cover; background-repeat: no-repeat; background-position: 50%;"></div>
            <div class="large_img">
               <img src="http://localhost:9000/space/images/thum_more_icon.png">
               <div>
                  <img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box02_content_box_list_slide_box_close_btn.png">
                  <img src="http://localhost:9000/space/upload/${vo.rsfile1 }">
               </div>
            </div>
         </div>
         
         <!-- 회의실 정보2 -->
         <div class="room_inform">
            <ul>
               <li>
                  <label>최저 이용시간</label>
                  <span>1시간</span>
               </li>
               <li>
                  <label>수용형태</label>
                  <div>
                     <div>
                        <ul>
                           <li>
                              <c:choose>
                                 <c:when test="${vo.type == '강의식' }">
                                    <img src="http://localhost:9000/space/images/shape_icon01.png">
                                 </c:when>
                                 <c:when test="${vo.type == '분임식' }">
                                    <img src="http://localhost:9000/space/images/shape_icon02.png">
                                 </c:when>
                                 <c:when test="${vo.type == 'U자형' }">
                                    <img src="http://localhost:9000/space/images/shape_icon03.png">
                                 </c:when>
                                 <c:when test="${vo.type == 'ㅁ자형' }">
                                    <img src="http://localhost:9000/space/images/shape_icon04.png">
                                 </c:when>
                              </c:choose>
                              <span>${vo.type } ${vo.capacity }명</span>
                           </li>
                        </ul>
                        <span id="limit">*최대 수용 인원으로 초과시 대관이 제한됩니다.</span>
                     </div>
                  </div>
               </li>
               <li>
                  <label>편의시설</label>
                  <div>
                     <ul>
                        <c:if test="${ovo.lounge == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon01.png">
                              <span>공용 라운지</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.smoking_room == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon02.png">
                              <span>흡연실</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.parking_lot == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon03.png">
                              <span>주차장</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.elevator == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon04.png">
                              <span>승강기</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.freight_elevator == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon05.png">
                              <span>화물승강기</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.vending_machine == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon06.png">
                              <span>자판기</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.wifi == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon07.png">
                              <span>WI-FI</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.accessible_toilet == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon08.png">
                              <span>장애인 화장실</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.toilet == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon09.png">
                              <span>화장실</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.water_dispenser == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon10.png">
                              <span>정수기</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.ktx == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon26.png">
                              <span>KTX, SRT 인근</span>
                           </li>
                        </c:if>
                     </ul>
                  </div>
               </li>
               <li>
                  <label>부가서비스</label>
                  <div>
                     <ul>
                        <c:if test="${ovo.beam == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon11.png">
                              <span>빔프로젝터</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.video_device == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon24.png">
                              <span>화상회의장비</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.mic == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon14.png">
                              <span>마이크</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.lectern == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon19.png">
                              <span>강연대</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.tv == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon12.png">
                              <span>TV</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.speaker == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon13.png">
                              <span>스피커</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.pc == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon15.png">
                              <span>PC/노트북</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.pointer == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon16.png">
                              <span>포인터</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.banner == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon17.png">
                              <span>현수막</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.whiteboard == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon18.png">
                              <span>화이트보드</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.dais == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon20.png">
                              <span>단상</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.conference_call == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon21.png">
                              <span>컨퍼런스콜</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.air_conditional == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon22.png">
                              <span>에어컨</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.heater == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon23.png">
                              <span>난방기</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.internet == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon25.png">
                              <span>유선인터넷</span>
                           </li>
                        </c:if>
                        <c:if test="${ovo.studio == 1}">
                           <li>
                              <img src="http://localhost:9000/space/images/convenience_icon27.png">
                              <span>영상스튜디오</span>
                           </li>
                        </c:if>
                     </ul>
                  </div>
               </li>
            </ul>
         </div>
         
         <!-- 예약정보 -->
         <div class="res_inform">
            <div class="inform_label">
               <img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
               <label>예약정보</label>
            </div>
            <div>
               <ul id="r_info">
                  <li>
                     <label>이용일자</label>
                     <input id="datepicker" name="reserve_date">
                  </li>
                  <li>
                     <label>이용시간</label>
                     <input type="text" id="time1" name="checkin_time" autocomplete="off">~<input type="text" id="time2" name="checkout_time" autocomplete="off">
                  </li>
                  <li>
                     <label>이용인원</label>
                     <div class="input-group number-spinner" id="people">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="headcount" name="headcount">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  <li>
                     <label>수용형태</label>
                     <input type="text" name="type" id="type" value="${vo.type }" disabled>
                  </li>
               </ul>
            </div>
         </div>
         
         <!-- 부가서비스 -->
         <div class="a_service" id="amount">
            <div class="inform_label">
               <img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
               <label>부가서비스</label>
            </div>
            <div>
               <ul id="slist">
                  <c:if test="${svo.convenience1 ne 'null' }">
                  <li>
                     <div class="s_label"><div class="required"></div><label>편의사항</label></div>
                     <div id="s_content">
                        <span>${svo.convenience1 }<br><span class="item_price">${svo.convenience1_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="conv1" name="convenience1_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
                  <c:if test="${svo.convenience2 ne 'null' }">
                  <li>
                     <div id="s_content">
                        <span>${svo.convenience2 }<br><span class="item_price">${svo.convenience2_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="conv2" name="convenience2_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
                  <c:if test="${svo.convenience3 ne 'null' }">
                  <li>
                     <div id="s_content">
                        <span>${svo.convenience3 }<br><span class="item_price">${svo.convenience3_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="conv3" name="convenience3_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
                  <c:if test="${svo.beverage1 ne 'null' }">
                  <li>
                     <div class="s_label"><div class="required"></div><label>식음료</label></div>
                     <div id="s_content">
                        <span>${svo.beverage1 }<br><span class="item_price">${svo.beverage1_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="bev1" name="beverage1_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
                  <c:if test="${svo.beverage2 ne 'null' }">
                  <li>
                     <div id="s_content">
                        <span>${svo.beverage2 }<br><span class="item_price">${svo.beverage2_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="bev2" name="beverage2_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
                  <c:if test="${svo.beverage3 ne 'null' }">
                  <li>
                     <div id="s_content">
                        <span>${svo.beverage3 }<br><span class="item_price">${svo.beverage3_price }</span></span>
                     </div>
                     <div class="input-group number-spinner">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="dwn" value="-">
                        </span>
                        <input type="text" class="form-control text-center" value="0" id="bev3" name="beverage3_num">
                        <span class="input-group-btn">
                           <input type="button" class="btn btn-default" data-dir="up" value="+">
                        </span>
                     </div>
                  </li>
                  </c:if>
               </ul>
            </div>
         </div>
         
         <!-- 예약자 정보 -->
         <div class="p_inform">
            <div class="inform_label">
               <img src="http://localhost:9000/space/images/item_common_reservation_round_box_content_tit_before_bg.png">
               <label>예약자 정보</label>
            </div>
            <div><span>* 필수입력</span></div>
            <div>
               <ul>
                  <c:forEach var="member" items="${memberlist }">
                     <c:if test="${member.id == sessionScope.svo.id }">
                     <li>
                        <label>예약자<span>*</span></label>
                        <input type="text" id="r_name" name="name" value="${member.name }" disabled>
                     </li>
                     <li id="phone">
                        <label>연락처<span>*</span></label>
                        <input type="text" id="phone1" name="ph1" value="${fn:split(member.hp,'-')[0]}"> - <input type="text" id="phone2" name="ph2" value="${fn:split(member.hp,'-')[1]}"> - <input type="text" id="phone3" name="ph3" value="${fn:split(member.hp,'-')[2]}">
                     </li>
                     </c:if>
                  </c:forEach>
                  <li>
                     <label>이메일<span>*</span></label>
                     <input type="text" id="email" name="email" value="${sessionScope.svo.id }" disabled>
                  </li>
                  <li>
                     <label>회사명<span>*</span></label>
                     <input type="text" id="c_name" name="corp_name">
                  </li>
                  <li>
                     <label>행사명<span>*</span></label>
                     <input type="text" id="event_name" name="event_name">
                  </li>
                  <li>
                     <label>기타 요청사항</label>
                     <input type="text" id="etc" name="etc_request">
                  </li>
                  <li>
                     <label>결제 방식<span>*</span></label>
                     <c:choose>
                        <c:when test="${ovo.online_payment == 1 && ovo.offline_payment ==1 }">
                           <input type="radio" id="online" name="pay_type" class="chk" value="온라인"><span>온라인결제</span>
                           <input type="radio" id="onsite" name="pay_type" class="chk" value="현장"><span>현장결제</span>
                        </c:when>
                        <c:when test="${ovo.online_payment == 1 && ovo.offline_payment == 0 }">
                           <input type="radio" id="online" name="pay_type" class="chk" value="온라인"><span>온라인결제</span>
                        </c:when>
                        <c:when test="${ovo.online_payment == 0 && ovo.offline_payment == 1 }">
                           <input type="radio" id="onsite" name="pay_type" class="chk" value="현장"><span>현장결제</span>
                        </c:when>
                     </c:choose>
                     
                  </li>
               </ul>
            </div>
         </div>
         
         <!-- 예약 시 주의사항 -->
         <div class="caution" id="caution">
            <div class="label"><div class="l_line"></div><label>예약 시 주의사항</label></div>
            <ul>
               <li>
                  <label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">주의사항</label>
                  <div>
                     실내 흡연 금지<br>
                     사전 승인되지 않은 음식물 반입 금지 (간단 다과 반입 시 수거 필수)<br>
                     각종 노트북 젠더 미제공<br>
                     1F 인포메이션 게이트에서 일일카드 발급<br>
                     (신분증/명함 맡겨야함, 담당자가 행사 일주일 전까지 참석자 사전 전달 시 신분증 제출 필요 없음)
                  </div>
               </li>
               <li>
                  <label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">예약정책</label>
                  <div>
                     계약금 없음, 카드사본 대체<br>
                     결제수단 : 계좌이체(세금계산서발행), 방문 카드결제<br>
                     (취소위약금 : 예약시 고객이 첨부한 카드사본으로 위약금 결제 진행)
                  </div>
               </li>
               <li>
                  <label><img src="http://localhost:9000/space/images/item_viewbox_top_tabcon_box03_content_box_list_bul.png">취소/환불 정책</label>
                  <div>
                     아래 취소 가능 기간은 평일 9~18시 기준입니다. *주말/공휴일 미포함*<br>
                     사용 48시간전~사용 24시간전 : 총 합계 금액의 50% 부과<br>
                     사용 24시간전~행사 당일 : 총 합계 금액의 100% 부과
                  </div>
               </li>
            </ul>
         </div>
      
         <!-- 예약하기 버튼 -->
         <div class="r_button">
            <input type="button" value="예약신청" id="btn_reserve">
            <a href="room_list.do"><input type="button" value="취소" id="btn_reset"></a>
         </div>
      </div>
   </form>
   
   <!-- footer -->
   <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>