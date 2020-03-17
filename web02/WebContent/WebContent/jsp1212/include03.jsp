<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%
		 int a = 10;
		
		%>

	<table border="1" align="center">
		<tr>
			<td colspan="2">
				<jsp:include page="layoutHeader.jsp"></jsp:include>
									<%--a값을 불러오려면 param을 이용해야함  --%>
			</td>
		</tr>
		<tr>
			<td>
				<jsp:include page="leftMenu.jsp"></jsp:include>
			</td>	
			<td>
							<form method="post" action="semangat2.jsp" onsubmit="return check()" name="inputform" >
				<table border="0" class="table">
					 <tr>
		           <td >아이디</td>
		           <td colspan="4"><input type="text" name="id"></td>
		       </tr>
		       <tr>
		           <td>비밀번호</td>
		           <td colspan="4"><input type="password" name="pw"></td>
		       </tr>
		       <tr>
		           <td>비밀번호 확인</td>
		           <td colspan="4"><input type="password" name="pwCh"></td>
		       </tr>
		       <tr>
		           <td>이름</td>
		           <td colspan="4"><input type="text" name="name"></td>
		       </tr>
		       <tr>
		           <td>전화번호</td>
		           <td colspan="4"><input type="text" name="number"></td>
		       </tr>
		       <tr>
		           <td>취미</td>
		           <td><input type="checkbox" name="hobby" value="a">a</td>
		           <td><input type="checkbox" name="hobby" value="b">b</td>
		           <td><input type="checkbox" name="hobby" value="c">c</td>
		           <td><input type="checkbox" name="hobby" value="d">d</td>
		       </tr>
		       <tr>
		       		<td colspan="5">
		       		<input type="radio" name="gender" value="male" checked>Male<br>
		       		<input type="radio" name="gender" value="female">Female<br>
		       		<input type="radio" name="gender" value="other">other
		       		</td>
		       </tr>
		       <tr>
		       		<td>생년월일</td>
		       		<td colspan="4">
		       		<input type="date" name="date" max="9999-12-31">
		       		</td>
		       </tr>
		         <tr>
		           <td colspan="5" >
		                 <input type="submit" value="가입"  />
		                 <input type="reset" value="reset" />
		           </td>
		          </tr>
		          </table>
			</form>
			</td>
		</tr>
		<tr>
			<td colspan="2">footer</td>
		</tr>
	

	</table>

</body>
</html>