<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키들 가져오기
	Cookie [] cookies = request.getCookies();
	for(Cookie c : cookies){
		out.println(c.getName() + " = " + c.getValue() + "<br />" );
	}
	
	
%>
<script>

		var addNum = 0; 
		var auto1 = setInterval(function(){
		addNum++;
		document.write("addNum : " + addNum);
		
		
		}, 1000);

</script>
</body>
</html>