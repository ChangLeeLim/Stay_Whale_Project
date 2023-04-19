<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

	String data = request.getParameter("att_num");
	request.setAttribute("data", data);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("ContentWrite.diary");
	dispatcher.forward(request, response);
	
%>



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>