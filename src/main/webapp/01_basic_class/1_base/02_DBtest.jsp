<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ page errorPage="02_NormalErrorPage.jsp" %>

<%
	// 1. 드라이버 로딩 > ojdbc6.jar
	 Class.forName("oracle.jdbc.driver.OracleDriver");
      System.out.println("드라이버로딩 성공");
	
	// 2. 연결객체 얻어오기
	String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user = "scott";
	String pass = "tiger";
	
	Connection con = DriverManager.getConnection(url, user, pass);
	System.out.println("연결성공");
	
	// 3. sql 문장 만들기
	String sql = "SELECT * FROM emp2";

	// 4. 전송 객체 얻어오기
	PreparedStatement ps = con.prepareStatement(sql);
	
	// 5. 전송
	ResultSet rs = ps.executeQuery();
	
%>


<!DOCTYPE html>
<html><head><title> 디비 테스트 </title>
</head>
<body>
 
<div align=center>
<table border=2 cellSpacing=3>

  <tr class="title">
    <td>사번</td>
    <td>사원명</td>
    <td>업무</td>
    <td>관리자사번</td>
    <td>입사일</td></tr>

	<!-- (6) 결과출력 -->
	<% while(rs.next()){%>
	  <tr>
		<td><%= rs.getInt("EMPNO") %></td>
		<td><%= rs.getString("ENAME") %></td>
		<td><%= rs.getString("JOB") %></td>
		<td><%= rs.getInt("MGR") %></td>
		<td><%= rs.getString("HIREDATE") %></td>
	  </tr>
	<% } // end of while%>

</table>
</div>
</body>
</html>
