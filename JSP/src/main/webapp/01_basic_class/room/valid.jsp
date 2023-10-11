<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="apply.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
ApplyDAO dao = ApplyDAO.getInstance();
boolean result = dao.checkID(id);
if(result) {
	out.println("<script>");
	out.println("alert('아이디 중복')");
	out.println("</script>");
	
} else {
	response.sendRedirect("login.jsp");		
	
}
%>

</body>
</html>