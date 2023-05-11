<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int post_Num = Integer.parseInt(request.getParameter("post_Num"));

	out.println(post_Num);
	
	response.sendRedirect("delete.diary?post_Num="+post_Num); // 안녕
%>