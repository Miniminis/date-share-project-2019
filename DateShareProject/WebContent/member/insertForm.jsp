<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(document).ready(function () {
		$('#u_id').focusout(function() {
        		
        		$('#idchkMsg').html("");
        		
        		$.ajax({
                    url: 'idCheck.jsp',
                    type: 'GET',
                    data: {
                        u_id: $('#u_id').val()
                    },
                    success: function (data) {
                    	if(data=='Y') {
                    		$('#idchkMsg').html('사용가능한 아이디입니다.');
                    		$('#idchkMsg').css('color','green');
                    	}else if(data== 'N') {
                    		$('#idchkMsg').html('사용할수없는 아이디입니다.');
                    		$('#idchkMsg').css('color','red');
                    	}else {
                    		$('#idchkMsg').html('필수사항입니다.');
                    		$('#idchkMsg').css('color','red');
                    	}
                    }
                });
        	});
		
		$('#insertForm').submit(function() {
			$.ajax({
                url: 'insertMember.jsp',
                type: 'GET',
                data: {
                    u_id: $('#u_id').val(),
                    u_pw: $('#u_pw').val(),
                    u_name: $('#u_name').val(),
                    u_bday: $('#u_bday').val(),
                    name: $('input[name=u_gender]').val()
                },
                success: function (data) {
                		alert("회원가입되었습니다.\n로그인해주세요.");
                		//location.replace("../index.jsp");
                		history.go(-1);
                }
                
            });
			
		});
		
		
		//비밀번호
		$('#u_pw').focusout(function() {
			
            var pwCheck = /(?=.{4,12})(?=.*[0-9])(?=.*[a-z])/;
            
            
            if ($(this).val().length < 1) {
                $('#pwMsg').html('필수 사항입니다.').css('color', 'red');
            } else if (pwCheck.test($(this).val())) {
                $('#pwMsg').html('사용가능한 비밀번호입니다.').css('color', 'green');
            } else {
                $('#pwMsg').html('4~12자 영문 소문자, 숫자를 사용하세요').css('color', 'red');
            }
        });
		
		//비밀번호 재확인
		 $('#u_rpw').focusout(function() {
			 
	            if ($(this).val().length < 1) {
	               
	            	$('#rpwMsg').html('필수 사항입니다.').css('color', 'red');
	            } else if ($(this).val() == $('#u_pw').val()) {
	            
	                $('#rpwMsg').html('비밀번호가 일치합니다.').css('color', 'green');
	            } else {
	                $('#rpwMsg').html('비밀번호가 일치하지 않습니다.').css('color', 'red');
	            }
		 });
		
		
		
		//이름
		  $('#u_name').focusout(function() {
		 if ($(this).val().length < 1) {
             $('#nameMsg').html('필수 사항입니다.').css('color', 'red');
         } else {
        	 $('#nameMsg').html('입력되었습니다.').css('color', 'green');
         }
     	}); 
		
		
});
    </script>
</head>
<body>
	<div id="wrap">
		<div id="main_wrap">
			<div id="header">
				<%@include file="../frame/header.jsp"%>
			</div>
			<div id="content">
				<div id="login_form_wrap">
					<h1>회원가입</h1>
					<form id="insertForm" action="insertMember.jsp" method="post">
						<div>
							ID<input class="input_t" id="u_id" type="text" name="u_id" required>
							<h5 id="idchkMsg"></h5>
						</div>
						<div>
							PW<input class="input_t" id="u_pw" type="password" name="u_pw">
							<h5 id="pwMsg"></h5>
						</div>
						<div>
							RPW<input class="input_t" id="u_rpw" type="password" name="u_rpw">
							<h5 id="rpwMsg"></h5>
						</div>
						<div>
							이름<input class="input_t"  id="u_name" type="text" name="u_name" required>
							<h5 id="nameMsg"></h5>
						</div>
						<div>
							생년월일<input class="input_t" type="date" name="u_bday" required>
							<h5 id="bdayMsg"></h5>
						</div>
						<div>
							성별 <br>
							<span class="input_r"><input type="radio" id="u_gender" name=u_gender value="M">남자</span>
							 <span class="input_r"><input type="radio" id="u_gender" name=u_gender value="F">여자</span>
						</div>
						<div>
							<input class="input_b" type="submit" value="회원가입"> <a
								href="../index.jsp" class="input_ba">이전으로</a>
						</div>
					</form>
				</div>
			</div>
			<div id="footer">
				<%@include file="../frame/footer.jsp"%>
			</div>
		</div>
	</div>
</body>
</html>