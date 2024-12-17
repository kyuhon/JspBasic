<%@page import="java.util.HashMap"%>
<%@page import="co.kh.dev.actiontag.model.Customer"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	//curd 데이터베이스 조회를 한다음 request에 입력
	Customer customer = new Customer();
	customer.setName("kdj");
	customer.setEmail("kdj@naver.com");
	customer.setPhone("010-1234-5678");
	request.setAttribute("customer", customer);
	
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("name", "kdj");
	map.put("email", "kdj@naver.com");
	map.put("phone", "010-1234-5678");
	request.setAttribute("map", map);
	//request 받아서 진행한다.
	Customer ct = (Customer)request.getAttribute("customer");
	HashMap<String, String> map2 = (HashMap<String, String>)request.getAttribute("map");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>El Example</title>
</head>
<body>
	<ul>
		<li><%= ct.getName() %></li>
		<li><%= ct.getEmail() %></li>
		<li><%= ct.getPhone() %></li>
	</ul>
	<ul>
		<li>${customer.name}</li>
		<li>${customer.email}</li>
		<li>${customer.phone}</li>
	</ul>
	<ul>
		<li><%= map2.get("name") %></li>
		<li><%= map2.get("email") %></li>
		<li><%= map2.get("phone") %></li>
	</ul>
	<ul>
		<li>${map.name}</li>
		<li>${map.email}</li>
		<li>${map.phone}</li>
	</ul>
	<ul>
		<li>${map["name"]}</li>
		<li>${map["email"]}</li>
		<li>${map["phone"]}</li>
	</ul>
</body>
</html>