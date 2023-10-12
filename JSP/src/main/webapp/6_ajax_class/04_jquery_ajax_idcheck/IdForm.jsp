<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title> 아이디 중복 검사 </title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
$(function(){
	$('#id_check').click(function(){ 
		
		
		//*****
		// ajax의 극적인 효과를 위해 확인함 -> 제발 사용하지 마세요........
		/* $('.userinput').keyup(function(){ */
			
		
		
		$.ajax({
			typa : "get",
			data : {id : $('.userinput').val()},
			url  : 'IdCheck.jsp',
			dataType:'text',
			success : function(data){
				/* alert(data); */
				if( data.trim() == 'YES'){
					$('#idmessage').text('이미 사용중인 아이디입니다');
					$('#idmessage').show();
				} else {
					$('#idmessage').text('사용 가능');
					$('#idmessage').show();
					
				}
				
			},
			error : function(err) {
				console.log(err);
			}
			
		
			
		});
			
		});
		
	/* }) */
	
});

</script>


</head>
<body>

<input name="id" type="text" class="userinput" size="15" />
<button type="button" id="id_check">중복체크</button><br/><br/>
<div id="idmessage" style="display:none;"></div>

</body>
</html>