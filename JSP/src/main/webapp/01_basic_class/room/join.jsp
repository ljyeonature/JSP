<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="apply.*" %>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>회원 가입</title>
<%
	

%>
<!-- 외부 CSS 연결 -->
<!-- <link href='../2_form/09_myform.css' rel='stylesheet' /> -->
<!-- <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
 -->
<script src="./jquery-2.0.1.min.js"></script>
<script src="./jquery.validate.min.js"></script>
<script src="./jquery.validate.js" type="text/javascript" charset="utf-8"></script>
<script>
	$(function(){
		
		
		$.validator.addMethod("regex", function(value, element, regex){
			  var regExp = new RegExp(regex);
			  return regExp.test(value);
			});
		
		 $('#joinForm').validate({
		        rules : {
		            id : {required:true, minlength : 5, maxlength : 10, regex:/^[a-zA-Z0-9]{5,10}$/},
		            pass : {minlength : 4, regex:/^[a-zA-Z0-9]{4,}$/},
		            cofpass : {minlength: 4,  equalTo : '#pass', regex:/^[a-zA-Z0-9]{4,}$/},
		            name : {required : true, regex:/^[ㄱ-ㅎ가-힣]+$/},
		            tel : {required:true, maxlength: 11, digits:true},
		            addr : {required:true, maxlength: 20}
		        },

		        messages : {
		        	id : {
		        		required: "필수 입력 사항입니다.",
		        		regex : "영어와 숫자로만 입력하세요.",
		        		minlength: '최소 {0}글자 이상 입력하세요.',
		        		maxlength: '최대 {0}글자 이하 입력하세요.'
		        	},
		        	pass : {
		        		required: "필수 입력 사항입니다.",
		        		minlength: '최소 {0}글자 이상 입력하세요.',
		        		regex : "영어와 숫자로만 입력하세요."
		        	},
		        	cofpass : {
		        		required: "필수 입력 사항입니다.",
		        		minlength: '최소 {0}글자 이상 입력하세요.',
		        		equalTo : "동일한 비밀번호를 입력해주세요.",
		        		regex : "영어와 숫자로만 입력하세요."
		        	},
		        	name : {
		        		required: "필수 입력 사항입니다.",
		        		regex : "한글로만 입력하세요."
		        	},
		        	tel : {
		        		required: "필수 입력 사항입니다.",
		        		digits : "숫자로만 입력해주세요",
		        		maxlength: '최대 {0}글자 이하 입력하세요.'
		        	},
		        	addr : {
		        		required: "필수 입력 사항입니다.",
		        		maxlength: '최대 {0}글자 이하 입력하세요.'
		        	}
		        },
		        success : function(label){
		            label.addClass('valid');
		            label.text(' ok');
		        }
		});
		 
		  $('#checkID').click(function(event) {
			  event.preventDefault();
		      /* window.open("valid.jsp?userId="+id,"","width=200, height=150"); */
		      $.ajax({
		    	  type : 'get',
		    	  data : {id : $('#id').val()},
		    	  url : 'valid.jsp',
		    	  dataType:'text',
		    	  success : function(result){
		    		  if(result.trim() == "YES") {
		    			  $("#result").text('이미 사용중인 아이디입니다');
						} else {
							$("#result").text('사용 가능한 아이디입니다');
							
						}
		    	  }
  
		      });
		   
		    }); 
		 
		 $("#del").click(function(event){
			 event.preventDefault();
			 $("#id").val("");
			  $("#pass").val("");
			  $("#cofpass").val("");
			  $("#name").val("");
			  $("#tel").val("");
			  $("#addr").val("");
	
		 });
		 
	});

</script>
</head>

<body>
<form action="joinService.jsp" method="post" id='joinForm'>
		
			<h1>회원가입서 작성하기</h1>
			<ul>
				<li>
					<label for="id">아이디</label> 
					<input id="id" name="id" type="text" required>
					<button id='checkID'>중복확인</button>
					<div id="result"></div>
				</li>
				<li><label for="pass">비밀번호</label> 
					<input id="pass" name="pass" type="password" required>
				</li>
				<li>
					<label for="cofpass">비밀번호 확인</label> 
					<input id="cofpass" name="cofpass" type="password" required>
				</li>
				<li>
					<label for="name">이름</label> 
					<input id="name" name="name" type="text" required>
				</li>
				<li>
					<label for="tel">전화번호</label> 
					<input id="tel" name="tel" type="tel" required>
				</li>
				<li>
					<label for="addr">주소</label> 
					<input id="addr" name="addr" type="text" required>
				</li>
			</ul>
		
			<button type="submit">회원가입</button>
			<button id="del">취소</button>
	</form>
</body>
</html>
