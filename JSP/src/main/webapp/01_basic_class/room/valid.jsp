<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="apply.*" %>
<%
String id = request.getParameter("id");
ApplyDAO dao = ApplyDAO.getInstance();
boolean result = dao.checkID(id);

response.setContentType("application/json");

String jsonResponse = "{\"result\":" + result + "}"; // JSON 형식으로 수정

out.print(jsonResponse);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>