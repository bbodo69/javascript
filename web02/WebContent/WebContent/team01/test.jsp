<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <script>
alert('경고창나와랏');
	function alert (){
		alert('경고창나와랏');	
	}
</script>
--%>
<%
	String i = request.getParameter("test2");
	int a = Integer.parseInt(request.getParameter("test2"));
	System.out.println(i);
	System.out.println(a);
	response.sendRedirect("addpet.jsp");
%>
<body>
<%-- 되나안되나
	<input type="button" value="경고창띄우기" onclick="alert()"/>
--%>
</body>
</html>