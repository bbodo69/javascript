<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" id="input"><br>
<textarea id="output"></textarea>
<button onclick="input()">입력받기</button>
<button onclick="output()">출력하기</button>


<!-- 아래부터 자바스크립트 -->
<script type="text/javascript">
var temp;

function input(){
var input = document.getElementById("input").value;
temp = input;
}

function output(){
document.getElementById("output").value = temp;
}
</script>


</body>
</html>