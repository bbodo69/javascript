<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.table{
		position: absolute;
		top:200px;
		left:200px;		
		}	
		
		.p{
            background-color:white;  
            height: 500px;
            width: 500px;
            position: absolute;
            top:70px;
			left:140px;
            
        }
        .h1{
		position : absolute;
		top:100px;
		left:280px;
		}
	</style>
</head>
<body>
	
	<p class="p"></p>
	<h1 class="h1"> 회원가입 </h1>
	<form method="post" action="semangat2.jsp" onsubmit="return check()" name="inputform" >
		<table border="1" class="table">
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
</body>
</html>