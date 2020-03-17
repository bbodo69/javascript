<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.Date"
    session="true"
    buffer="8kb"
    autoFlush="true"
    isThreadSafe ="true"
    info="화면에 출력안되는 메모 가능"
    errorPage="error.jsp"
    isErrorPage="false"
	isELIgnored="false"
	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	서버 : <%= application.getServerInfo() %> <br />
	서블릿 : <%= application.getMajorVersion() %>.<%=application.getMinorVersion() %><br />
	jsp : <%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
	<%= 0/0 %>

</body>
</html>