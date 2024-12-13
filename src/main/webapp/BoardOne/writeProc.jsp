<%@page import="co.kh.dev.boardone.model.BoardDAO"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!-- 사용자정보 -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="vo" scope="page" class="co.kh.dev.boardone.model.BoardVO">
<jsp:setProperty name="vo" property="*"/>
</jsp:useBean>
<!-- curd -->
<%
    vo.setRegdate(new Timestamp(System.currentTimeMillis()) );
    vo.setIp(request.getRemoteAddr());
    BoardDAO bdao = BoardDAO.getInstance();
    boolean flag = bdao.insertDB(vo);
    if(flag == true){
    response.sendRedirect("list.jsp");
    } else {
    	%>
    	<script>
    		alert("게시판글등록이 실패되었습니다.");
    		history.go(-1);
    	</script>
 <%
    }
 %>
<!-- 화면출력 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>