<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.jsp1213.test.FormVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>

 	<jsp:useBean id="vo" class="web.jsp1213.test.FormVO"></jsp:useBean>

<%--<jsp:setProperty name="vo" property="id" />
	<jsp:setProperty name="vo" property="pw" />
	<jsp:setProperty name="vo" property="name" />
	<jsp:setProperty name="vo" property="age" />
--%>	
	<jsp:setProperty name="vo" property="*" />
<%--setProperty 액션태그는 해당 set매서드 호출해서 값 저장지켜줌 --%>


	id : <jsp:getProperty property="id" name="vo"/> <br />
	pw : <jsp:getProperty property="pw" name="vo"/> <br />
	name : <jsp:getProperty property="name" name="vo"/> <br />
	age : <jsp:getProperty property="age" name="vo"/> <br />
	
	
<%	
	//데이터 꺼내기
	

//	String id = request.getParameter("id");
//	String pw = request.getParameter("pw");
//	String name = request.getParameter("name");
//	String age = request.getParameter("age");
%>

<%--id : <%=id %> <br />
	pw : <%=pw %> <br />
	name : <%=name %> <br/>
	age : <%=age %> <br />
--%>


<%
//  FormVO vo = new FormVO();
//	vo.setId(id);
//	vo.setPw(pw);
//	vo.setName(name);
//	vo.setAge(age);	 	
%>	
<%--id : <% vo.getId(); %>
	pw : <% vo.getPw(); %>
	name : <% vo.getName(); %>
	age : <% vo.getAge(); %>
--%>







</body>
</html>