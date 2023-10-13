<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 방명록 </title>
<script src="./jquery-2.0.1.min.js"></script>
<script src="./jquery.validate.min.js"></script>
<script src="./jquery.validate.js" type="text/javascript" charset="utf-8"></script>
<script>
	$(function(){
		$('form[name="frm"] > input:eq(2)').click(function(){
			// 유효성 검사 먼저
			
			// submit
			$('form[name="frm"]').submit();
			
			
		});
		
		$.validator.addMethod("regex", function(value, element, regex){
			  var regExp = new RegExp(regex);
			  return regExp.test(value);
		}); // end of validator
			
		 $('form[name="frm"]').validate({
	        rules : {
	        	guestName : {required:true,minlength : 3, regex:/^[a-zA-Zㄱ-ㅎ가-힣]{3,}$/},
	        	password  : {required:true, minlength : 4, regex:/^[a-zA-Z0-9]{4,}$/},
	            
	        },
	        messages : {
	        	guestName : {
	        		required: "필수 입력 사항입니다.",
	        		regex : "영어 한글만 입력 가능합니다.",
	        		minlength: '최소 {0}글자 이상 입력하세요.'
	        		
	        	},
	        	password : {
	        		required: "필수 입력 사항입니다.",
	        		regex : "영어 숫자 조합으로 입력해주세요",
	        		minlength : "최소 {0}자 이상으로 입력해주세요"
	        	}
	        	
	        },
	        success : function(label){
	            label.addClass('valid');
	            label.text(' ok');
	        }
		}); // end of $('#joinForm').validate
		
		
	}); // end function()


</script>
</head>

<body>

	<form action="saveMessage.jsp" name="frm" method="post">
		이름 : <input type="text" name="guestName" id="guestName" required /><br/><br/>
		암호 : <input type="password" name="password" id="password" required /><br/><br/>
		메세지 : <textarea name="message" rows="3" cols="30" required></textarea><br/><br/>
		<input type="submit" value="메세지 남기기">
	</form>
</body>
</html>