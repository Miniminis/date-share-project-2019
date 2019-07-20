<%@page import="dateShare.service.message.WriteMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="message" class="dateShare.Model.Message" />
<jsp:setProperty property="*" name="message" />
<%	
	WriteMessageService mService = WriteMessageService.getInstance();
	int cnt = mService.write(message, message.getU_num());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DATE SHARE : MESSAGE</title>
<link href="../css/index.css" rel="stylesheet" type="text/css">
<link href="../css/content.css" rel="stylesheet" type="text/css">
<style>
</style>
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
           <div id="content_title">
               <h2>MESSAGE SEND</h2>
           </div>
           <span id="send_m"><%= message.getM_to()%>님 에게 <%= cnt > 0 ? cnt + "개의 메세지를 보냈습니다." : "메세지 전송에 실패하였습니다." %></span>
           <a class="m_btn" href="messageList.jsp">MESSAGE LIST</a><a class="m_btn" href="messageSend.jsp">MESSAGE SEND</a>
        </div>
        <div id="footer">
            <%@include file="../frame/footer.jsp" %>
        </div>
    </div>
</div>
</body>
</html>