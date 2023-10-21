<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	// 프로젝트명을 미리 변수로 지정하고 시작
	String projectName = "/JSP";  

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>start.jsp</title>
</head>
<body>
	<a href='simpleView.jsp'>기존방식(상대경로)</a><br />
	<a href='<%=projectName %>/07_mvc_class/1_mvcSimple/simpleView.jsp'>기존방식(절대경로)</a><br />
	
	
	
	<a href='<%=projectName %>/SimpleControl'>MVC패턴</a>
	<a href='<%=projectName %>/ict.lee'>MVC2패턴</a>
	<a href='<%=projectName %>/ict.lee?type=first'>MVC3패턴</a>
</body>
</html>