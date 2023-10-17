<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>   
 <!-- 수정하고자하는 내용에 대해 url에서 가져오고 -->
<% 
    long commentNo = Integer.parseInt( request.getParameter("cId"));
	String commentContent = request.getParameter("commentContent");
 %>
 <!-- Comment 객체에 저장한다. -->
 <jsp:useBean id="c" class="mybatis.guest.model.Comment">
 	<jsp:setProperty name="c" property="commentNo" value="<%=commentNo %>"/>
 	<jsp:setProperty name="c" property="commentContent" value="<%=commentContent %>"/>
 </jsp:useBean>
<%
	/* 내용을 수정하는 함수를 불러온다. - 저장된 객체를 매개변수로 넣고 */
  	CommentService.getInstance().modifyCommentByPK(c);
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