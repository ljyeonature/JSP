<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="apply.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>

	<%
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		ApplyDAO dao = ApplyDAO.getInstance();
		boolean result = dao.checkLogin(id, pass);
		
		if(result) {
			session.setAttribute("userId", id);
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	
	%>

</body>
</html>