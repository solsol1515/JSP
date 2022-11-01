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
		let param = {
				name : $('#name').val(), // id="name"인 태그의 값 가져오기
				age	 : $('#age').val(), // id="age"인 태그의 값 가져오기
				tel	 : $('#tel').val(), // id="tel"인 태그의 값 가져오기
				addr : $('#addr').val() // id="addr"인 태그의 값 가져오기
				} // 가져온 값들을 param에 담음
		
		// alert(param);
		$.ajax({
			url 	 : 'DataInput.jsp', // 여기로 이동
			data	 : param, 
			success	 : function(data){ // 성공 시, 
// 				alert('<'+ data +'>');
				if(data.trim() == '1'){ // data의 공백을 제거한 값이 1일 경우(참)
					// alert('입력 성공');
					// 화면 입력 값을 초기화
					$('#name').val(''); // 빈 텍스트로 저장
					$('#age').val(''); // 빈 텍스트로 저장
					$('#tel').val(''); // 빈 텍스트로 저장
					$('#addr').val(''); // 빈 텍스트로 저장
				}else{
					alert('입력 실패');
				} // end of else
			} // end of function(success)
		}); // end of ajax
	}); // end of function (click)
	
	// 2) 가져오기 버튼이 눌렸을 때
	$('#btnSelect').click(function(){
		$.ajax({
			url			: 'DataSelect.jsp',
			dataType	: 'xml',
			success		: selectResult
		}) // end of ajax	
	}) // end of function(click)
	
	function selectResult(data){
		// alert(data); * 중간에 연결이 잘 됐는지 확인하기 *
		// console.lob(data);
		let person = $(data).find('person');
		// alert(person.length);
		
		$('#tbd').empty(); // 내용 지우기
		
		person.each(function(){
			let name = $(this).find('name').text();
			let age = $(this).find('age').text();
			let tel = $(this).find('tel').text();
			let addr = $(this).find('addr').text();
			
			$('#tbd').append('<tr>'
						   + '<td>' + name + '</td>'
						   + '<td>' + age  + '</td>'
						   + '<td>' + tel  + '</td>'
						   + '<td>' + addr + '</td>'
						   + '</tr>')
		}) // end of function(each)
	} // end of selectResult()
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