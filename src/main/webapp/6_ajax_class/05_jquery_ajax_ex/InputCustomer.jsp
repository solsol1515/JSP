<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 고객관리 프로그램 </title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.js">
</script>
<script type="text/javascript">
$(function(){
	
	// 1) 입력 버튼이 눌렸을 때
	$('#btnInsert').click(function(){
		// 원래 통신
		/* $('form').attr('action', 'DataInput.jsp');
		$('form').submit(); // 입력버튼 타입이 submit이 아니라 수동으로 보내주기 */
		
		// AJAX 통신
		//  (1) 사용자 입력값을 객체 형식으로 저장 
		// 		→ 추후에 폼 객체 serialize() 참고  
		var param = {
				name : $('#name').val(),
				age	 : $('#age').val(),
				tel	 : $('#tel').val(),
				addr : $('#addr').val()
				}
		// alert(param);
		$.ajax({
			url 	 : 'DataInput.jsp',
			data	 : param,
			success	 : function(data){
// 				alert('<'+ data +'>');
				if(data.trim() == '1'){
					alert('입력 성공');
					// 화면 입력 값을 초기화
					$('#name').val('');
					$('#age').val('');
					$('#tel').val('');
					$('#addr').val('');
				}else{
					alert('입력 실패');
				}
			}
		});
	});
	
	// 2) 가져오기 버튼이 눌렸을 때
	$('#btnSelect').click(function(){
		// 원래 통신
		
	});
	
})
</script>
</head>


<!-- <body> -->
<body>

<h2> 고객정보 입력 </h2>

<form name="inForm" method="post">
<table border = 1>
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tr>
		<td align="center"><input type="text" size="8" name="name" id="name"></td>
		<td align="center"><input type="text" size="4" name="age" id="age"></td>
		<td align="center"><input type="text" size="12" name="tel" id="tel"></td>
		<td align="center"><input type="text" size="30" name="addr" id="addr"></td>
	</tr>
	<tr>
		<td colspan="4" align="center"> 
			<input type="button" id='btnInsert' value="입력">
		</td>
	</tr>
</table>

<br>
<hr>

<h2> 고객정보 목록보기  </h2>
<table border='0' width="510"> 
	<tr>
		<td align="right"><input type="button"  id='btnSelect' value="가져오기"></td>
	</tr>
</table>
<table border = 1 id="listTable">
	<tr>
		<td width="80" align="center">Name</td>
		<td width="50" align="center">Age</td>
		<td width="100" align="center">Tel</td>	
		<td width="250" align="center">Addr</td>
	</tr>
	<tbody id='tbd'></tbody>
</table>
<div id="myDiv"> </div>

</form>
</body>
</html>