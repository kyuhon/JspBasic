<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
Date date = new Date();
%>
<HTML>
<HEAD>
<TITLE>표현언어의 사용예제</TITLE>
</HEAD>
<BODY>
	<H3>파라미터값 처리</H3>
	<h4>오늘은= <%= formatter.format(date) %></h4>
	<h4>오늘은= ${formatter.format(date)}</h4> 
	<!-- $는 자바유틸 사용안됨 사용할려면 3단계를 거쳐야한다 -->
	<br></br>
	<FORM action="elexam3.jsp" method="post">
		이름 : <input type="text" name="name" value="${param['name']}">
		<input type="submit" value="확인">
	</FORM>
	<P>이름은: ${param.name} 입니다.</P>
	<P>이름은: ${param["name"]} 입니다.</P>
</BODY>
</HTML>