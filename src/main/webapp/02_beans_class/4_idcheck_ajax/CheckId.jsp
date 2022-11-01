<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="member.beans.MemberDao" %>     
    
 <%
 	// 회원가입한 아이디값 받아오기
 	String userId = request.getParameter("id");
 	MemberDao dao = MemberDao.getInstance();
 	boolean result = dao.isDuplicatedId(userId); // true or false
 	
 	//out.write(result+""); boolean형에서 바로 나올 수 없어서 "" 사용했음
 	out.print(result);
 %> 
