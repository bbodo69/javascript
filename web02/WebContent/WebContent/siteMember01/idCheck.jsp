<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function useId(){
		opener.document.getElementById("idParent").value = document.getElementById("idCheck").value;
		self.close();
	}

</script>
</head>

<body>
<form action="idCheckPro.jsp" method="post">
	<table>
		<tr>
			<td>
				<input type="text" id="idCheck" name="id">
				<input type="submit" value="중복확인">
				<input type="button" value="창닫기" onclick="self.close()">
				<input type="button" value="사용하기" onclick="useId()">
			</td>
		</tr>
	</table>
</form>
</body>

</html>