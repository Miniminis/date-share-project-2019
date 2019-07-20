<%@page import="dateShare.service.movie.GetLikeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//0. 최종반환할 좋아요 수 정의 
	int likeCnt = 0;
	//0-0. service 페이지로 넘길 글번호, 회원번호 정의 
	int mNum = 0;
	int uNum = 0;

	//1. movieContentView.jsp 에서 m_num, u_num 넘겨받음 
	String mNumStr = request.getParameter("m_num");
	String uNumStr = request.getParameter("u_num");
	
	//2. number str 타입 int 형으로 변환 후 GetLikeService 호출 및 getLike(m_num, u_num) 실행 
	if(mNumStr == null || uNumStr == null) {
		likeCnt = 0;
	} else {
		mNum = Integer.parseInt(mNumStr);
		uNum = Integer.parseInt(uNumStr);
	}
	
	//3. 실행결과 int likeCnt 로 받음 
	GetLikeService service = GetLikeService.getInstance();
	likeCnt = service.getLike(mNum, uNum);

	out.println(likeCnt);
%>