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
		obj.setName(request.getParameter("id"));
		obj.setInfo(request.getParameter("txt").replaceAll("<br>", "\r\n"));
		obj.setTitle(request.getParameter("title"));
		obj.setNum(Integer.parseInt(request.getParameter("num")));
		obj.setAvgscore(Double.parseDouble(request.getParameter("reviewStar")));

		data.review_update(obj);
		response.sendRedirect("../Review_page.jsp");
	%>
</body>
</html>