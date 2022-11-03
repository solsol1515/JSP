<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="board_ex.model.*,board_ex.service.*" %>

<%
	request.setCharacterEncoding("utf-8"); // 한글 사용 가능하도록 인코딩
%>
<%// 자바 기능 담아주기 위해서 연결 (usebean: 자바 객체 생성하는 액션 태그)%>
<jsp:useBean id="rec" class="board_ex.model.BoardVO">
	<jsp:setProperty name="rec" property="*"/>
</jsp:useBean>

<%
	WriteArticleService.getInstance().write(rec);
	// BoardSave.jsp에서 새로고침을 하게 되면 중복 입력되기에
	// 추후에 입력 후 BoardView.jsp?id=글번호 로 넘겨서 처리하고자
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판글저장</title>
</head>
<body>
입력되었는지 확인해보시구염...<br/>
만일 안되어도..환장하지 맙시다 !!! ^^<br/>
<a href='BoardList.jsp'> 목록 보기</a>
</body>
</html>