<%@page import="dateShare.service.food.NotMatchUserException"%>
<%@page import="dateShare.service.food.FoodNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dateShare.service.food.DeleteFoodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int f_num = Integer.parseInt(request.getParameter("f_num"));
 	int u_num = Integer.parseInt(request.getParameter("u_num")); 

	// 서비스 객체 생성 
	DeleteFoodService service = DeleteFoodService.getInstance();

	int resultCnt = 0; // 몇개행 되었나 체크하려고
	boolean chk = false; // 오류발생했는지 확인하려고 정상처리 되었나 오류발생했나
	String msg = ""; // 예외발생시 메시지 담아서 처리하고싶음.

	try {
		resultCnt = service.deleteMessage(f_num, u_num);
		chk = true; // 정상처리되었으면
		
	} catch (SQLException e) {
		msg = e.getMessage();
	} catch (FoodNotFoundException e) {
		msg = e.getMessage();
	} catch (NotMatchUserException e) {
		msg = e.getMessage();
	}
%>

<%=chk? "게시글을 삭제하였습니다." : "게시글 삭제 실패"%>