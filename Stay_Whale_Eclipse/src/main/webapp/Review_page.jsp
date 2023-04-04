<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DTO.Writer"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/review_page.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/review_page.js"></script>

<meta charset="UTF-8">
<title>StayWhale | Review</title>
</head>
<body>
	<jsp:useBean id="data" class="DAO.DataProcess_Review"> </jsp:useBean>
	<jsp:useBean id="obj" class="DTO.Writer"> </jsp:useBean>
	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("id");
		
		String val = request.getParameter("val");
		String str = request.getParameter("str");
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
	<section class="section_wrap" style="width:0px; height: 0px;"></section>
	<section>
		<div id="big_title"><h1 style="font-family: 'Lobster', cursive;">Review</h1></div>
		<table style="">
			<tr id="pyo_title">
				<td id="num">No</td>
				<td id="title">제 목</td>
				<td id="date">작성 날짜</td>
				<td id="loca">여행지</td>
				<td id="avs">평 점</td>
				<td id="writer">작성자</td>
			</tr>
			<%	
				if(val == null) {
				ArrayList<Writer> arr = data.review_check();
				for(int i=0; i<arr.size(); i++) {
					out.println("<tr id='data_pyo'>");
					out.println("<td class='review_num'>" + arr.get(i).getNum() + "</td>");
					out.println("<td class='review_title' style='cursor: pointer;'>" + arr.get(i).getTitle() + "</td>");
					out.println("<td class='write_day'>" + arr.get(i).getWritedate() + "</td>");
					out.println("<td class='location'>" + arr.get(i).getTravellocation() + "</td>");
					if(arr.get(i).getAvgscore() == 2.0) {
						out.println("<td class='avgscore'>" + "★" + "</td>");
					} else if(arr.get(i).getAvgscore() == 4.0) {
						out.println("<td class='avgscore'>" + "★★" + "</td>");
					} else if(arr.get(i).getAvgscore() == 6.0) {
						out.println("<td class='avgscore'>" + "★★★" + "</td>");
					} else if(arr.get(i).getAvgscore() == 8.0) {
						out.println("<td class='avgscore'>" + "★★★★" + "</td>");
					} else if(arr.get(i).getAvgscore() == 10.0) {
						out.println("<td class='avgscore'>" + "★★★★★" + "</td>");
					}
					out.println("<td class='id'>" + arr.get(i).getName() + "</td>");
					out.println("</tr>");
					}
				} else {
					ArrayList<Writer> arr_search = data.review_search(val, str);
					for(int i=0; i<arr_search.size(); i++) {
						out.println("<tr id='data_pyo'>");
						out.println("<td class='review_num'>" + arr_search.get(i).getNum() + "</td>");
						out.println("<td class='review_title' style='cursor: pointer;'>" + arr_search.get(i).getTitle() + "</td>");
						out.println("<td class='write_day'>" + arr_search.get(i).getWritedate() + "</td>");
						out.println("<td>" + arr_search.get(i).getTravellocation() + "</td>");
						out.println("<td>" + "✪ " + arr_search.get(i).getAvgscore() + "</td>");
						out.println("<td class='id'>" + arr_search.get(i).getName() + "</td>");
						out.println("</tr>");
					}
				}
			%>
		</table>
			<div id="search_wrap">
				<div id="next_wrap">
					<div id="next_page"><img src="image/left_icon.png"> 1 2 3 4 5 <img src="image/right_icon.png"></div>
				</div>
				<div id="che_wrap">
					<div id="search_div">
						<select id="search_selec">
							<option>제목</option>
							<option>여행지</option>
							<option>작성자</option>
						</select>
						<input id="search_box" type="text" placeholder="검 색">
						<img id="search_icon" src="image/review_search_icon.png">
					</div>
				</div>
				<div id="wri_bt">
					<button type="button" class="custom-btn btn-5" onclick="location.href='Review_text.jsp'">Review 작성</button>
				</div>
			</div>
			
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>