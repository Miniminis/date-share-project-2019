<%@page import="dateShare.Model.Activity"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="dateShare.service.activity.WriteActivityService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="activity" class="dateShare.Model.Activity" />
<jsp:setProperty property="*" name="activity" />
<%
	/* WriteActivityService service = WriteActivityService.getInstance();
	int cnt = service.write(activity); */
%>
<%
	int u_num= 0;
	String a_title = "";
	String a_path = "";
	int a_star = 0;
	String a_content = "";
	String saveFileName = "";
	String uploadPath = "/images";
	String dir = request.getSession().getServletContext().getRealPath(uploadPath);
	String fileDBPath = "";

	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (isMultipart) {

		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		List<FileItem> files = upload.parseRequest(request);

		Iterator<FileItem> itr = files.iterator();

		while (itr.hasNext()) {
			FileItem file = itr.next();

			if (file.isFormField()) {
		// 타입이 파일이 아닌경우
				if (file.getFieldName().equals("a_title")) {
					a_title = file.getString("utf-8");
				} else if (file.getFieldName().equals("a_star")) {
					a_star = Integer.parseInt(file.getString("utf-8"));
				} else if (file.getFieldName().equals("a_content")) {
					a_content = file.getString("utf-8");
				} else if (file.getFieldName().equals("u_num")) {
					u_num = Integer.parseInt(file.getString("utf-8"));
				} 
			} else {
				//(2) 파일형식인 경우 --> 파일 경로 분기처리 : 1. 파일이 있는 경우 2. 파일이 없는 경우
				if (file.getFieldName().equals("a_path")) {
					a_path = file.getName();

					saveFileName = System.nanoTime() + "_" + a_path;
					file.write(new File(dir, saveFileName));

					fileDBPath = "../images/" + saveFileName;

					if (a_path.equals(null) || a_path.equals("")) {
						fileDBPath = "../images/noImg.png";
					}
				}
			}
		}

	}

	Activity actFile = new Activity(u_num, a_title, a_content, fileDBPath, a_star);

	WriteActivityService service = WriteActivityService.getInstance();
	int cnt = service.write(actFile);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
	<%-- <%= actFile.getA_title() %>
	<%= cnt %> --%>
		<%= cnt > 0 ? "게시글을 작성하였습니다" : "게시글 작성 실패" %>
	</h1>
	<a href="activityList.jsp">목록보기</a>
</body>
</html>