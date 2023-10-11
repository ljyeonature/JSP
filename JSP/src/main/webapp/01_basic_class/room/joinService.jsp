<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="apply.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinService</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String cofpass = request.getParameter("cofpass");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	
	
	ApplyVO vo = new ApplyVO();
	vo.setId(id);
	vo.setPass(pass);
	vo.setCofpass(cofpass);
	vo.setName(name);
	vo.setTel(tel);
	vo.setAddr(addr);
	
	ApplyDAO dao = ApplyDAO.getInstance();
	dao.insertJoin(vo);
	
	boolean result = dao.checkID(id);
	
	if(result) {
		out.println("<script>");
		out.println("alert('아이디 중복')");
		out.println("</script>");
		
	} else {
		response.sendRedirect("login.jsp");		
		
	}
		
	
	
	
	

%>
<body>

</body>
</html>