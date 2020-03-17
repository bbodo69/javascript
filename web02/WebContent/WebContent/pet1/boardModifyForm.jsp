<%@page import="web.petDAO.model.BoardDTO"%>
<%@page import="web.petDAO.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
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
<%   }else{
   String pwch = request.getParameter("pwch");
   System.out.println(pwch);
   int num = Integer.parseInt(request.getParameter("num"));
   
   BoardDAO dao = new BoardDAO();
   BoardDTO article = dao.getArticle(num);
   String pw = dao.getPw(num);
   System.out.println("패스워드 " + pw);
   System.out.println("넘 " + num);

   if(!(sId.equals("admin"))){%>
   <script>
      function pwCh(){
         var check = document.modify;
         if(check.pw.value != check.pwch.value){
            alert("비밀번호가 불일치합니다");
            return false;
         }else{
            alert("비밀번호가 일치합니다.")
         }
      }
   
   </script>
   <%} %>
<body>

   <br/><br/>
   <form  onsubmit = "return pwCh()" action = "boardModifyPro.jsp?num=<%=article.getNum() %>" method = "post" name = "modify" encType = "multipart/form-data">
   <input type = "hidden" value = "<%=pw %>" name = "pw" >
   <table>
   <tr>
      <td width = "600" colspan = "4"><h1 align = "center">글쓰기</h1></td>
   </tr>
   <tr>
      <td>아이디</td>
      <td><text name = "id" readonly><%= article.getId()%></text></td>
      <td>제목</td>
      <td><input type = "text" name = "subject" value = "<%= article.getSubject()%>"></td>
   </tr>
   <tr>
      <td>내용</td>
      <td colspan = "3">
      <textarea rows="20" cols="70" name="content"><%=article.getContent() %></textarea>
      </td>
   </tr>
   <tr>
      <td>사진</td>
      <td colspan = "3" align = "left">
      <input type = "file" name = "photo">
      </td>
   </tr>
   <%if(!(sId.equals("admin"))){%>
   <tr>
      <td>비밀번호 확인</td>
      <td colspan = "3" align = "left">
         <input type = "password" name = "pwch">
      </td>
   </tr>
   <%} %>
   <tr>
      <td colspan = "4">
         <input type = "submit" value = "저장">
         <input type = "reset" value = "다시쓰기">
         <input type = "button" value = "리스트" onclick ="window.location='boardList.jsp'">
      </td>
   </tr>
   </table>
   </form>
<%} %>
</html>