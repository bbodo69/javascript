<%@page import="web.petDAO.model.BoardDAO"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
			if(coo[i].getName().equals(cId)) cId = coo[i].getValue();
		}
	}
	if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	if(request.getParameter("num") == null || sId == null){%>
		<script>
		alert("접근 오류");
		window.location.href = "/web/jspProject/pet/main.jsp"
		</script>	
<%	}else{
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pw = request.getParameter("pw");

	BoardDAO dao = new BoardDAO();
	String allpw = dao.getPw(num); 
	System.out.println("pw " + pw);
	System.out.println("allpw " + allpw);
	if(pw.equals(allpw)){ 
	dao.deleteBoard(num);
	String path = request.getRealPath("Boardimg");
	String photoname = "";
	photoname = dao.getPhotoname(num);
	if(photoname != null){
		path += ("\\" + photoname);
		File f = new File(path);
		f.delete();
	}
	response.sendRedirect("boardList.jsp");
	}else {%>
		<script>
			alert("비밀번호를 틀리셧습니다");
			history.go(-1);
		</script>		
<%	}
}
%>
<body>

</body>
</html>