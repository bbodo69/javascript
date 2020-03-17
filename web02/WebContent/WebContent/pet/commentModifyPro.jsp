<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="web.pet.model.CommentbDAO"%>
<%@page import="web.pet.model.CommentbDTO"%>
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
	String pageNum = null;
	int num = 0; 
	

	if(request.getParameter("pageNum") == null || request.getParameter("num") == null || sId == null){%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>
	<%}else {
		pageNum = request.getParameter("pageNum");
		num = Integer.parseInt(request.getParameter("num"));
	}

	
	//2.
	String path= request.getRealPath("commentImg");
	//D:\hyunsu\classclass\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\web\commentImg
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
			File f = new File(sysname);
			if(!(ct[0].equals("image"))){
				f.delete();
			%>
				<script type="text/javascript">
					alert("이미지 파일이 아닙니다. 이미지 파일을 업로드해주세요.");
					history.go(-1);
				</script>		
			<%	
			}
			
		}
		
		num = Integer.parseInt(mr.getParameter("num"));
		int ref = Integer.parseInt(mr.getParameter("ref"));
		int re_step = Integer.parseInt(mr.getParameter("re_step"));
		
		String subject = mr.getParameter("subject");
		String content = mr.getParameter("content");
		String area = mr.getParameter("area");
		String name = mr.getParameter("name");
		String petdate = mr.getParameter("petdate");
		String petday = mr.getParameter("petday");
		int point = Integer.parseInt(mr.getParameter("point"));
		//System.out.println(area+"/"+name+"/"+point+"/"+subject+"/"+content+"/"+ip);
		CommentbDAO dao = new CommentbDAO();
		
		String img = dao.commentImage(num);
		if(sysname == null)	{
			sysname = img;
		}else{
			File f = new File("D:\\hyunsu\\classclass\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\web\\commentImg\\"+img);				
			f.delete();
		}	
		
		CommentbDTO comment = new CommentbDTO();
		comment.setId(sId);
		comment.setNum(num);
		comment.setSubject(subject);
		comment.setContent(content);
		comment.setArea(area);
		comment.setName(name);
		comment.setPetdate(petdate);
		comment.setPetday(petday);
		comment.setPoint(point);
		comment.setImg(sysname);
		
		dao.modifyComment(comment);
		
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
				<td>수정이 완료되었습니다.<br/>
				<button onclick="window.location.href='commentList.jsp?pageNum=<%=pageNum%>'">리스트보기</button>
				<button onclick="window.location.href='commentContent.jsp?num=<%=num%>&pageNum=<%=pageNum%>'">수정글확인</button>
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