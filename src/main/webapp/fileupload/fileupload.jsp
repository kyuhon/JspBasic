<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*"%>
<%
//String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
// 위는 톰캣 10버전에 사용됨 밑에는 9버전
// 1. 서버에서 업로드 진행해야할 순서 (업로드 경로를 적는다)
String uploadPath = request.getRealPath("upload");	//upload 경로
// 2. 업로드할 최대사이즈를 설정한다
int size = 10 * 1024 * 1024;	//10M 까지 허용
String name = "";
String subject = "";
String filename1 = "";
String filename2 = "";
String origfilename1 = "";
String origfilename2 = "";
try {
	// 3. MultipartRequest 객체생성을 시키고 매개변수(request, 업로드위치, 최대사이즈, encoding, 이름 재정)
	MultipartRequest multiRequest = new MultipartRequest(request, uploadPath, size, "UTF-8", new DefaultFileRenamePolicy());
	name = multiRequest.getParameter("name");
	subject = multiRequest.getParameter("subject");
	// 4. Enumeration files = multiRequest.getFileNames();
	Enumeration files = multiRequest.getFileNames();
	String file1 = (String) files.nextElement(); //String file1 = fileName2
	// 5. 업로드된 서버에서 저장된 이름가져온다. (테이블 저장되어야됨)
	filename1 = multiRequest.getFilesystemName(file1);	//서버에서 저장된 이름(DefaultFileRenamePolicy())
	// 6. 업로드된 사용자가 사용한 진짜이름을 가져온다 (테이블 저장되어야됨)
	origfilename1 = multiRequest.getOriginalFileName(file1);	//사용자의 작명이름
	
	String file2 = (String) files.nextElement();	//String file2 = fileName1
	filename2 = multiRequest.getFilesystemName(file2);
	origfilename2 = multiRequest.getOriginalFileName(file2);
	System.out.println(file1);
	System.out.println(file2);
	System.out.println(uploadPath);
} catch (Exception e) {
	e.printStackTrace();
}
%>
<html>
<body>
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>"> 
		<input type="hidden" name="subject" value="<%=subject%>"> 
		<input type="hidden" name="filename1" value="<%=filename1%>"> 
		<input type="hidden" name="filename2" value="<%=filename2%>"> 
		<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
		<input type="submit" values="전송">
	</form>
	<a href="#" onclick="javascript:filecheck.submit()"> 
	업로드 확인 및 다운로드 페이지 이동</a>
</body>
</html>