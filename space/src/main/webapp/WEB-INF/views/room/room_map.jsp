<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
html, body /* #google-map */ {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0
}
div.modal{
	position: fixed;
	display: none;
	width: 100%;
	height: 100%;
	margin: auto;
	padding: 0;
 	top: 0;
	left: 0;
	background: white;
	z-index: 999;
}
button.exit{
	position: absolute;
	display: inline-block;
	width: 40px; 
	height: 40px;
	line-height: 40px;
	border: none;
	border-radius: 2px;
	margin: 10px; 
	padding: 0;
	top: 50px;
	right: 0; 
	font-size: 40px;
	color: gray;
	background: rgba(255,255,255,0.9);
    box-shadow: darkgrey 1px 1px 1px 0px;
	cursor: pointer;
    z-index: 999;
}
#google-map {
	width: 100%;
	height: 100%;
}

.map_room_info {
	width: 500px;
	height: 200px;
	box-sizing: border-box;
}
.map_room_info div {
	float: left;
	display: inline-block;
	box-sizing: border-box;
}
.map_room_img {
	width: 200px;
	height: 100%;
	overflow: hidden;
}
.map_room_img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
.map_room_detail {
	padding: 10px 15px;
	width: calc(100% - 200px);
	height: 100%;
}
.map_room_detail p {
	margin: 5px;
	text-align: left;
}
.map_room_name {
	font-size: 22px;
	font-weight: bold;
}
.map_room_msg {
	font-size: 17px;
	font-weight: bold;
	color: royalblue;
}
.map_room_price {
	font-weight: bold;
	font-size: 17px;
	padding-top: 50px;
}
.map_room_detail a {
	display: inline-block;
	padding: 3px 13px;
	text-decoration: none;
	color: white;
	background: steelblue;
	border-radius: 20px;
	font-size: 13px;
	margin-left: 50px;
}

</style>
<title></title>
</head>
<body>
<!-- 	<div class='map_room_info'>
		<div class='map_room_img'>
			<img src='http://localhost:9000/space/images/room1.jpg'>
		</div>
		<div class='map_room_detail'>
			<p class='map_room_name'>dd</p>	
			<p class='map_room_msg'>dd</p>	
			<p class='map_room_addr'>22</p>	
			<p class='map_room_price'>11<a href="">상세 정보</a></p>
		</div>
	</div> -->
	
	<div class="modal" id="modal">
		<button class="exit" id="exit">&times;</button>
		<div id="google-map"></div>
	</div>
 
    <!-- Google Map API -->
    <!-- <script src="http://localhost:9000/space/js/jquery-3.6.0.min.js"></script> -->
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
         	    					{"name": "경기점", "addr": "경기 수원시 팔달구 덕영대로 924", "msg": "경기 유일 지점", "price": "90,000원", "img":"room1.jpg"},
         	    					{"name": "서울역점", "addr": "서울 용산구 한강대로 405", "msg": "서울역 2분 거리", "price": "40,000원", "img":"room1.jpg"},
         	 						{"name": "강남점", "addr": "서울 강남구 강남대로 지하 396", "msg": "전국 최대 규모", "price": "75,000원", "img":"room2.jpg"},
         	   						{"name": "역삼점", "addr": "서울 강남구 테헤란로 지하 156", "msg": "고객 만족도 1위", "price": "110,000원", "img":"room2.jpg"}
         					]};
         	

         	for(var i in infoList.info) {
        		geocodeAddress(geocoder, map, infoList.info[i].name, infoList.info[i].addr, infoList.info[i].msg, infoList.info[i].price, infoList.info[i].img);
         	}
         	       	
         	/* for(var i in addrList) {
        		geocodeAddress(geocoder, map, addrList[i]);
         	} */
 
			//주소에 마커 표시
            function geocodeAddress(geocoder, resultMap, name, addr, msg, price, img) {
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
                        var windowhtml = "<div class='map_room_info'>"
 										+	"<div class='map_room_img'>"
 										+		"<img src='http://localhost:9000/space/images/" + img + "'>"
 										+	"</div>"
 										+	"<div class='map_room_detail'>"
 										+		"<p class='map_room_name'>" + name + "</p>"
 										+		"<p class='map_room_msg'>" + msg + "</p>"	
 										+		"<p class='map_room_addr'>" + addr + "</p>"	
 										+		"<p class='map_room_price'>" + price + "<a href='http://localhost:9000/space/room_content.do'>상세 정보</a></p>"
 										+	"</div>"
 										+"</div>";
 										
 										
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