<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="apply.*" %>
<%
String id = request.getParameter("id");
ApplyDAO dao = ApplyDAO.getInstance();
boolean result = dao.checkID(id);

String resultData = "NO";
if(result) resultData = "YES";
out.write(resultData);

%>
