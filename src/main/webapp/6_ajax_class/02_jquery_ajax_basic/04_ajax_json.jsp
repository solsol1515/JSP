<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
$(function(){

	let param = { cate:'book', name:'hong'};
	
	$.ajax({
		data		: param,
		url			: '04_server.jsp',
		dataType	: 'text', // 현재는 text(기본값)이지만, 추후에는 json
		success		: parseData // 성공할 경우, 함수 불러오기
	});
	
	function parseData(result){
		// *******************************************************
		// 추후에 json 라이브러리를 이용해 json 객체 변환
		
		let obj = {};
		obj = eval( "(" + result + ")" ); // 편법으로 일단 eval 사용함 추후에 json으로 객체 변환
		$('#cate').val(obj.first); // cate를 id로 가지는 곳에 first 값 넣기 
		$('#name').val(obj.second); // name을 id로 가지는 곳에 second 값 넣기
		
	}
	
})	    
</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


