<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<form action="loginService.jsp" method="post">
		
	<h1>로그인</h1>

	<label for="id">아이디</label> 
	<input id="id" name="id" type="text" required>
	<br/>
	<label for="pass">비밀번호</label> 
	<input id="pass" name="pass" type="password" required>
	
	<input type='submit' value='로그인'/>

</form>
</body>
</html>