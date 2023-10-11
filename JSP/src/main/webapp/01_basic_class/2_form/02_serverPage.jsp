<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%
	// 인코딩 처리 => form의 method = post일 경우
	request.setCharacterEncoding("utf-8");
	// 이름
	String name = request.getParameter("name");
	// 성별
	String gender = request.getParameter("gender");
	// 직업
	String occupation = request.getParameter("occupation");
	// 취미
	String[] hobby = request.getParameterValues("hobby");
	
	String hobbyText = "";
	// null 값일 경우 처리
	for(int i = 0; hobby!=null && i < hobby.length; i++){
		hobbyText += hobby[i] + "/";
	}
	
/* 	public String arr(hobby){
		for(String h : hobby) return (h  + " ");
	} */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_serverPage</title>
</head>
<body>
	이름 : <%= name %> <br />
	성별 : <%= gender %> <br />
	직업 : <%= occupation %> <br />
	취미 : <%= hobbyText %> <br />
</body>
</html>