<%@page import="dateShare.service.movie.EditArticleService"%>
<%@page import="dateShare.Model.Movie"%>
<%@page import="dateShare.service.movie.GetArticleListService"%>
<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.movie.ArticleNotFoundException"%>
<%@page import="dateShare.service.movie.DeleteArticleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	//세션에서 현재 로그인한 회원정보 받아오기
	session = request.getSession(false);
	LoginInfo curuser = (LoginInfo) session.getAttribute("userInfo");
	
	//수정하고자 하는 게시물 번호 받기 
	int artnum = 0;
	String mNumStr = request.getParameter("m_num");
	
	if(mNumStr != null) {
		artnum = Integer.parseInt(mNumStr);
	}
	
	// 수정권한 확인 결과를 담을 변수 정의 
	int editAut = 0; 

	EditArticleService service = EditArticleService.getInstance();
	editAut = service.editAuthorityChk(artnum, curuser.getU_num());
			
	out.print(editAut);	
%>