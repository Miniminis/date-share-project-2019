<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.Model.DateUser"%>
<%@page import="dateShare.Dao.DateUserDao"%>
<%@page import="dateShare.service.user.ReadMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="user" class="dateShare.Model.DateUser"/>
<jsp:setProperty property="*" name="user"/> --%>
<%  session = request.getSession(false);
	LoginInfo user = (LoginInfo)session.getAttribute("userInfo");%>
<%
	ReadMemberService service = ReadMemberService.getInstance();
	DateUser user1 = service.read(user.getU_id());
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
            <%@include file="../frame/header.jsp" %>
        </div>
        <div id="content">
      <div id="login_form_wrap">
               <h1>My Page</h1>
               <form action="insertMember.jsp" method="post">
                   <div>
                     회원번호<input class="input_t"  name="u_num" value="<%= user1.getU_num() %>" readonly>
                  </div>
                  <div>
                     ID<input class="input_t" type="text" name="u_id" value="<%= user1.getU_id() %>" readonly>
                  </div>
                  <div>
                     PW<input class="input_t" type="text" name="u_pw" value="<%= user1.getU_pw() %>" readonly>
                  </div>
                  <div>
                     이름<input class="input_t" type="text" name="u_name" value="<%= user1.getU_name() %>" readonly>
                  </div>
                  <div>
                     생년월일<input class="input_t" type="text" name="u_bday" value="<%=user1.getU_bday()%>" readonly>
                  </div>
                  <div>
                     가입일자<input class="input_t" type="text" name="u_regdate" value="<%=user1.getU_regdate() %>" readonly>
                  </div>
                  <div>
                     성별<input class="input_t" type="text" name="u_gender" value="<%=user1.getU_gender() %>" readonly>
                  </div>
                  <div>
                     <a href="../main.jsp" class="input_ba">이전으로</a>
                  </div>
                  <div>
                  	<input type="button" value="수정" class="input_ba" onclick="location.href='../user/updateForm.jsp'">
                  </div>
                  <div>
                  	<input type="button" value="탈퇴" class="input_ba" onclick="location.href='../user/deleteForm.jsp'"> 
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