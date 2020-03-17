<%@page import="web.jsp1230.model.MemberDAO"%>
<%@page import="web.jsp1230.model.MemberDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
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
	request.setCharacterEncoding("UTF-8");

	String path = request.getRealPath("save");
	int max = 1024 * 1024 * 5;
	String enc = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);

	String id = mr.getParameter("id");
	String pw = mr.getParameter("pw");
	String pwCh = mr.getParameter("pwCh");
	String img = mr.getFilesystemName("img");
	String name = mr.getParameter("name");
	String birth = mr.getParameter("birth");
	String email = mr.getParameter("email");
	
	MemberDTO dto = new MemberDTO();
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setPwCh(pwCh);
	dto.setImg(img);
	dto.setName(name);
	dto.setBirth(birth);
	dto.setEmail(email);
	
	System.out.println(dto.getImg()+"signupPro");
	
	MemberDAO dao = new MemberDAO();
	dao.insertMember(dto);
	
	response.sendRedirect("main.jsp");
	
%>


</body>
</html>