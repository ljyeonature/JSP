<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="info.beans.InfoBean" %>

<% request.setCharacterEncoding("utf-8"); %>
<!-- 액션태그 빈즈 -->
<jsp:useBean id="bean" class="info.beans.InfoBean" >
<!-- setName / setId -->
	<jsp:setProperty name='bean' property='*' />
<%-- 	<jsp:setProperty name='bean' property='id' /> --%>

</jsp:useBean>
<%-- <%
	InfoBean bean = new InfoBean();
String n = request.getParameter("name");
String i = request.getParameter("name");
bean.setName(n);
bean.setName(i);
%> --%>

<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름  : <%= bean.getName() %><br/>
	주민번호 :  <%= bean.getId() %><br/>
	주민번호 :  <jsp:getProperty property="id" name="bean" /><br/>
	성  별   : <%= bean.getGender() %><br/>  
	맞습니까????
</body>
</html>