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
	    	
			/*******
				json 구조로 통신을 하려면 관련 라이브러리 필요
				datatype : 'json'
			*/
			
			$.ajax({
				type     : "post",
				data     : {cate : "book", name : "hong"},			// 서버로 보내는 데이터
				url      : "04_server.jsp",
				dataType : 'text', 			// 서버에서 받은 데이터의 타입
				success  : function(result){
					var obj = {};
					obj = eval("(" + result + ")");
					// 추후에는 'json'으로 받으셔서 바로 사용 가능
					
					$("#cate").val( obj.first );
					/* console.log(result); */
				},
			});
	    	
	    	
	    });
	</script>
</head>

<body>
서버로부터 넘겨받은 데이터<br/>
첫번째 데이터 : <input type="text" name="" id="cate"/><br/>
두번째 데이터 : <input type="text" name="" id="name"/><br/>
</body>
</html>


