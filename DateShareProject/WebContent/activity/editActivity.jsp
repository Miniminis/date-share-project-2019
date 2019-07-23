<%@page import="dateShare.Model.LoginInfo"%>
<%@page import="dateShare.service.activity.EditActivityService"%>
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

	int u_num = 0;
	int a_num = 0;
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
				//(1) 파일형식이 아닌 경우 
				if (file.getFieldName().equals("a_title")) {
					a_title = file.getString("utf-8");
				} else if (file.getFieldName().equals("a_star")) {
					a_star = Integer.parseInt(file.getString("utf-8"));
				} else if (file.getFieldName().equals("a_content")) {
					a_content = file.getString("utf-8");
				} else if (file.getFieldName().equals("a_num")) {
					a_num = Integer.parseInt(file.getString("utf-8"));
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

	Activity actFile = new Activity(a_num, u_num, a_title, a_content, fileDBPath, a_star);

	EditActivityService service = EditActivityService.getInstance();
	int cnt = service.edit(actFile);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<script>
			alert('수정완료');
			location.href = "activityList.jsp";
		</script>
	</h1>
	<a href="activityList.jsp">목록보기</a>
</body>
</html>