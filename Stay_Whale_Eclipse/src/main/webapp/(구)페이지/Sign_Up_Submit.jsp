<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("UTF-8");%>

<%
	String id = request.getParameter("user_id");
	String email = id + "@naver.com";
	String pass = request.getParameter("user_pass");
	String name = request.getParameter("user_name");
	String nickname = request.getParameter("user_nickname");
	String birth_year = request.getParameter("birth_year");
	String birth_month = request.getParameter("birth_month");
	String birth_day = request.getParameter("birth_day");
	String birth = birth_year + "." + birth_month + "." + birth_day;
	String gender = request.getParameter("gender");
	String phone = request.getParameter("hp1");
	String e_phone = request.getParameter("e_hp1");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address = address1 + " " + address2;

	Connection conn = null;
	Statement stmt = null;
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");//※이 구문에서 오류가 난다면 mysql-connector-java.jar의 버전을 확인해주세요.(최신버전일시 cj포함 구버전일시 cj미포함)
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websitedb", "root", "1234");//※본인 DB로 연결 및 ID, PassWord확인해주세요.
		if(conn == null)
		{
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		}
		stmt = conn.createStatement();
		String command = String.format("insert into sign_up (user_id, hp, email, password, emer_hp, name, nickname, address, birth, gender) values ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')", id, phone, email, pass, e_phone, name, nickname, address, birth, gender); //※본인 DB에 맞는 필드명, 테이블인지 확인해주세요.
		int rowNum = stmt.executeUpdate(command); //rowNum에는 Query '변수' OK에 해당하는 변수를 담아둠
		if(rowNum < 1)
		{
			throw new Exception("데이터가 존재하지 않아서 입력 불가");
		}
		response.sendRedirect("../Login.jsp");
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

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>데이터 처리</title>
</head>
<body>
	
</body>
</html>