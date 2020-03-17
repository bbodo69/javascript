<%@page import="web.jsp1218.model.DAO01"%>
<%@page import="web.jsp1218.model.DTO01"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");
	String date = request.getParameter("date");	

	//오늘 날짜 출력. 날짜 형식 지정
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date time = new Date();
	String time1 = format.format(time);		
%>

<jsp:useBean id="dto" class="web.jsp1218.model.DTO01"></jsp:useBean>
<jsp:setProperty property="*" name="DTO01"/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%	 DAO01 dao = new DAO01();
	 dao.insertMember(dto);
%>
	
	<table border="1" class="table">
		 <tr>
		  <td>아이디</td>
		  <td colspan="4"><jsp:getProperty property="id" name="DTO01"/></td>
		 </tr>
		
		 <tr>
		  <td>비밀번호</td>
		  <td colspan="4"><jsp:getProperty property="pw" name="DTO01"/></td>
		 </tr>
		 
		 <tr>
		  <td>비밀번호 확인</td>
		  <td colspan="4"><jsp:getProperty property="pwCh" name="DTO01"/> </td>
		 </tr>
		 
		 <tr>
		  <td>이름</td>
		  <td colspan="4"><jsp:getProperty property="name" name="DTO01"/></td>
		 </tr>
		 
		 <tr>
		  <td>전화번호</td>
		  <td colspan="4"><jsp:getProperty property="number" name="DTO01"/></td>
		 </tr>
		 
		 <tr>
		  <td>취미</td>	 
		   <td> 	 
	 	 	 <jsp:getProperty property="hobby" name="DTO01"/>
<!--
 	 	 	 <jsp:getProperty property="b" name="DTO01"/>
	 	 	 <jsp:getProperty property="c" name="DTO01"/>
	 	 	 <jsp:getProperty property="d" name="DTO01"/>
 -->	 	 	 
		   </td>
	 	 </tr>
	 	 
	 	 
	 	 <tr>
	 	 	<td>성별</td>
	 	 	<td><jsp:getProperty property="gender" name="DTO01"/></td>
	 	 </tr>
 	 	 <tr>
	 	 	<td>생년월일</td>
	 	 	<td><%=date%></td>
	 	 </tr>	
	 	 <tr>
	 	 	<td>가입날짜</td>
	 	 	<td><%=time1 %>
	 	 	</td>
	 	 </tr>
	 	 
	  </table>
		  <a href="joinForm.jsp">회원가입 이동<br/></a>
		  <button onclick="location.href='joinForm1218.jsp'">회원가입 페이지 이동</button>
	
	

</body>
</html>