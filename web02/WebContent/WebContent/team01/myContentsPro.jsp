<%@page import="team01.QNADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("sId");

	if(id == null){
		Cookie [] cs = request.getCookies();
		if(cs != null){
			for(Cookie coo : cs){
				if(coo.getName().equals("cId")) id = coo.getValue();
			}session.setAttribute("sId", id);
		}
	}
	
	if( id == null){
		System.out.println("1111");
		%> 
		<script>
		alert('잘못된 접근');history.back();
		</script>
	<% }else{
	
	int num = Integer.parseInt(request.getParameter("num"));
	String text = request.getParameter("text");
		
	QNADAO dao = new QNADAO();
	
	dao.modifyContent(num, text);
	%>
	<script>alert("수정완료");history.back();</script>
<%}
%>
<body>


</body>
</html>