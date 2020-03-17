<%@page import="web.jsp1230.model.uploadDAO"%>
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
</head>
<%
	request.setCharacterEncoding("UTF-8");
//	 	 ==> MultipartRequest 클래스 사용
//		1. request 객체
//		2. 업로드 될 파일 저장 경로
//		자바에서 파일 저장할 때
//		String path= "d://test//";	// 내 pc 안에 파일 저장 방식
//		웹상에서 파일을 보여주고 하려면 서버에 저장 되어야한다.
		String path = request.getRealPath("save");
		System.out.println(path);
//		3. 업로드 할 파일 최대 크기
		int max = 1024 * 1024 * 5 ; // 5 MB
//		4. 인코딩 타입 (UTF-8)
		String enc = "UTF-8";
//		5. 업로드된 파일 이름 같을 경우, 덮어씌우기 방지 코드 : 중복시, 파일이름에 자동으로 1, 2, 3...
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
//		MultipartReqtuest 객체 생성
		MultipartRequest mr = new MultipartRequest(request, path, max, enc, dp);

//		파일 업로드시 useBean, setProperty 사용 불가.
		String writer = mr.getParameter("writer");
		String sysName = mr.getFilesystemName("upload");	// 업로드 파일 이름.
		String orgName = mr.getOriginalFileName("upload");   //파일 원본 이룸
		String contentType = mr.getContentType("upload");
		
		// ## 파일 저장 : 웨이 지정한 path로 파일 자동 저장됨
		
		// 사진만 올릴수 있게 하기.
		// contentType : image/jpeg
		String [] type = contentType.split("/");
		if(!(type != null && type[0].equals("image"))){
			File f = mr.getFile("upload"); // 해당파일을 File 객체에 담기
			f.delete();
			System.out.println("이미지 파일이 아니라 삭제되었습니다..");
		}
		
		// DB 에 저장 ==> DAO
		uploadDAO dao = new uploadDAO();
		dao.uploadImg(writer, sysName);
		
		
%>
<body>

	<h1> form page</h1>
	<h2>작성자 ==> <%=writer %></h2>
	<h2>업로드 파일명 ==> <%=sysName%></h2>
	<h2>원본 파일명 ==> <%=orgName %></h2>
	<h2>파일 종류 ==> <%=contentType%></h2>
	<img src="/web/save/<%=sysName%>" />
	<%-- src="/프로젝트명/폴더명.../파일명" 이렇게 해야 다른브라우저에서도 정상적으로 서비스 가능 --%>
	<h1></h1>
</body>
</html>