<%@page import="web.pet.model.QNADAO"%>
<%@page import="web.pet.model.QNADTO"%>
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
		%> 
		<script>
		alert('잘못된 접근');history.back();
		</script>
	<% }else{
			if(request.getParameter("delete")==null){				
				int num = Integer.parseInt(request.getParameter("num"));
				String text = request.getParameter("text");
					
				QNADAO dao = new QNADAO();
				
				dao.modifyContent(num, text);
				%>
				<script>alert("수정완료");history.back();</script>
				<%			
				
			}else{
				int num = Integer.parseInt(request.getParameter("delete"));
				
				QNADAO dao = new QNADAO();
				
				dao.deleteContent(id, num);
				%>
				<script>alert("삭제완료");location.href='mycontent.jsp';</script>
				<%				
			}				
		}
		%>
<body>


</body>
</html>