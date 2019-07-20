<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.movie.ArticleNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dateShare.service.movie.DeleteArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	//세션에서 회원정보 받아오기
	session = request.getSession(false);
	LoginInfo curuser = (LoginInfo) session.getAttribute("userInfo");
	
	//삭제하고자 하는 게시물 번호 받기 
	int artnum = 0;
	String mNumStr = request.getParameter("m_num");
	
	if(mNumStr != null) {
		artnum = Integer.parseInt(mNumStr);
	}
	
	// 삭제 실행 결과를 담을 변수 정의 
	int resultCnt = 0; 
	boolean chk = false; 
	String msg = "";
	
	try {
		DeleteArticleService service = DeleteArticleService.getInstance();
		resultCnt = service.deleteArticle(artnum, curuser.getU_num());
		chk = true;
		out.print(artnum);
	} catch (SQLException e) {
		msg = e.getMessage();
	} catch (ArticleNotFoundException e) {
		msg = e.getMessage();
	} 
	
%>