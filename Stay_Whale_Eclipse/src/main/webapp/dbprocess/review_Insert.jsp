<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		obj.setTitle(request.getParameter("title"));
		obj.setTravellocation(request.getParameter("travellocation"));
		obj.setAvgscore(Double.parseDouble(request.getParameter("reviewStar")));
		obj.setName(request.getParameter("id"));
		obj.setInfo(request.getParameter("txt").replace("\r\n","<br>"));
	
		data.review_insert(obj);
		response.sendRedirect("../Review_page.jsp");
	%>
</body>
</html>