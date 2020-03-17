<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function findLocation(){
	if(navigator.geolocation){
		navigator.geolocation.getCurrentPosition(showYourLocation);
	}else{
		loc.innerHTML = "지원하지 않는 웹 브라우저";
	}
}

function showErrorMsg(error){
	switch(error.code) {
	case error.PERMISSION_DENIED;
	loc.innerHTML = "요청거부시"	
	break;
	case error.POSITION_UNAVAILABLE;
	loc.innerHTML = "위치정보 사용 불가"
	break;
	case error.TIMEOUT;
	loc.innerHTML = " 요청시간 초과"
	break;
	case error.UNKNOWN_ERROR:
    loc.innerHTML = "이 문장은 알 수 없는 오류가 발생했을 때 나타납니다!"
    break;
	}
}
</script>
</body>
</html>