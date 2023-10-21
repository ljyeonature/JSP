<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- uri : url보다 큰 의미 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1_basic.jsp</title>
</head>
<body>
	
<!-- 변수 선언 -->
<c:set var='gender' value='male' />
<c:set var='age'>20</c:set>
<%-- <c:set var='age' value='25' />--%>

<!-- 제어문 -->
<!-- if -->
<!-- eq == -->
<c:if test="${ gender eq 'male' }">
	당신은 남정네입니다.
</c:if><br />
<c:if test="${ gender eq 'female' }">
	당신은 여인네입니다.
</c:if><br />
<!-- ge >= -->
<c:if test="${ age ge 20 }">
	당신은 성인입니다.
</c:if><br />	
<!-- choose -->
<!-- 10미만 어린이 / 10이상 20미만 청소년 / 그렇지않으면 성인 -->
<c:choose>
	<c:when test="${age lt 10 }">당신은 어린이</c:when>
	<c:when test="${age ge 10 and age lt 20}">당신은 청소년</c:when>
	<c:otherwise>당신은 성인</c:otherwise>
</c:choose><br />

<c:set var="sum" value="0" />
<c:forEach var="i" begin="1" end="100">
	<c:set var="sum" value="${sum + i}" />
</c:forEach>
1~100까지의 합 : ${sum } <br/> 

<!-- 1~100까지의 홀수의 합과 짝수의 합 -->
<c:set var="eventotal" value="0" />
<c:set var="oddtotal" value="0" />
${eventotal}<br/> 
${oddtotal}<br/>
<c:forEach var="i" begin="1" end="100">
	<c:if test="${i mod 2 eq 0 }">
		<c:set var="eventotal" value="${eventotal + i}" />
	</c:if>
	<c:if test="${i mod 2 ne 0 }">
		<c:set var="oddtotal" value="${oddtotal + i}" />
	</c:if>
</c:forEach><br/>
1~100까지의 짝수합 : ${eventotal } <br/> 
1~100까지의 홀수합 : ${oddtotal } <br/> 

</body>
</html>