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
	$('#submitBtn').click(function(){
		//유효성 검사 : 입력하지도 않고 누를 경우에는 거부
		if( $('input[name="guestName"]').val()==""){			//이름을 입력하지 않았을 경우
			alert("이름을 입력하세요");
			$('input[name="guestName"]').focus();							// 이름 input으로 포커스 이동
			
		} else if ($('input[name="password"]').val()==""){	// 비밀번호를 입력하지 않았을 경우
			alert("비밀번호를 입력하세요");
			$('input[name="password"]').focus();							// 비밀번호 input으로 포커스 이동
			
		} else if ($('textarea').val()==""){							// 메세지 내용을 입력하지 않았을 경우
			alert("메세지를 입력하세요");
			$('textarea').focus();													// 메세지 textarea로 포커스 이동
		} else {
			$('form[name="frm"]').submit();
		}
	})
	
})
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