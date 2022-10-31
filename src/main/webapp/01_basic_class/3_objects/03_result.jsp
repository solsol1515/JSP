<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_result.jsp</title>
</head>
<body>

<!-- 이전 화면에서 사용자 입력값 얻어와서 
		-request.getParameter("")
		-request.getParameterValues("")
	화면 출력 -->
	
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name"); // 이름
	String[] pet = request.getParameterValues("pet"); // 좋아하는 동물
	
	String love_pet = "";
		for(int i=0; pet!=null && i<pet.length; i++){ 
			love_pet += pet[i] + "  "; 
		}
%>    

이름: <%= name%><br/>
좋아하는 동물: <%= love_pet %>	

</body>
</html>