<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 요청해서 가져온 messageId를 mId에 저장(식별하기위한 값 지정???)
	String mId = request.getParameter("messageId"); // 메시지 번호 가져와서 mId로 저장
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 삭제 </title>
</head>
<body>
	<%= mId %>번 메시지를 삭제하려면 암호를 입력하세요. <br/><br/>
	<form action="deleteConfirm.jsp" method="post">
		<!-- 내부적으로만 보이게 하기위해서 type을 hidden으로 사용 (코드는 보이지 않음) 
			 유지보수 시 계속 수정하지 않을 수 있도록 입력받은 값 자동으로 value값으로 주기 -->
		<input type='hidden' name='messageId' value='<%= mId %>'/>
		암호 : <input type="password" name="password"/>
		<input type="submit" value="메시지 삭제"/>
	</form>
</body>
</html>