<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	
	String id = (String)request.getParameter("user_id");
	String pass = (String)request.getParameter("user_pass");
	int check = 1;
	Connection conn = null;
	Statement stmt = null;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");//※이 구문에서 오류가 난다면 mysql-connector-java.jar의 버전을 확인해주세요.(최신버전일시 cj포함 구버전일시 cj미포함)
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb", "root", "1234"); //※본인 DB로 연결 및 ID, Password확인해주세요
		if(conn == null)
		{
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select user_id, password from sign_up where user_id ='"+id+"' AND password = '"+pass+"'");//본인 DB에 맞는 필드명, 테이블인지 확인해주세요.
		if(rs.next())
		{
			check = 0;
			// request.setAttribute("id", id);
			session.setAttribute("id", id);
		}
		out.println(check);
		// request.setAttribute("user_id", idList);
		// request.setAttribute("nickname", nicknameList);
		
		// RequestDispatcher dispatcher = request.getRequestDispatcher("Sign_Up.jsp");
		// // RequestDispatcher dispatcher = request.getRequestDispatcher("DataProcessUpdate.jsp");
		// dispatcher.forward(request, response);
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