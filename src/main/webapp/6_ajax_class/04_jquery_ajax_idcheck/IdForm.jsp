<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
	
$(function(){
// $('.userinput').keyup(function(){ // 요즘은 사용 안 함 (통신 낭비 큼)
	$('#id_check').click(function(){
		$.ajax({
			url		: 'IdCheck.jsp',
			data	: { id : $('.userinput').val() },
			success : function(data){
				//alert('<'+data+'>')
				if(data.trim() == 'YES'){ // trim(): 공백 제거 함수
					$('#idmessage').text('이미 존재하는 ID입니다.');
					$('#idmessage').show();
				}else if(data.trim() == 'NO'){
					$('#idmessage').text('사용 가능한 ID입니다.');
					$('#idmessage').show();
				} // end of else if
			} // end of function(data) 
		}); // end of ajax
	}); // end of click function()
}) // end of function()
</script>

</head>
<body>

<input name="id" type=SCOTT"text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>