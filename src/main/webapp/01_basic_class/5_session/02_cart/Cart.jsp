<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="shop.cart.Goods" %> 
<%
	// 1. 필요한 변수 선언해주기
	String id=""; 	
	String name ="";
	int price=0;
 
	ArrayList<Goods> glist = null; // 선언해주기

	request.setCharacterEncoding("utf-8"); // 한글 깨지지 않도록 인코딩해주기
	
	// 1. Form의 값(hidden값) 넘겨받기 ( id, name, price )
	id 	  = request.getParameter("id"); // 
	name  = request.getParameter("name");
	price = Integer.parseInt(request.getParameter("price")); // 형변환(String > int)	
	
	// 2. 세션에 cart 속성을 얻어온다. 
	Object obj = session.getAttribute("cart"); 
	
	// 3. 만일 null이면 ArrayList 객체 새로 생성하고 그렇지 않으면 ArrayList 변수(glist)에 지정
	if(obj==null){ // 카트에 담은 물건이 없을 경우
    	glist = new ArrayList <Goods>(); // glist에 새로운 ArrayList 생성하기
  	}else {	// 카트에 담은 물건이 있을 경우
      	glist = (ArrayList<Goods>)obj; // 형 변환 (object > ArrayList)
   	}
	
	// 4. 1번의 값들을 Goods 객체로 생성후 ArrayList에 추가
	glist.add(new Goods(id, name, price)); // glist에 Goods에서 받은 id, name, price의 값을 추가
	
	// 5. 세션에 cart라는 이름에 ArrayList를 저장
	session.setAttribute("cart", glist);
	
%>		 
		 
<html> 
<body bgcolor=white>
<%= name %> 을 구입하셨습니다.
 
<br><br><br>

<table>
<tr bgcolor="#e7a068"><th>상품명</th>
<th>가격</th></tr>

<%
		int n = glist.size(); 
		int sum = 0; 
		for(int i=0; i<n; i++) { 
			Goods goods = (Goods) glist.get(i); // 형변환?
			int gp = goods.getPrice(); // 물건의 가격을 gp에 저장
			sum += gp; // 담은 물건 가격 합산하기
%>
			<tr><td align="center"> <%= goods.getName() %> </td>
				<td align="right"> <%= gp %> </td></tr>
<%
		} 		 
%>

<tr bgcolor="#e7a068"><td colspan="2" align="right"> 총액 : <%= sum  %></td></tr>
</table>

<br/><br/>
[<a href="wshop.jsp">쇼핑하러 가기</a>]
[<a href="Buy.jsp">구입하기</a>]

</body></html>

