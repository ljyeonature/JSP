<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_mybatis.model.*,board_mybatis.service.*" %>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="rec" class="board_mybatis.model.BoardVO">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>

<%
	int seq = WriteArticleService.getInstance().write(rec); 
	//BoardSave.jsp에서 새로고침을 하게 되면 중복 입력되기에
	// 추후에 입력 후 BoardView.jsp?id=글번호 로 넘겨서 처리하고자
	
%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^
</body>
</html> -->
<%
/* 새로고침을 하게 되면 중복 입력이 되기 때문에 redirect를 쓴다. */
	response.sendRedirect("BoardView.jsp?seq=" + seq);
 %>

	
