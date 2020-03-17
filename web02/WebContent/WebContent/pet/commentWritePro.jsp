<%@page import="web.pet.model.CommentbDTO"%>
<%@page import="web.pet.model.CommentbDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%

	request.setCharacterEncoding("UTF-8");	

	//세션,버그잡기 완료
	String sId = (String)session.getAttribute("sId");
	if(sId == null){%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>
	<%}
	
	//2.
	String path= request.getRealPath("commentImg");
	//3.
	int max = 1024*1024*5;
	//4.
	String enc = "UTF-8";
	//5.
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = null;
	
	try{
		mr = new MultipartRequest(request, path, max, enc, dp);
		
		String sysname = mr.getFilesystemName("img");
		String contentT = mr.getContentType("img");
		if(sysname != null){
			String[] ct = contentT.split("/");
			if(!(ct[0].equals("image"))){
				File f = new File(sysname);
				f.delete();
			%>
				<script type="text/javascript">
					alert("이미지 파일이 아닙니다. 이미지 파일을 업로드해주세요.");
					history.go(-1);
				</script>		
			<%	
			}
		}
		
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String area = mr.getParameter("area");
		String name = mr.getParameter("name");
		String petdate = mr.getParameter("petdate");
		String petday = mr.getParameter("petday");
		int point = 0;
		if(mr.getParameter("point") != null){
			point = Integer.parseInt(mr.getParameter("point"));
		}
		String ip = request.getRemoteAddr();
		//System.out.println(area+"/"+name+"/"+point+"/"+subject+"/"+content+"/"+ip);
		CommentbDTO comment = new CommentbDTO();
		comment.setId(sId);
		comment.setName(name);
		comment.setSubject(subject);
		comment.setContent(content);
		comment.setImg(sysname);
		comment.setArea(area);
		comment.setPetdate(petdate);
		comment.setPetday(petday);
		comment.setPoint(point);
		comment.setIp(ip);
		comment.setReg(new Timestamp(System.currentTimeMillis()));
		
		CommentbDAO dao = new CommentbDAO();
		int number = dao.insertCommenet(comment);
		
	%>
	<body>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<br/>
		<table>
			<tr>
				<td>후기가 등록되었습니다.<br/>
				<button onclick="window.location.href='commentList.jsp'">리스트보기</button>
				<button onclick="window.location.href='commentContent.jsp?num=<%=number%>&pageNum=1'">작성글확인</button>
				</td>
			</tr>
		</table>
	
	</body>
		
 	<%}catch(Exception e){%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>
	<%}%>
	
</html>