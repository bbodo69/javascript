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
//			location.href="createRoomForm.jsp?latitude="+latitude+"&longitude="+longitude
		
</script>
<body>

</body>
</html>