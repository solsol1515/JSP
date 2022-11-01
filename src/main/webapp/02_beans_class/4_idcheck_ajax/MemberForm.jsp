<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="member.beans.MemberDao" %>     
    
 <% // 회원가입한 아이디값 받아오기
 	String userId = request.getParameter("userId");
 	MemberDao dao = MemberDao.getInstance();
 	boolean result = dao.isDuplicatedId(userId); // true or false
 %> 
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 회원가입  </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.js"></script>
<script type="text/javascript">

	$(function(){
		$('input[name="id"]').next().click(function(){
			
			let userId = $('input[name="id"]').val(); // id에 입력되는 값
			
			$.ajax({
				url		: 'CheckId.jsp',
				type	: 'post',
				data	: { id : userId },
				success	: function(data){
					if(data.trim()=='true'){
						$('div#result').html('사용 중인 아이디입니다.');
						$('div#result').show();
					}else{
						$('div#result').html('사용 가능한 아이디입니다.');
						$('div#result').show();
					}
				}
				
			})
		})
	})
	
</script>
</head>
<body>

<h1>회원가입서 작성하기</h1>
 
	<form action="InsertMember.jsp" method="post" name="frm">
		<table>
			<tr>
				<td width="100">
				<font color="blue">아이디</font>
				</td>
				<td width="100">
				<input type="text" name="id">
				<input type="button" value="중복확인"><br/>
				<div id='result'></div>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호</font>
				</td>
				<td width="100">
				<input type="password" name="password"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">비밀번호학인</font>
				</td>
				<td width="100">
				<input type="password" name="repassword"/><br/>
				</td>
			</tr>
			<tr> 
				<td width="100">
				<font color="blue">이름</font>
				</td>
				<td width="100">
				<input type="text" name="name"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">전화번호</font>
				</td>
				<td>
				<input type="text" size="15" name="tel"/>
				<br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				<font color="blue">주소</font>
				</td>
				<td>
				<input type="text" size="50" name="addr"/><br/>
				</td>
			</tr>
			<tr>
				<td width="100">
				 <!--로그인 버튼-->
				 <input type="submit" value="회원가입">
				</td>
				<td width="100">
				<input type="reset" name="cancel" value="취소"><br/>
				</td>
			</tr>
		</table>
	</form>



 </body>
</html>
    