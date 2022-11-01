<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="scott";
String pass="tiger";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";

String rtn_xml=""; // 선언해주기

	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from ajax_temp";
	
	PreparedStatement ps = connection.prepareStatement(sql);
	
	ResultSet rs = ps.executeQuery(); // select 구문 사용	
	
	rtn_xml += "<customer>"; 

	while (rs.next()){
		rtn_xml += "<person>";
		rtn_xml += "<name>" + rs.getString("name") + " </name>"; // 태그 안에 가져온 name 값 누적
		rtn_xml += "<age>" + rs.getString("age") +  "</age>"; // 태그 안에 가져온 age 값 누적
		rtn_xml += "<tel>" + rs.getString("tel") +  "</tel>"; // 태그 안에 가져온 tel 값 누적
		rtn_xml += "<addr>" + rs.getString("addr") +  "</addr>"; // 태그 안에 가져온 addr 값 누적
		rtn_xml += "</person>";		
	}	
	rtn_xml += "</customer>";
	rs.close();
	ps.close();
	connection.close();

	System.out.println(rtn_xml);
	
	out.write(rtn_xml);

%>