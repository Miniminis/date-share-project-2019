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
            
		<h3>회원탈퇴 페이지</h3>
		<form action="deleteMember.jsp" method="post">
		<div>
			아이디<input class="input_t" type="text" name="u_id" value="<%=user.getU_id() %>" readonly>
		</div>
		<div>
			비밀번호<input class="input_t" type="password" name="u_pw">
		</div>
		<div>
			<input type="submit" value="회원탈퇴" class="input_ba">
		</div>
		<div>
			<input type="button" value="취소" class="input_ba" onclick="location.href='../main.jsp'">
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
