<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 기초 문법.jsp</title>
</head>
<body>

<!-- 변수 선언 -->
<c:set var='gender' value='female'/>

<c:if test="${gender eq 'female'}">당신은 여성</c:if>
<c:if test="${gender == 'male'}">당신은 남성</c:if>

<c:set var='age'>19</c:set>
<!-- else if 없어서 c:choose + c:when 사용 -->
<c:choose>
	<c:when test="${age lt 10}">어린이입니다</c:when>
	<c:when test="${age ge 10 and age lt 20}">청소년입니다</c:when>
	<c:otherwise>성인입니다</c:otherwise>
</c:choose>
<hr/>

<c:set var='sum' value='0'/>
<c:forEach var='i' begin='1' end='100'>
	<c:set var='sum' value='${sum+i}'/>
</c:forEach>
# 1~100까지의 합: ${sum} <hr/>

<!-- 1부터 100까지의 홀수의 합 / 홀수의 합 -->
<c:forEach var='i' begin='1' end='100'>
	<c:if test="${i mod 2 eq 0}">
		<c:set var='sumOdd' value='${sumOdd+i}'/>
	</c:if>
	<c:if test="${i mod 2 eq 1}">
		<c:set var='sumEven' value='${sumEven+i}'/>
	</c:if>
</c:forEach>
내가 함 <br/>
# 1~100까지 짝수의 합: ${sumOdd}<br/>
# 1~100까지 홀수의 합: ${sumEven}
<hr/>

<c:forEach var='i' begin='1' end='100'>
	<c:choose>
		<c:when test="${i mod 2 eq 0}">
			<c:set var='even' value='${even+i}'/>
		</c:when>
		<c:otherwise>
			<c:set var='odd' value='${odd+i}'/>
		</c:otherwise>
	</c:choose>
</c:forEach>
선생님이 하심 <br/>
1~100까지 짝수의 합: ${even} <br/>
1~100까지 짝수의 합: ${odd} <br/>

</body>
</html>
<!-- * JSP 기초 문법 

	< %@ %> : 설정
		- page
		- include(정적)
		- taglib : JSTL 사용 시 필요
		
	< %! %> : 선언 (변수, 함수)
	< % %>  : 스크립트릿 (자바코드)
	< %= %> : 표현식 (화면 결과 출력) → EL

-->