<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="board_ex.model.*, board_ex.service.*" %>
<%@ page import="java.util.List" %> 

<%  //웹브라우저가 게시글 목록을 캐싱할 경우 새로운 글이 추가되더라도 새글이 목록에 안 보일 수 있기 때문에 설정
	// 사용자가 어떤 브라우저를 사용할지 모르기때문에 전부 입력해둠
	response.setHeader("Pragma","No-cache");		// HTTP 1.0 version
	response.setHeader("Cache-Control","no-cache");	// HTTP 1.1 version
	response.setHeader("Cache-Control","no-store"); // 일부 파이어폭스 버스 관련
	response.setDateHeader("Expires", 1L);			// 현재 시간 이전으로 만료일을 지정함으로써 응답결과가 캐쉬되지 않도록 설정
%>

<%
	// 누른 페이지 번호 받아오기
	String pNum = request.getParameter("page");
	int pageNo = 1; // 처음 시작 페이지 지정
	
	// 현재 페이지 번호
	if(pNum != null){
		pageNo = Integer.parseInt(pNum);
	}
%>

<%
	// 전체 메세지 레코드 검색

	ListArticleService service = ListArticleService.getInstance(); // service에 저장하기
	List <BoardVO> mList =  service.getArticleList(pNum); // 
 
	int totalPageCount = service.getTotalPage(); // 전체 레코드 수
%>

<HTML>
<head><title> 게시글 목록 </title>
</head>

<BODY>

	<h3> 게시판 목록 </h3>
	
	<table border="1" bordercolor="darkblue">
	<tr>
		<td> 글번호 </td>
		<td> 제 목 </td>
		<td> 작성자 </td>
		<td> 작성일 </td>
		<td> 조회수 </td>
	</tr>
	
	<% if( mList.isEmpty() ) { // mList가 빈 상태일 경우%>
		<tr><td colspan="5"> 등록된 게시물이 없습니다. </td></tr>
	<% } else { %>
	<!--  여기에 목록 출력하기  -->
		<% for(BoardVO vo : mList){ // mList에 저장된 데이터 향상된 for문으로 꺼내주기%>
			<tr>
				<td><%= vo.getSeq() %></td>
				<td><a href='BoardView.jsp?seq=<%= vo.getSeq() %>'><%= vo.getTitle() %></a></td>
				<td><%= vo.getWriter() %></td>
				<td><%= vo.getRegdate() %></td>
				<td><%= vo.getCnt() %></td>
			</tr>
			
		<%} // end of for%>
		
	<% }  %>
		<tr>
			<td colspan="5">
				<a href="BoardInputForm.jsp">글쓰기</a>
			</td>
		</tr>
	</table>
	<hr/>
	
	<!-- 페이지 번호<a> 생성 -->
	<%for(int i=1; i<=totalPageCount; i++){ %>
		<a href='BoardList.jsp?page=<%=i%>'>[<%= i %>]</a>	
	<%} // end of for %>
	
</BODY>
</HTML>
