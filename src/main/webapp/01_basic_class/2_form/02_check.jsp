<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% // 1. 이전 화면에서 사용자 입력 값 얻어오기
 	// request.getParameter("값"); : 값이 하나일 때
 	// request.getParameterValues("값"); : 값이 여러개일 때
 	
 		String name = request.getParameter("name"); // 이름 값
 		String gender  = request.getParameter("gender"); // 성별 값
 		String job  = request.getParameter("occupation"); // 직업 값
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 2. 얻어온 입력 값 화면에 출력하기 -->
이름: <%= name%><br/>
성별: <%= gender %><br/>
직업: <%= job %><br/>
<% 	String[] hob = request.getParameterValues("hobby"); // 취미 값
 		
 		if(hob!=null){ // 취미를 선택하지 않을 경우 오류가 뜨기때문에 null값이 아닐 경우에만 반복문 실행
 		%> 취미:		
 			<% for(int i=0; i<hob.length; i++){
 %>		 <%= hob[i] + "  "%>
 <% 		}
 		}
 %>

</body>
</html>