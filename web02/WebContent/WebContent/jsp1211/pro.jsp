<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	//한글이 안 깨지게 해주는  구문
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	out.println("id : "+id+"<br />");
	out.println("pw : "+pw+"<br />");
	
	String [] pets = request.getParameterValues("pet");
	if(pets != null){ 
		for(int i =0;i<pets.length;i++){
			out.println(pets[i] + " ");
		}
	}
	out.println("<br />");
	
	Enumeration paramNames = request.getParameterNames();
	// 이름 목록 출력
	while(paramNames.hasMoreElements()){		
		String name = (String)paramNames.nextElement();
		out.println(name+ " ");
	}

%>

<body>
	<h1>pro page</h1>
	<table border="1">
		<tr>
			<td> id </td>
			<td> <%= id %> </td>
		</tr>
		<tr>
			<td> pw </td>
			<td> <%= pw %> </td>
		</tr>
		<tr>
			<td> pets </td>
			<td> 			
				<input type="checkbox" name="pet" value="dog"
				<% if(pets !=null){
					for(String p : pets){
						if(p.equals("dog")) { %>
							checked
						<% }
				   	 	}
					}%>
				> 강아지
				<input type="checkbox" name="pet" value="cat"
				<% if(pets !=null){
					for(String p : pets){
						if(p.equals("cat")) { %>
							checked
						<% }
				   	 	}
					}%> 
				 > 고양이
				<input type="checkbox" name="pet" value="tiger"
				<% if(pets !=null){
					for(String p : pets){
						if(p.equals("tiger")) { %>
							checked
						<% }
				   	 	}
					}%>					
				> 호랑이				
			</td>
		</tr>
			
	</table>
</body>
</html>