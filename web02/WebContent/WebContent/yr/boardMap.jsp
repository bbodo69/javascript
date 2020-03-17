<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
		
		var destination = null;
		
		var latitude = null;
		var longitude = null;	 
		
		function getLocation() {
			  if (navigator.geolocation) { // GPS를 지원하면
			    navigator.geolocation.getCurrentPosition(function(position) {
			      
			      latitude = position.coords.latitude;
			      longitude = position.coords.longitude;			   
			      
			    }, function(error) {
			      console.error(error);
			    }, {
			      enableHighAccuracy: false,
			      maximumAge: 0,
			      timeout: Infinity
			    });
			  } else {
			    alert('GPS를 지원하지 않습니다');
			  }
			}
			getLocation();

</script>
<body>
<div id="map" style="width:1000px;height:1000px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a942ed9c97d714f8edddd8e1bde7f8b5"></script>
	<script>
		
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(latitude, longitude),
			level: 3
		};
		console.log('latitude = '+latitude+'  //  longitude = '+longitude );

		var map = new kakao.maps.Map(container, options);
		
		// 마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(latitude, longitude);
		
		
		// 마커를 생성합니다.
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		

		// 마커가 지도위에 표시되도록 설정
		marker.setMap(map);
		
		// 지도 위의 마커를 제거하는 코드
		// marker.setMap(null);
		
		
	</script>
</body>
</html>