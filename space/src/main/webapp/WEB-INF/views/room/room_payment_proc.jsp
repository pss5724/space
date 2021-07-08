<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   /*  String name = (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address"); */
%>
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
            name : '회의실닷컴 대관료 결제',
<%--             amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>', --%>
            amount : 78000,
            buyer_email : 'hongkd123@naver.com',
            buyer_name : '홍길동',
            buyer_tel : '010-4567-8945',
            buyer_addr : '서울시 강남구',
        }, function(rsp) {
            if ( rsp.success ) {
                jQuery.ajax({
                    url: "/payments/complete", 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                    }
                }).done(function(data) {});
                
                msg = '결제가 완료되었습니다.\n';
                msg += '\n결제자 : ' + rsp.buyer_name;
                msg += '\n내용 : 회의실 대관료 결제';
               // msg += '\n고유ID : ' + rsp.imp_uid;
               // msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                msg += '\n결제 금액 : ' + rsp.paid_amount;
                
                alert(msg);

                rnumber = '001721';
                opener.document.location.href = 'http://localhost:9000/space/room_reserve_confirm.do?rnumber=' + rnumber;
                self.close();
                
            } else {
                msg = '결제에 실패했습니다.\n';
                msg += '사유 : ' + rsp.error_msg;
                
                alert(msg);
                self.close();
            }
        });
        
    });
    </script>
 
</body>
</html>
