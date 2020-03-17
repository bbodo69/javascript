<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pwCh = request.getParameter("pwCh");
	String name = request.getParameter("name");
	String number = request.getParameter("number");
	String gender = request.getParameter("gender");
	String [] hobby = request.getParameterValues("hobby");
	String date = request.getParameter("date");
	
	//오늘 날짜 출력. 날짜 형식 지정
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date time = new Date();
	String time1 = format.format(time);
	
	if(hobby != null){
		for(int i = 0 ; i < hobby.length ; i++){
			out.println(hobby[i]+" ");
		}
	}
	
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	out.println("id : "+id+"<br />");
	out.println("pw : "+pw+"<br />");
	out.println("pwCh : "+pwCh+"<br />");
	out.println("name : "+name+"<br />");
	out.println("number : "+number+"<br />");
	out.println("gender : "+gender+"<br />");
	out.println("date : " + date+"<br />");
	out.println("joinDate : "+time1+"<br />");
%>
	
	<table border="1" class="table">
		 <tr>
		  <td>아이디</td>
		  <td colspan="4"><%= id %></td>
		 </tr>
		
		 <tr>
		  <td>비밀번호</td>
		  <td colspan="4"><%= pw %></td>
		 </tr>
		 
		 <tr>
		  <td>비밀번호 확인</td>
		  <td colspan="4"><%= pwCh %></td>
		 </tr>
		 
		 <tr>
		  <td>이름</td>
		  <td colspan="4"><%=name %></td>
		 </tr>
		 
		 <tr>
		  <td>전화번호</td>
		  <td colspan="4"><%=number %></td>
		 </tr>
		 
		 <tr>
		  <td>취미</td>	 
		 	 <td> 	 
		 	 	<%if(hobby != null){ 
			 	 	for(int i = 0 ; i < hobby.length ; i++){ %>
			 	    <%=hobby[i]%>		 	    
			 	    <% }
			 	 	}%> 	 
		 	 </td>
	 	 </tr>
	 	 
	 	 
	 	 <tr>
	 	 	<td>성별</td>
	 	 	<td><%=gender%></td>
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
	<% response.sendRedirect("finishJoin.jsp");
	   
	%>
	

</body>
</html>