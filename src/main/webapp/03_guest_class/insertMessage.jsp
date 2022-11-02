<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.js"></script>
<script type="text/javascript">

	$(function(){
		$('#submintBtn').click(function(){
			// 유효성 검사
			let name = $('input[name="guestName"]').val();
			let pw = $('input[name="password"]').val();
			let mg = $('textarea[name="message"]').val();
			
			function checkLogin(){
				
				if(name==''||name==null){
					alert('이름을 입력해주세요.');
					//$('input[name="guestName"]').focus(); // 이름 input으로 포커스 이동
				
				}else if(pw==''||pw==null){
					alert('비밀번호를 입력해주세요.');
				
				}else if(mg==''||mg==null){
					alert('메시지를 입력해주세요.');
				
				}else{ 
				} // end of else
			} // end of checkLogin()
			
			$('form[name="frm"]').submit(); // form의 name이 frm 속성값을 가지는 태그 값을 submit 
		}) // end of click
		
	}); // end of function

</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" required/><br/><br/>
		암호 : <input type="password" name="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input id='submintBtn' type="button" value="메세지 남기기" >
	</form>
	
</body>
</html>