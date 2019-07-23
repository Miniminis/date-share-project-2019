<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String u_id = (String)session.getAttribute("u_id");
%>
    
    
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
function check(){
	
	if(update.u_pw.value != update.u_rpw.value){
		alert('새비밀번호가 일치하지 않습니다\n비밀번호를 다시 확인해주세요.');
		update.u_pw.focus();
		return false;
	}
}
</script>
</head>
<body>

<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@include file="../frame/my.jsp" %>
            <%@include file="../frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@include file="../frame/nav.jsp" %>
        </div>
        
<div id="content">
<div id="login_form_wrap">
        <h1>회원정보 수정</h1>
	<form action=updateMember.jsp method="post" name="update" onsubmit="return check()">

			<div>
				아이디<input class="input_t" type="text" name=u_id value="<%= user.getU_id() %>" readonly>
			</div>
			<div>
				새비밀번호<input class="input_t" id="u_pw" type="password" value="<%=user.getU_pw() %>" name=u_pw>
			</div>
			<div>
				새비밀번호확인<input class="input_t" type="password" value="<%=user.getU_pw() %>" name=u_rpw>
			</div>
			<div>
				이름<input class="input_t" type="text" name=u_name value="<%=user.getU_name() %>">
			</div>
			<div>
				<input type=submit value=등록 class="input_ba">
			</div>	
	</form>    
</div>
</div>
        
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>