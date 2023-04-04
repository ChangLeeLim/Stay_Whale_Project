<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/location_search.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/location_search.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>ID Search</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		String idStr = request.getParameter("id");
	%>
	<%
		if(id == null) {
	%>
		<jsp:include page="Header_Login_Fail.jsp" >
			<jsp:param name="id" value="<%= id%>"/>
		</jsp:include>
	<%
	} else {
	%>
		<jsp:include page="Header_Login_Success.jsp"/>
	<%
	}
	%>
	<section>
		<div class="top"></div>
		<div><h1 style="font-family: 'Lobster', cursive;">ID Search</h1></div>
		
		<table>
			<tr id="pyo_title">
				<td id="num">No</td>
				<td id="title">제 목</td>
				<td id="date">작성 날짜</td>
				<td id="loca">여행지</td>
				<td id="avs">평 점</td>
				<td id="writer">작성자</td>
			</tr>
			<%
				ArrayList<Writer> arr = data.id_search(idStr);
				for(int i=0; i<arr.size(); i++) {
				out.println("<tr id='data_pyo'>");
				out.println("<td class='review_num'>" + arr.get(i).getNum() + "</td>");
				out.println("<td class='review_title' style='cursor: pointer;'>" + arr.get(i).getTitle() + "</td>");
				out.println("<td>" + arr.get(i).getWritedate() + "</td>");
				out.println("<td>" + arr.get(i).getTravellocation() + "</td>");
				out.println("<td>" + "✪ " + arr.get(i).getAvgscore() + "</td>");
				out.println("<td>" + arr.get(i).getName() + "</td>");
				out.println("</tr>");
				}
			%>
		</table>
			<div id="search_wrap">
				<select id="search_selec">
					<option>제목</option>
					<option>여행지</option>
					<option>작성자</option>
				</select>
				<input id="search_box" type="text" placeholder="검 색">
				<img id="search_icon" src="image/review_search_icon.png" onclick="searching()">
			</div>
			<div id="wri_bt">
				<button type="button" class="custom-btn btn-5" onclick="location.href='Review_page.jsp'">뒤로가기</button>
				<button type="button" class="custom-btn btn-5" onclick="location.href='Review_text.jsp'">Review 작성</button>
			</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>