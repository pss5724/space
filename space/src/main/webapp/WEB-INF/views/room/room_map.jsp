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
	margin: auto;
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
	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJE8peRXRO0ACfNfstLiSpXZv0lLoniEc&callback=initMap"></script>
	<script>
		getMapList();

		var jdata = "";
		function getMapList() {
			$.ajax({
				url: "get_map_list.do",
				success: function(data) {
					jdata = data;
				}
			});
		}
		
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
			var map = new google.maps.Map(document.getElementById('google-map'), {
				zoom: 10,
				center: {
					lat: 37.4959854,
					lng: 127.0664091
				}
			});

		 	var geocoder = new google.maps.Geocoder();

		 	for(var i in jdata.list) {
				geocodeAddress(geocoder, map, jdata.list[i].rid, jdata.list[i].branch_name, jdata.list[i].intro, 
								jdata.list[i].address, jdata.list[i].charge, jdata.list[i].rsfile1, jdata.list[i].capacity);
		 	}
 
			//주소에 마커 표시
			function geocodeAddress(geocoder, resultMap, rid, branch_name, intro, address, charge, rsfile1, capacity) {
				geocoder.geocode({'address': address}, function(result, status) {
					if (status === 'OK') {
						resultMap.setCenter(result[0].geometry.location);
						resultMap.setZoom(13);

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