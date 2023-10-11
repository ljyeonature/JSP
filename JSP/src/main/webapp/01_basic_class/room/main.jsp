<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
  //# 1."id"로 저장된 세션값을 얻어온다.
  	Object obj = session.getAttribute("userId");
  	//# 2. 값이 null이라면 LoginForm.jsp로 페이지 이동 => 로그인 안하고 메인 페이지로 온 거임.
  	if(obj == null) {
  		response.sendRedirect("login.jsp");
  	}
  	//# 3. null이 아니라면 String 형변환하여 변수에 지정(Casting - 클래스끼리-상속)
  	String user = (String)obj;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
</head>
<body>
	회원가입과 로그인 모두 성공
	<%=user %>님, 로그인 중입니다.
</body>
</html>