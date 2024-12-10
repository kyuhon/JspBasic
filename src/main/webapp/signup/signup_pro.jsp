<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 1.사용자정보를 가져온다 -->
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String pwdTest = request.getParameter("pwdtest");
String email = request.getParameter("email");
String name = request.getParameter("name");
String birth = request.getParameter("birth");
String message = "";
boolean isSuccess = false;

if (id != null && pwd != null && email != null && name != null && pwdTest != null) {
	if (!pwd.equals(pwdTest)) {
		message = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
	}
}
%>
<!-- 2.curd -->
<!-- 3.화면설계(자바코드로 해야되는데 -> jsp service함수에서 진행한다. -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>