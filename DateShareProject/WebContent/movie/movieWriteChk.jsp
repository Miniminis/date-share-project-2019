<%@page import="dateShare.Model.Movie"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="dateShare.service.movie.WriteMovieService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <jsp:useBean id="movietext" class="dateShare.Model.Movie" scope="request"/> --%>

<% 
	String mTitle = "";
	String mPath = "";
	int mStar = 0;
	String mContent = "";
	String saveFileName = "";
	String uploadPath = "/images";
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);
	String fileDBPath = "";
	
	//1. enctype 확인 
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if(isMultipart) {
		// 2. 업로드 파일 보관하는 fileitem의 factory 설정 
		DiskFileItemFactory factory = new DiskFileItemFactory();
		//3. 업로드 요청을 처리하는 servletfileupload 생성 
		ServletFileUpload upload = new ServletFileUpload(factory);
		//4. 업로드 요청을 파싱해서 fileitem 목록 구함 
		List<FileItem> files = upload.parseRequest(request);
		
		Iterator<FileItem> itr = files.iterator();
		
		//5. fileitem이 file 형식인지 아닌지에 따라 분기처리 
		while(itr.hasNext()) {
			FileItem file = itr.next();
			
			if(file.isFormField()) {
				//(1) 파일형식이 아닌 경우 
				if(file.getFieldName().equals("m_title")) {
					mTitle = file.getString("utf-8");
				} else if(file.getFieldName().equals("m_star")) {
					mStar = Integer.parseInt(file.getString("utf-8"));					
				} else if(file.getFieldName().equals("m_content")) {
					mContent = file.getString("utf-8");
				}
			} else {
				//(2) 파일형식인 경우 --> 파일 경로 분기처리 : 1. 파일이 있는 경우 2. 파일이 없는 경우
				if(file.getFieldName().equals("m_path")) {
					mPath = file.getName();
					
					saveFileName = System.nanoTime() + "_" + mPath;
					file.write(new File(dir, saveFileName));
					
					fileDBPath = "../images/"+saveFileName;
					
					if(mPath.equals(null) || mPath.equals("")) {
						fileDBPath = "../images/noImg.png";
					}
				} 
			}
		}
		
	}
	
	//세션에서 회원정보 받아오기
	session = request.getSession(false);
	LoginInfo curuser = (LoginInfo) session.getAttribute("userInfo");
		
	Movie movietext = new Movie(curuser.getU_num(), mTitle, mContent, fileDBPath, mStar);
		
%>

<%-- <jsp:setProperty property="*" name="movietext"/> --%>

<%
	
	WriteMovieService service = WriteMovieService.getInstance();
	int resultCnt = service.write(movietext);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DATE SHARE | MOVIE</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="../css/movie.css" rel="stylesheet" type="text/css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
<div id="wrap">
    <div id="main_wrap">
        <div id="header">
        	<%@ include file="../frame/my.jsp" %>
            <%@ include file="../frame/header.jsp" %>
        </div>
        <div id="nav">
            <%@ include file="../frame/nav.jsp" %>
        </div>
        <div id="content ">
        	<div class="mr-250">       	
	            <h4 class="center">
	            <% 
	            if(resultCnt>0) {
	            	out.println("<script>alert('게시물이 성공적으로 저장되었습니다.'); location.replace('movieMain.jsp');</script>" );
	            } else {
	            	out.println("<script>alert('게시물 저장에 실패하였습니다.'); location.replace('movieMain.jsp');</script>");
	            }
	            %>
	            </h4>
            </div>
        </div>
        <div id="footer">
            <%@ include file="../frame/footer.jsp" %>
        </div>
    </div>
    </div>
</body>
</html>