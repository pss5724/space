<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
html, body, #google-map {
   width: 100%;
   height: 100%;
   margin: 0;
   padding: 0
}

#search-panel {
   position: absolute;
   top: 10px;
   left: 25%;
   z-index: 5;
   background-color: #FFFFFF;
   padding: 5px;
   border: 1px solid black;
   text-align: center;
   padding: left: 10px
}
.name {
	font-size: 20px;
	font-weight: bold;
}
.msg {
	font-size: 15px;
	color: blue;
	font-weight: bold;
}
</style>
<title></title>
</head>
<body>
    <div id="google-map">
    </div>
 
    <!-- Google Map API -->
    <script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJE8peRXRO0ACfNfstLiSpXZv0lLoniEc&callback=initMap">
    </script>
    <script>
		function initMap() {
			
			//초기 맵 생성
            var map = new google.maps.Map(document.getElementById('google-map'), {
                zoom: 12.5,
                center: {
                    lat: 37.4959854,
                    lng: 127.0664091
                }
            });
 
         	var geocoder = new google.maps.Geocoder();
			
         	//var addrList = ["경기 수원시 팔달구 덕영대로 924", "서울 용산구 한강대로 405", "서울 강남구 강남대로 지하 396", "서울 강남구 테헤란로 지하 156"];
         	var infoList = {"info": [
         	    					{"name": "경기점", "addr": "경기 수원시 팔달구 덕영대로 924", "msg": "경기 유일 지점", "price": "90,000원"},
         	    					{"name": "서울역점", "addr": "서울 용산구 한강대로 405", "msg": "서울역 2분 거리", "price": "40,000원"},
         	 						{"name": "강남점", "addr": "서울 강남구 강남대로 지하 396", "msg": "전국 최대 규모", "price": "75,000원"},
         	   						{"name": "역삼점", "addr": "서울 강남구 테헤란로 지하 156", "msg": "역삼점입니다 ~", "price": "110,000원"}
         					]};
         	

         	for(var i in infoList.info) {
        		geocodeAddress(geocoder, map, infoList.info[i].name, infoList.info[i].addr, infoList.info[i].msg, infoList.info[i].price);
         	}
         	       	
         	/* for(var i in addrList) {
        		geocodeAddress(geocoder, map, addrList[i]);
         	} */
 
			//주소에 마커 표시
            function geocodeAddress(geocoder, resultMap, name, addr, msg, price) {
                var address = addr;
                geocoder.geocode({'address': address}, function(result, status) {
                    if (status === 'OK') {
                        resultMap.setCenter(result[0].geometry.location);
                        resultMap.setZoom(18);

                        var marker = new google.maps.Marker({
                            map: resultMap,
                            position: result[0].geometry.location
                        });
                        
                        var infowindow = new google.maps.InfoWindow();
                        var windowhtml = "<div>"
                        					+ "<p class='name'>"+ name + "</p>"
 											+ "<p class='msg'>"+ msg + "</p>"
 											+ "<p>"+ addr + "</p>"
 											+ "<p>"+ price + "</p>"
 											+ "<button type='button'>상세정보</button>"
 										+ "</div>";
                        
                        google.maps.event.addListener(marker, 'click',
            					(function(marker, i) {
            						return function() {
            							infowindow.setContent(windowhtml);
            							infowindow.open(map, marker);
            						}
            					})(marker, i));
 
                        console.log('위도(latitude) : ' + marker.position.lat());
                        console.log('경도(longitude) : ' + marker.position.lng());
                    } else {
                        alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                    }
                });
            }//geocodeAddress
        }//initMap
    </script>
</body>
</html>