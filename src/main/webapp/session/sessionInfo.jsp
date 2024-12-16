<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date time = new Date();
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<html>
<head>
<title>세션정보</title>
</head>
<body>
	세션ID:<%=session.getId()%><br>
	<%
	time.setTime(session.getCreationTime());
	%>
	세션생성시간:<%=formatter.format(time)%><br>
	<!-- 브라우저를 끄고 다시 생성하면 세션이 다시 만들어지므로 생성시간도 현재시간으로 변경된다 -->
	<%
	time.setTime(session.getLastAccessedTime());
	%>
	최근접근시간:<%=formatter.format(time)%>
</body>
</html>