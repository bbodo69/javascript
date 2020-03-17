<%@page import="web.petDAO.model.BoardDTO"%>
<%@page import="web.petDAO.model.BoardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script&display=swap&subset=korean" rel="stylesheet">
<link href="xListStyle.css" rel="stylesheet" type="text/css" />
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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	
	int number = 0;
	int readcount = 0;
	int comment = 0;
	int count = 0;
	int pagesize = 10;
	List articleList = null;
	
	BoardDAO dao = new BoardDAO();
	count = dao.countBoard();
	int startRow = (currentPage - 1) * pagesize + 1; 
	System.out.println("startRow " + startRow);
	int endRow = currentPage * pagesize;
	System.out.println("endRow " + endRow);
	
	if(count > 0){
		articleList = dao.getArticles(startRow,endRow);
		System.out.println("1articleList.size " + articleList.size());
	}
	System.out.println("count " + count);
	System.out.println("2articleList.size " + articleList.size());
	
	number = count - (currentPage - 1) * pagesize;
	
	
%>
<body>
   <header>
      <jsp:include page="petHeader.jsp" flush="false"/>
   </header>
   <section>
       	<%if(!(sId == null)){
		if(sId.equals("admin")){%>
		<h1 align = "center">(관리자) 자유 게시판</h1>
        <%	}else{	%>
        <h1 align = "center">자유 게시판</h1>
        <% 	}
        }%>
        <br/><br/>
        <table>
            <tr>
                <td width = "600" colspan = "5" ><h1>목록</h1>
                <button   onclick = "window.location.href='main.jsp'">메인</button>
                <button   onclick = "window.location='boardWriterForm.jsp'">글쓰기</button>
                </td>
            </tr>
            <tr>
                <td>No.</td>
                <td>글쓴이</td>
                <td>제목</td>
                <td>조회수</td>
                <td>날 짜</td>
            </tr>
            <%for(int i = 0; i < articleList.size(); i ++){ 
            BoardDTO article = (BoardDTO)articleList.get(i);
            %>
            <tr>
                <td><%=number - i %></td>
                <td><%=article.getId() %></td>
                <td><a href = "boardContent.jsp?num=<%= article.getNum()%>"><%=article.getSubject() %></a></td>
                <td><%=article.getReadcount() %></td>
                <td><%=sdf.format(article.getReg()) %></td>

            </tr> 
            <% } %>

        </table>
        <div align = "center">
        <%
        if(count > 0){
            int pagecount = (count / pagesize) + (count % pagesize == 0?0:1);		

            int startpage = (currentPage / pagesize) * pagesize + 1;

            int endpage = startpage + pagesize -1;

            if(endpage > pagecount) endpage = pagecount;
            
            if(startpage > pagesize){%>
                <a href = "boardList.jsp?pageNum = <%= startpage - pagesize %>">&lt;</a>
            <%}
            for(int i = startpage; i <= endpage; i++){%>
                <a href = "boardList.jsp?pageNum=<%=i%>">&nbsp;<%= i %>&nbsp;</a>
            <%}
            if(endpage < pagecount){%>
                <a href = "boardList.jsp?pageNum = <%= startpage + pagesize %>">&gt;</a>
            <%
                }
            } %>
        </div> 
        <br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>    
    </section>
	<footer>
      <jsp:include page="petFooter.jsp" flush="false"/>
   </footer>
</body>
</html>