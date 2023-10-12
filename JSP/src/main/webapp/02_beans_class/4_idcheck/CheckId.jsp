<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.*" %>

<%
	String userId = request.getParameter("userId");
	boolean result = MemberDao.getInstance().isDuplicatedId(userId);
	String resultData = "NO";
	if(result) resultData = "YES";
	out.write(String.valueOf(resultData));
%>
  