<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script  type="text/javascript"  src="libs/jquery-1.9.1.min.js"> </script>
	<script>
	
	$(function(){
		
		// 서버로 보낼 데이터
		var param = { cate : "book", name : "hone" };
		
		
		// 비동기통신 (ajax) => 축약형
		/* $.post("02_server.jsp", param, parseData); */
		// 비동기통신 (ajax)
		$.ajax({
			type    : 'post',			// 전송방식(GET/POST) : 보내는 데이터의 양과 관련 / 안 쓰면 default=브라우저마다 다르다. -> 영향이 있어서 타입은 써주는게 좋다.
			data    : param,			// 서버로 보낼 데이터
			url     : '02_server.jsp',	// 서버에 요청 페이지
			success : parseData,		// 성공 시 함수 연결
			error   : function(){		// 실패 시 함수 연결
				alert('error');
			}
		});
		
		function parseData(strText){
			
			// alert( strText );
			
			var aryData = strText.split("|");
						
			for(var i=0;i<aryData.length;i++){
				var param  = aryData[i].split("=");				
				if( param[0].trim() == 'cate'){  // 공백제거를 하지 않으면 처음에 공백에 들어와서 cate를 찾지 못함
					 document.getElementById("cate").value = param[1];
				}
				
				if( param[0].trim() == 'name'){
					document.getElementById("name").value = param[1];
				}
			
				}
			
			};
	
	
	
	
	});
	</script>


</head>


<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


