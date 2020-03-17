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

<jsp:useBean id="SignupFormVO" class="web.jsp1213.test.SignupFormVO"></jsp:useBean>
<jsp:setProperty property="*" name="SignupFormVO"/>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<table border="1" class="table">
		 <tr>
		  <td>아이디</td>
		  <td colspan="4"><jsp:getProperty property="id" name="SignupFormVO"/></td>
		 </tr>
		
		 <tr>
		  <td>비밀번호</td>
		  <td colspan="4"><jsp:getProperty property="pw" name="SignupFormVO"/></td>
		 </tr>
		 
		 <tr>
		  <td>비밀번호 확인</td>
		  <td colspan="4"><jsp:getProperty property="pwCh" name="SignupFormVO"/> </td>
		 </tr>
		 
		 <tr>
		  <td>이름</td>
		  <td colspan="4"><jsp:getProperty property="name" name="SignupFormVO"/></td>
		 </tr>
		 
		 <tr>
		  <td>전화번호</td>
		  <td colspan="4"><jsp:getProperty property="number" name="SignupFormVO"/></td>
		 </tr>
		 
		 <tr>
		  <td>취미</td>	 
		   <td> 	 
	 	 	 <jsp:getProperty property="a" name="SignupFormVO"/>
	 	 	 <jsp:getProperty property="b" name="SignupFormVO"/>
	 	 	 <jsp:getProperty property="c" name="SignupFormVO"/>
	 	 	 <jsp:getProperty property="d" name="SignupFormVO"/>
		   </td>
	 	 </tr>
	 	 
	 	 
	 	 <tr>
	 	 	<td>성별</td>
	 	 	<td><jsp:getProperty property="gender" name="SignupFormVO"/></td>
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
		  <button onclick="location.href='joinForm.jsp'">회원가입 페이지 이동</button>

	

</body>
</html>