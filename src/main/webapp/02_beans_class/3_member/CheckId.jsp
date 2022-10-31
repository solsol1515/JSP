<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.beans.MemberDao" %>     
    
 <%
 	// 회원가입한 아이디값 받아오기
 	String userId = request.getParameter("userId");
 	MemberDao dao = MemberDao.getInstance();
 	boolean result = dao.isDuplicatedId(userId); // true or false
 %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 아이디 중복 확인 </title>
</head>
<body>
<%
	if(result) {
%>
		사용 중인 아이디입니다. 다시 입력하여 주십시오.
		
<%  }else { %>

		사용할 수 있는 아이디입니다.
		
<%  } %>
</body>
</html>