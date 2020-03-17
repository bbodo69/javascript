<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <h2>While문 예제 = 임의의 값을 임의의 횟수로 곱하기</h2>

    <%
    int boxnum = Integer.parseInt(request.getParameter("boxnum"));
    String boxWidth = request.getParameter("boxWidth");
    String boxHeight = request.getParameter("boxHeight");
    int count = 0;
    
    while(count<boxnum) { %>
    
    <div
    	style=	"width: <%= boxWidth %>;
    		   	 height : <%= boxHeight %>;
    		   	 background-color : #fcff5b;
    		   	 margin : 3px;
    		   	 float : left"></div>
    		   	 
	<% count++;}
    %>