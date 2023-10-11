<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="temp.*" %>

<%@ page errorPage="02_NormalErrorPage.jsp" %>
<%
	EmpDAO dao = EmpDAO.getInstance();
	List<EmpVO> list = dao.selectAll();
		
%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align='center'>
<table border='2' cellSpacing='3'>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>월급</td>
    <td>부서번호</td></tr>

	<!-- (6) 결과출력 -->
	<!-- 향상된 for문 = 자바만 -->
	<% for(EmpVO vo : list) { %>
	  <tr>
		<td><%= vo.getEmpno() %></td>
		<td><%= vo.getEname() %></td>
		<td><%= vo.getJob() %></td>
		<td><%= vo.getSal() %></td>
		<td><%= vo.getDeptno() %></td>
	  </tr>
	  <%} // end of for %>


</table>
</div>
</body>
</html>
