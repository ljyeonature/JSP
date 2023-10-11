<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>
    
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%
	

	/* // 실제로는 DB에서 가져와야하는 값
	String saveUser = "chunsik";
	String savePass = "5555"; */
	
	// 이전화면 폼에서 넘겨받는 값
	// 한글 있으면~~
	// request.setCharacterEncoding("utf-8");
	String user = request.getParameter("User");
	int pass = Integer.parseInt(request.getParameter("Pass"));
			
	EmpDAO dao = EmpDAO.getInstance();
	boolean result = dao.checkLogin(user, pass);
	
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if( result ){
		// #2. 세션에 "id"라는 이름에 변수 user 값을 저장
		session.setAttribute("id", user);
		
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청
		response.sendRedirect("MainPage.jsp");

	} else {

		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청
		response.sendRedirect("LoginForm.jsp");		

	}			
%>
	
</body>
</html>