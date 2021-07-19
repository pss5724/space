<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0
}
</style>
<title></title>
</head>
<body>
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
		var jdata = "";
		function getMapList() {
			$.ajax({
				url: "get_map_list.do",
				success: function(data) {		
					//var tmp = JSON.stringify(data);
					//var jdata = JSON.parse(tmp);
					jdata = data;
				}
			});
		}
	    getMapList();
	    
		function number_format(numstr) {
			var numstr = String(numstr);
			var re0 = /(\d+)(\d{3})($|\..*)/;
			if (re0.test(numstr)) {
				return numstr.replace(re0, function(str,p1,p2,p3) { return number_format(p1) + "," + p2 + p3; });
			} else {
				return numstr;
			}
		}
	    
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

         	/* for(var i in infoList.info) {
        		geocodeAddress(geocoder, map, infoList.info[i].name, infoList.info[i].addr, infoList.info[i].msg, infoList.info[i].price, infoList.info[i].img);
         	} */
         	
         	for(var i in jdata.list) {
        		geocodeAddress(geocoder, map, jdata.list[i].rid, 
        				jdata.list[i].branch_name, jdata.list[i].intro, jdata.list[i].address, jdata.list[i].charge, jdata.list[i].rsfile1, jdata.list[i].capacity);
         	}
         	       	
         	/* for(var i in addrList) {
        		geocodeAddress(geocoder, map, addrList[i]);
         	} */
 
			//주소에 마커 표시
            function geocodeAddress(geocoder, resultMap, rid, branch_name, intro, address, charge, rsfile1, capacity) {
                //var address = addr;
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
 										+		"<img src='http://localhost:9000/space/upload/" + rsfile1 + "'>"
 										+	"</div>"
 										+	"<div class='map_room_detail'>"
 										+		"<p class='map_room_name'>" + branch_name + "</p>"
 										+		"<p class='map_room_msg'>" + intro + "</p>"	
 										+		"<p class='map_room_addr'>" + address + "</p>"	
 										+		"<p class='map_room_addr'>" + capacity + "인실</p>"	
 										+		"<p class='map_room_price'>" + number_format(charge) + "원"
 										+ 			"<a href='http://localhost:9000/space/room_content.do?rid=" + rid + "'>상세 정보</a></p>"
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