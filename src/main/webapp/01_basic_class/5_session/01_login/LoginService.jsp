<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.beans.MemberDao" %>    
<!DOCTYPE html>
<html>
<head>
<title> 로그인확인 </title>
</head>
<body>
<%
// 	// 실제로는 DB에서 가져와야하는 값(임의로 지정해줌)
// 	String saveUser = "hansol";
// 	String savePass = "1234";
	
	// 이전화면 폼에서 넘겨받는 값(가져오기)
	String user = request.getParameter("User"); // 파라미터 값(User)을 가져와서 user에 저장 
	String pass = request.getParameter("Pass");	// 파라미터 값(Pass)을 가져와서 pass에 저장
	
	// 실제 DB에서 확인
	MemberDao dao = MemberDao.getInstance();
	boolean result = dao.checkLogin(user, pass);
	
	// user, password가 같을 때 로그인 성공, 그렇지 않으면 로그인 실패
	if(result){ // user의 값이 saveUser의 값과 같고, pass의 값이 savePass의 값이 같을 때
		
		// #2. 세션에 이름이 "id"인 변수에 user 값을 저장 (세션은 서버의 메모리 사용)
		session.setAttribute("id", user); // user → id로 저장
		
		// #1. 로그인 성공하면 바로 MainPage.jsp를 요청 (성공 시 로그인된 화면 열어주기)
		response.sendRedirect("MainPage.jsp");
	} else {

		// #1. 로그인에 실패하면 바로 LoginForm.jsp을 요청 (실패 시 로그인 화면으로 되돌아가기)
		response.sendRedirect("LoginForm.jsp");
	}			
%>
	
</body>
</html>