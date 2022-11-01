$(document).ready(function(){
	
	$("#container").addClass("start");

	$("nav li").click(function(){
		$("#container").css("max-width", "100%")
		
		var id=$(this).attr("data-rol");    
		$("nav li").removeClass("on");    
		$(this).addClass("on");    
		$(".content").removeClass("prev this next");     
		//클릭 시 가지고 있던 클래스를 모두 지운다 
		
		$("#" + id).addClass("this").prevAll().addClass("prev");    
		//클릭한 메뉴와 매칭 되는 id에 this 클래스를 지정하고 그 앞의 모든 <section> 태그는 .prev클래스를 지정한다    
		$("#" + id).nextAll().addClass("next");    
		//클릭한 메뉴와 매칭 되는 id의 뒤에 오는 <section> 태그는 .next 클래스를 지정한다     
	});

	
	//********************************************************
	//ajax 사용하기
	$(".book_roll li").click(function(){
		
		// (1) 이벤트 발생한 li 요소에서 data-url 값 가져오기(attr: 속성 값 가져오기)
		// ex: attr('name', 'sol') > name에 sol 값 지정(setter 역할)
		let liurl = $(this).attr('data-url') // 내가 선택한 data-url의 값 가져오기
			// alert(liurl);
		
		// (2)  class='notebook' 지정한 article의 요소에 ajax로 파일을 받아서 지정
		$.ajax({
			type	: 'post', // or "get"(보내는 값이 공개되기때문에 비밀번호 같은 보안 필요한 곳에는 post로 숨겨줌)
			dataType: 'html',
			url		: liurl,
			success	: function(data){ // ajax 구동 성공 시, class notebook에 data의 html의 형식으로 주기
				$('.notebook').html	(data);
			}
		});
	});
});

