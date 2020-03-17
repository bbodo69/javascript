<%@page import="web.pet.model.GetpetDTO"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="web.pet.model.GetpetDAO"%>
<%@page import="java.sql.Timestamp"%>
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
	String sId = (String)session.getAttribute("sId");
	String cId = null;
	Cookie[] coo = request.getCookies();
	if(coo != null){
		for(int i = 0; i < coo.length; i++){
		if(coo[i].getName().equals("cId")) cId = coo[i].getValue();
		}
	}

	if(sId == null && cId == null){	%>
		<script>
			alert("접근오류.");
			window.location.href="main.jsp";
		</script>	
<%	}else if(sId == null && cId != null){
		session.setAttribute("sId", cId);
		sId = cId;
	}
	
	
	//2. 저장위치
	String path = request.getRealPath("getpetImage");
	//3. 크기
	int max = 1024*1024*5;
	//4. 인코딩
	String enc = "UTF-8";
	//5. 중복처리
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	
	MultipartRequest mr = null;
	
	try{
		mr = new MultipartRequest(request, path, max, enc, dp);
		
		//img파일 검사
		String sysname = mr.getFilesystemName("img");
		String contentType = mr.getContentType("img");
		
		System.out.println(request.getRealPath("getpetImage"));
	
		if(contentType != null){
			String[] ct = contentType.split("/");
			
			if(!(sysname != null && ct[0].equals("image"))){
				File f = new File("sysname");
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
		String petsit = mr.getParameter("petsit");
		int point = Integer.parseInt(mr.getParameter("point"));
		
		GetpetDTO article = new GetpetDTO();
		
		//dto에 글 정보 저장  
		article.setId(sId);   //임시로 이름꺼내어 id에 담기
		article.setSubject(subject);
		article.setContent(content);
		article.setIp(request.getRemoteAddr());
		article.setReg(new Timestamp(System.currentTimeMillis()));
		article.setImg(sysname);
		article.setArea(area);
		article.setPetsit(petsit);

		
		GetpetDAO dao = new GetpetDAO();
		dao.insertArticle(article);
		
		
		int num = dao.getArticleNum(article.getId(),article.getSubject(),article.getContent());
	
		%>
		
		<body>
			<table>
				<tr>
					<td>글 등록이 완료되었습니다.<br/>
					<button onclick="window.location.href='getpetList.jsp'">리스트보기</button>
					<button onclick="window.location.href='getpetContent.jsp?num=<%=num%>&pageNum=1'">작성글확인</button>
					</td>
				</tr>
			</table>
		</body>
	<% }catch(Exception e){%>
		<script>
			alert("접근 오류.");
			window.location.href='main.jsp';
		</script>
 	<% } %>	
	
</html>