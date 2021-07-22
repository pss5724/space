<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${sessionScope.svo.id == rsvo.email}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
		    $(function(){
		        var IMP = window.IMP; // 생략가능
		        IMP.init('imp58144084'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        var msg;
		        var resnumber;
		        IMP.request_pay({
		            pg : 'kakaopay',
		            pay_method : 'card',
		            merchant_uid : 'merchant_' + new Date().getTime(),
		            name : '스페이스닷컴 대관료 결제',
		            buyer_name : "<c:out value='${rsvo.name}'/>",
		            amount : "<c:out value='${rsvo.amount}'/>",
		        }, function(rsp) {
		            if ( rsp.success ) {
		                jQuery.ajax({
		                    url: "/payments/complete", 
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                        imp_uid : rsp.imp_uid
		                    }
		                }).done(function(data) {console.log(rsp.amount)});
		                
		                msg = '결제가 완료되었습니다.\n';
		                msg += '\n결제자 : ' + rsp.buyer_name;
		                msg += '\n결제내용 : 스페이스닷컴 대관료';
		                //msg += '\n고유ID : ' + rsp.imp_uid;
		                //msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                msg += '\n결제금액 : ' + number_format(rsp.paid_amount) +"원";
		                
		                alert(msg);
		
		                opener.document.location.href = 'http://localhost:9000/space/room_reserve_confirm.do?rsid=' +  "<c:out value='${rsvo.rsid}'/>";
		                self.close();
		                
		            } else {
		                msg = '결제에 실패했습니다.\n';
		                msg += '사유 : ' + rsp.error_msg;
		                
		
		                alert(msg);
		                self.close();
		                opener.document.location.href = 'http://naver.com';
		            }
		        });
		        
		    });
		    
			function number_format(numstr) {
				var numstr = String(numstr);
				var re0 = /(\d+)(\d{3})($|\..*)/;
				if (re0.test(numstr)) {
					return numstr.replace(re0, function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; });
				} else {
					return numstr;
				}
			}
    </script>
</body>
</html>
    </c:when>
    <c:otherwise>
    	<script>
    	alert("잘못된 접근입니다.");
    	location.href = "http://localhost:9000/space/index.do";
    	</script>
    </c:otherwise>
</c:choose>
