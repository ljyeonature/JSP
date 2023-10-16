<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   
    <% 
    long commentNo = Integer.parseInt( request.getParameter("cId"));
  	CommentService.getInstance().modifyCommentByPK(commentNo);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% response.sendRedirect("viewComment.jsp?cId=" + commentNo); %>
	
</body>
</html>