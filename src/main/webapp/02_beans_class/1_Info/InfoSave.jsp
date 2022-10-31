<%@ page contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>

<%
/* 	InfoBean bean = new InfoBean();// 객체 생성

	String name = request.getParameter("name");
	bean.setName(name);
	
	String id = request.getParameter("id");
	bean.setId(id); */
	
	request.setCharacterEncoding("utf-8"); // 한글 깨지지 않도록 인코딩해주기
%>

<jsp:useBean id="bean" class="info.InfoBean">
	<jsp:setProperty name="bean" property="*"/>
	<!--<jsp:setProperty name="bean" property="id"/>-->
</jsp:useBean>

<!DOCTYPE html>
<html>
<body>
	<h2>  당신의 신상명세서 확인 </h2>
	이   름	: <%= bean.getName() %><br/>
	주민번호	: <%= bean.getId() %><br/>
	성  별	: <%= bean.getGender() %><br/>  
	맞습니까????
</body>
</html>