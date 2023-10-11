<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 가입</title>
<%
	

%>
<!-- 외부 CSS 연결 -->
<!-- <link href='../2_form/09_myform.css' rel='stylesheet' /> -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
/* DAO에서 checkID의 결과(true)를 받아옴. */
$(function(){
	$('#checkID').on('click',function(){
		
	})
})
	
</script>
</head>

<body>
	<form action="joinService.jsp" method="post">
		
			<h1>회원가입서 작성하기</h1>
			<ul>
				<li>
					<label for="id">아이디</label> 
					<input id="id" name="id" type="text" required>
					<span><button id='checkID'>중복확인</button></span>
				</li>
				<li><label for="pass">비밀번호</label> 
					<input id="pass" name="pass" type="password" required>
				</li>
				<li>
					<label for="cofpass">비밀번호 확인</label> 
					<input id="cofpass" name="cofpass" type="password" required>
				</li>
				<li>
					<label for="name">이름</label> 
					<input id="name" name="name" type="text" required>
				</li>
				<li>
					<label for="tel">전화번호</label> 
					<input id="tel" name="tel" type="text" required>
				</li>
				<li>
					<label for="addr">주소</label> 
					<input id="addr" name="addr" type="text" required>
				</li>
			</ul>
		
			<button type="submit">회원가입</button>
			<button >취소</button>
	</form>
</body>
</html>
