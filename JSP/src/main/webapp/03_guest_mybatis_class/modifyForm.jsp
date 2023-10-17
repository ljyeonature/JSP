<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>  
 <% 
 /* view에서 들어온 값들을 url에서 가져온다 */
	 long commentNo = Integer.parseInt( request.getParameter("cId"));
	 String userId = request.getParameter("userId");
	 String commentContent = request.getParameter("commentContent");
	 Comment comment = CommentService.getInstance().selectCommentByPK(commentNo);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>수정</h1>
	<form name="frm" action="modifyComment.jsp" method="post">
<table>
	<tr><td>글번호</td><td><input type="text" name="cId" size="3" value="<%= commentNo%>"/></td></tr>
	<tr><td>작성자</td><td><input type="text" name="userId" size="15" value="<%=comment.getUserId()%>"/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40"><%= comment.getCommentContent()%></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>
</body>
</html>