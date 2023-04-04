<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" type="text/css" href="css\login.css">
</head>

<body>

<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	ArrayList<String> idList = new ArrayList<String>();
	ArrayList<String> nicknameList = new ArrayList<String>();

	Connection conn = null;
	Statement stmt = null;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb", "root", "1234");
		if(conn == null)
		{
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select user_id, nickname from sign_up");//값을 가져올때 쓰는 것이 ResultSet
		while(rs.next())
		{
			idList.add(rs.getString("user_id"));		
			nicknameList.add(rs.getString("nickname"));
		}

		request.setAttribute("user_id", idList);
		request.setAttribute("nickname", nicknameList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_Up.jsp");
		// RequestDispatcher dispatcher = request.getRequestDispatcher("DataProcessUpdate.jsp");
		dispatcher.forward(request, response);
	}
	finally
	{
		try
		{
			stmt.close();
		}
		catch(Exception ignored)
		{

		}
		try
		{
			conn.close();
		}
		catch(Exception ignored)
		{

		}
	}
%>

</body>
</html>