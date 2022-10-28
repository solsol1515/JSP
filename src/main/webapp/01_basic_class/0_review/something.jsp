<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.dao.*" %>
    
<%
	// 0. 한글 처리
	request.setCharacterEncoding("utf-8");
	
	// 1. 이전 폼의 입력 값 얻어오기
	
	String realname = request.getParameter("realname");
	String nickname = request.getParameter("nickname");
	String myemail  = request.getParameter("myemail");
	String myage 	= request.getParameter("myage");

	// 2. VO 객체에 저장하기 
	MemberVO vo = new MemberVO();
	vo.setRealname(realname);
	vo.setNickname(nickname);
	vo.setMyemail(myemail);
	vo.setMyage(myage);

	// 3. DB에 입력하기 
	MemberDAO dao = MemberDAO.getInstance();
	dao.insert(vo);

	// 4. 출력하기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


이름:	  <%= realname %>
닉네임: <%= nickname %>
이메일: <%= myemail %>    
나이 : <%= myage %>
</body>
</html>